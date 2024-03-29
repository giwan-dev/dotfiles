# dotfiles

macOS에서 git을 사용하려면 developer tools를 설치해야 합니다.

```sh
xcode-select --install
```

[GUI를 사용할 수 없다면?](https://gist.github.com/mokagio/b974620ee8dcf5c0671f?permalink_comment_id=3962115#gistcomment-3962115)

ssh key를 생성하세요.

```sh
# In ~
mkdir .ssh
cd .ssh
ssk-keygen
```

생성한 `*.pub` 파일의 내용을 [GitHub에 추가](https://github.com/settings/ssh/new)하세요.

이 저장소를 home 디렉토리에 클론하세요.

```sh
# In ~
git clone git@github.com:giwan-dev/dotfiles.git --recursive
```

[Homebrew](https://brew.sh)를 설치하세요.

[nvm](https://github.com/nvm-sh/nvm#install--update-script)을 설치하세요.

스크립트를 실행하세요.

```sh
~/dotfiles/init.sh
```

### 설치가 필요한 것

- [D2Coding font](https://github.com/naver/d2codingfont#%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C)

### 참고

- [macOS defaults](https://macos-defaults.com)