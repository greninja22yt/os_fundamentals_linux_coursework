#!/bin/bash
#shreya didi i took help of gemini,stackoverflow,yt here.... -_-
echo "Enter a Length"
read n
while [[ ! "$n" =~ ^[1-9][0-9]*$ ]]; do
    read -p "Invalid input. Please enter a positive integer: " n
done
p=$(tr -dc 'a-zA-Z0-9' </dev/urandom | head -c "$n")
special_chars='!@#$%^&*()-_=+[]{};:,.<>?'
special_char_1=$(echo "$special_chars" | fold -w1 | shuf | head -n1)
special_char_2=$(echo "$special_chars" | fold -w1 | shuf | head -n1)
p="${p}${special_char_1}${special_char_2}"

# am copying the first program code here ..... :)
score=0
if [ ${#p} -ge 8 ]; then
    ((score =score + 2))
    echo "Your password has more than 8 characters"
else
    echo "Less than 8 characters"
fi

case "$p" in
    *[A-Z]*)
        echo "Password contains a uppercase letter."
        ((score = score + 2))
        ;;
    *)
        echo "No uppercase letter found."
        ;;
esac


case "$p" in
    *[a-z]*)
        echo "Password contains a lowercase letter."
        ((score = score + 2))
        ;;
    *)
        echo "No lowercase letter found."
        ;;
esac

if [[ $p =~ [0-9] ]]; then
    ((score = score + 2))
fi
echo "Having atleast one numeric character"

special_chars="[^a-zA-Z0-9]"

special_char_count=$(echo "$p" | grep -o "$special_chars" | wc -l)

if [[ $special_char_count -ge 2 ]]; then
  echo "Password contains at least two special characters."
  ((score = score + 2))
else
  echo "Password does not contain at least two special characters."
fi

echo " "
echo "Your Password score: $score/10"
echo "Your Password="$p
echo "Password length="$n
