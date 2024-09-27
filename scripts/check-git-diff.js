#!/usr/bin/env node

/**
 * 환경변수
 * - CHECK_GIT_DIFF_LINE_THRESHOLD: 라인 수 쓰레숄드를 설정합니다.
 */

const { exec } = require("child_process");

const reset = "\x1b[0m";
const bright = "\x1b[1m";
const dim = "\x1b[2m";
const underscore = "\x1b[4m";
const blink = "\x1b[5m";
const reverse = "\x1b[7m";
const hidden = "\x1b[8m";

const black = "\x1b[30m";
const red = "\x1b[31m";
const green = "\x1b[32m";
const yellow = "\x1b[33m";
const blue = "\x1b[34m";
const magenta = "\x1b[35m";
const cyan = "\x1b[36m";
const white = "\x1b[37m";

const BGblack = "\x1b[40m";
const BGred = "\x1b[41m";
const BGgreen = "\x1b[42m";
const BGyellow = "\x1b[43m";
const BGblue = "\x1b[44m";
const BGmagenta = "\x1b[45m";
const BGcyan = "\x1b[46m";
const BGwhite = "\x1b[47m";

// TODO: glob으로 설정할 수 있도록 확장하기
const IGNORING_FILES = ["package-lock.json", "pnpm-lock.yaml"];

/**
 * 첫 번째 파라미터는 비교할 base 브랜치
 * 두 번째 파라미터는 최소 라인 변경 수
 * '--debug'는 더 많은 로그를 활성화
 */
function parseArguments() {
  const [, , ...rawArgs] = process.argv;
  const args = rawArgs.reduce((args, current) => {
    if (current === "--debug") {
      args.debug = true;
    } else if (args.base === undefined) {
      args.base = current;
    } else if (args.linesThreshold === undefined) {
      args.linesThreshold = current;
    }
    return args;
  }, {});

  const base = args.base;
  if (base === undefined) {
    logError("base 브랜치는 필수입니다.");
    process.exit(1);
  }
  const linesThreshold = parseInt(
    args.linesThreshold || process.env.CHECK_GIT_DIFF_LINE_THRESHOLD,
    10
  );
  if (Number.isNaN(linesThreshold)) {
    logError("라인 제한은 숫자 형식으로 입력하세요.");
    process.exit(1);
  }
  const debug = args.debug;

  return { base, linesThreshold, debug };
}

async function main({ base, linesThreshold, debug }) {
  const changedFiles = await gitGitDiffByFiles({ baseBranch: base, debug });
  if (changedFiles === undefined) {
    return;
  }

  const lineCount = changedFiles.reduce(
    (sum, { file, insertion, deletion }) => {
      if (checkIgnoringFile(file)) {
        return sum;
      }

      return sum + insertion + deletion;
    },
    0
  );

  if (lineCount > linesThreshold) {
    warn(
      `${lineCount} lines changed from ${base}, reaching threshold (${linesThreshold} lines).`
    );
    process.exit(1);
  } else {
    success(`${lineCount} lines changed from ${base}.`);
    process.exit(0);
  }
}

/**
 * git diff --numstat을 실행하고 그 결과를 파일 단위 어레이로 파싱하는 함수
 * @param {string} baseBranch
 * @returns {Promise<{ file: string, insertion: number, deletion: number }[]> | undefined}
 */
async function gitGitDiffByFiles({ baseBranch, debug }) {
  try {
    const result = await new Promise((resolve, reject) => {
      exec(`git diff --numstat ${baseBranch}`, (error, stdout) => {
        if (error !== null) {
          reject(error);
        } else {
          resolve(stdout);
        }
      });
    });

    const parseCount = (value) => {
      const parsed = parseInt(value, 10);
      if (Number.isNaN(parsed)) {
        if (debug === true) {
          logError(`Cannot parse ${value} as number`);
        }
        return undefined;
      }
      return parsed;
    };

    return result
      .split("\n")
      .filter((line) => !!line)
      .map((line) => line.split("\t"))
      .map(([insertion, deletion, file]) => ({
        file,
        insertion: parseCount(insertion),
        deletion: parseCount(deletion, 10),
      }))
      .filter(
        ({ insertion, deletion }) =>
          insertion !== undefined || deletion !== undefined
      );
  } catch (error) {
    logError(error);
    return undefined;
  }
}

/**
 * 주어진 이름의 파일을 무시해야 하는지 판단하는 함수
 * @param {string} 파일 이름
 * @returns {boolean}
 */
function checkIgnoringFile(file) {
  return IGNORING_FILES.includes(file);
}

function logError(message) {
  console.error(`${red}${message}${reset}`);
}

function warn(message) {
  console.warn(`${yellow}${message}${reset}`);
}

function success(message) {
  console.log(`${green}${message}${reset}`);
}

const args = parseArguments();
main(args);
