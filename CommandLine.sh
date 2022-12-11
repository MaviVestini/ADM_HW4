#! /bin/bash
# 1 Count how many transactions are in each location by adding 1 to to a list with indexes given by the locations
# then sort in reverse and print 
awk -F "," '{ c[$5]++;}; END{for(x in c) print c[x], x;}' bank_transactions.csv | sort -r -g | head

# 2v1 Similar to the previous point but we add the transaction amount and the indexed of the list are the genders 
awk -F ',' '{spent[$4]+=$9;}; END{for(x in spent) print spent[x], x;}' bank_transactions.csv |sort -r -g | grep 'F\|M' 

# 2v2 Like 2v1 but we get the average of huw much both genders spent by dividing by how many times they appear in the dataset 
awk -F ',' '{spent[$4]+=$9; count[$4]++;}; END{for(x in spent) print spent[x]/count[x], x;}' bank_transactions.csv |sort -r -g | grep 'F\|M' 

# 3 Create two lists both with indexes given by the CustomerID but the first sums the amount and the second how many transactions
awk -F ',' '{spent[$2]+=$9; count[$2]++;}; END{for(x in spent) print spent[x]/count[x], x;}' bank_transactions.csv |sort -r -g | head 

