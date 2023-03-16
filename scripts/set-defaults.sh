defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool "false" # VSCode Vim 바인딩 연속 입력 되도록 처리
defaults write co.zeit.hyper ApplePressAndHoldEnabled -bool "false"        # hyper 연속 입력 활성화
defaults write com.apple.dock "autohide" -bool "true"                      # Dock 자동 숨김
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"         # 디렉토리를 상단에 정렬

# 메뉴바 시계
defaults write com.apple.menuextra.clock "ShowAMPM" -bool "true"
defaults write com.apple.menuextra.clock "ShowDate" -bool "true"
defaults write com.apple.menuextra.clock "ShowDayOfWeek" -bool "true"

defaults write 'Apple Global Domain' KeyRepeat "2"                           # 키반복 속도
defaults write 'Apple Global Domain' InitialKeyRepeat "15"                   # 반복 지연 시간
defaults write "Apple Global Domain" com.apple.keyboard.fnState -bool "true" # Fn 키 사용
defaults write "Apple Global Domain" AppleScrollerPagingBehavior "1"         # 스크롤 막대에서 클릭 지점으로 이동

defaults write com.apple.dock wvous-br-corner "1" # 핫코너 제거
