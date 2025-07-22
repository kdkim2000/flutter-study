#!/bin/bash

# 파일 목록을 직접 입력 (또는 파일에서 읽을 수도 있음)
file_list=$(cat <<EOF
./lib/chapter_3/3_5_widget.dart
./lib/chapter_3/3_9_Count.dart
./lib/chapter_4/4_2_row_column.dart
./lib/chapter_4/4_6_Card.dart
./lib/chapter_4/4_9_Responsive.dart
./lib/chapter_4/4_Example.dart
./lib/chapter_5/5_3_State_Demo.dart
./lib/chapter_5/5_6_Provider.dart
./lib/chapter_5/5_Example_Count.dart
./lib/chapter_5/5_example_to_do.dart
./lib/chapter_6/6_2_Navigator.dart
./lib/chapter_6/6_3_Routes.dart
./lib/chapter_6/6_4_send_message.dart
./lib/chapter_6/6_6_to_do.dart
./lib/chapter_6/6_example_route.dart
./lib/chapter_7/7_5_url_launcher.dart
./lib/chapter_7/7_6_Intl.dart
./lib/chapter_7/7_8_1_Provider.dart
./lib/chapter_7/7_8_2_shared_preferences.dart
./lib/chapter_7/7_8_3_Http.dart
./lib/chapter_7/7_8_4_Dio.dart
./lib/chapter_7/7_8_5_Intl.dart
./lib/chapter_7/7_8_6_url_launcher.dart
./lib/chapter_7/7_8_7_image_picker.dart
./lib/chapter_7/7_8_8_Svg.dart
./lib/chapter_7/7_8_9_image_cache.dart
./lib/chapter_7/7_Example_Count.dart
./lib/chapter_7/7_Example_Image.dart
./lib/chapter_8/8_5_todo.dart
./lib/chapter_9/add_todo_dialog.dart
./lib/chapter_9/firebase_options.dart
./lib/chapter_9/firebase_options.example.dart
./lib/chapter_9/main.dart
./lib/chapter_9/todo_item.dart
./lib/chapter_9/todo_list_page.dart
./lib/main.dart
EOF
)

# snake_case 검사: 대문자 또는 하이픈, 공백 포함 여부
is_snake_case() {
  [[ "$1" =~ ^[a-z0-9_/.]+$ ]]
}

# snake_case로 변환
to_snake_case() {
  local filename=$(basename "$1")
  local dirname=$(dirname "$1")

  # 변환: 대문자 → _소문자, 공백 및 하이픈 → _
  local snake=$(echo "$filename" | \
    sed -r 's/([A-Z])/_\L\1/g' | \
    sed -r 's/[-\s]/_/g' | \
    sed -r 's/__+/_/g' | \
    sed -r 's/^_//' | \
    tr 'A-Z' 'a-z')

  echo "$dirname/$snake"
}

# 실제 이름 변경
for file in $file_list; do
  if ! is_snake_case "$file"; then
    new_file=$(to_snake_case "$file")
    if [[ "$file" != "$new_file" ]]; then
      echo "Renaming: $file -> $new_file"
      mv "$file" "$new_file"
    fi
  fi
done


