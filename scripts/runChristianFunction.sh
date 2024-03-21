module load R

Rscript scripts/ChristianFunction.R

# make a for loop that prints the alphabet backwards

# Path: scripts/printAlphabet.sh
for letter in z y x w v u t s r q p o n m l k j i h g f e d c b a
do
  echo $letter
done