. vars/removes.sh

for element in ${removes[@]}
do
	rm -rf public_html__new/$element
done