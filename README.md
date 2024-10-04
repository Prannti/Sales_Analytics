Steps to access the data :-> 


step 1 Add MysSql connection using the "+" sign as shown in the image:


![image](https://github.com/user-attachments/assets/d151fc20-5478-4365-a6b0-0837dcea8915)

Step 2: From the server we will import the data using imort option.


![image](https://github.com/user-attachments/assets/fae39c80-e46a-48f5-85c8-b49cae40e4a4)



![image](https://github.com/user-attachments/assets/4a4bcd54-5a26-4e3d-ac68-02ce8b475bb5)


Step 3: locate the db_dump.sql in the system after downloading it in the repository and import the data :

![image](https://github.com/user-attachments/assets/0dda6edd-0845-43dd-86af-a632b1e82c8c)


Step 4: Now you can use sql commands to understand the data and proactice the basics of it.




Step5: Before analysis we will be doing the cleaning of the data , we will do it with the help of powerBI

A. We will get data in powerBI 



![image](https://github.com/user-attachments/assets/43db7673-2e14-427e-80e2-5257b0cc4a18)


![image](https://github.com/user-attachments/assets/a47d90a4-3d83-4b62-9f6c-33700aa60a05)


![image](https://github.com/user-attachments/assets/ac0b2b70-df06-49e7-940b-5ccaf13b9c51)




B.As we go to the see tge model of the tables we will see that it has already made the relation on its own.


![image](https://github.com/user-attachments/assets/3ff61f6a-3676-4747-a93c-4bc7a714d288)


C. We can also establish relationship between them by creating connection between the tables as shown in the image.(Data Modeling)


![image](https://github.com/user-attachments/assets/f0a598aa-401f-4f34-8a4e-39e6c175459f)


As we can observe that the star schema can be formed between these tables , as sales transaction has all the common records. You can drag the records from one table to another to make the relation.So transaction table is the fact table , whereas others are dimension tables connectd to fact table.

D. Now in my market table we will filter 'New York' and 'USA' since we will be focusing on the analysis within India.


![image](https://github.com/user-attachments/assets/30a8afdd-34d0-434c-8429-3f656264a334)

for that we will go to the transform data:


![image](https://github.com/user-attachments/assets/dfe33aef-5b28-4c78-b836-1227c47d18c8)


![image](https://github.com/user-attachments/assets/5e0e5bbd-c8be-4ca3-a1b5-22dd9a7c7014)


for removing 'USA' and 'New York' either you can use filters or we can just remove the blank entries too.


![image](https://github.com/user-attachments/assets/2fd29600-a278-4bc0-8e61-a7da114b64f6)

![image](https://github.com/user-attachments/assets/4a0daa61-641d-424b-82a7-6e2e96f8cc14)

![image](https://github.com/user-attachments/assets/20b91cc5-5f95-4b45-bbf9-6fda5ce1beb9)


D. Now in transaction tables some sales amount are having negative values you can find then number of such tuples by using below command on MySql

![image](https://github.com/user-attachments/assets/617608d8-8f1c-4f1d-b7e8-097358197f40)

![image](https://github.com/user-attachments/assets/0bae7669-c87a-4cb5-b805-b2cfd92fe114)


we will filter all the rows that have 0 or negative sales amount as in below image

![image](https://github.com/user-attachments/assets/57f1b6e0-c883-4ccd-8efd-9f24c4a677c6)


E. Now in transaction table only there are some transactions that are in 'USD' we need to convert them in 'INR' for furthere analysis ( For doing that we will be making another column[Nor_sales] in which we will have currency only in INR)

![image](https://github.com/user-attachments/assets/cb071266-1496-4bb9-aa5f-f5937cd66212)

use custom colums to add the column


![image](https://github.com/user-attachments/assets/376f6875-c760-4e16-86b3-111792e9ca1d)

now we made the colums as shown in the image

![image](https://github.com/user-attachments/assets/680b8c56-a49c-4533-b0f3-277f1eb6922b)


make changes in the query so that we can get out desired amount in 'INR' .Formul  used is as below:
= Table.AddColumn(#"Filtered Rows", "Norm_sales_amount", each if [currency] = "USD" or [currency]="USD#(cr)" then [sales_amount]*75 else [sales_amount])

![image](https://github.com/user-attachments/assets/c96666a3-28da-46b6-b8a7-280a311e9534)



F.We have some duplicates in the data now we will be handling them

![image](https://github.com/user-attachments/assets/1a480706-3f75-4692-ae09-9897ffa9c90c)
select distinct(transactions.currency) from transactions;
this query will give us uniques currencies. On running the command we got to know we have INR being duplicated 
On observing that some are using 'INR' whereas some are using 'INR\r' , so we can check how many are using on of these using below query:


Select count(*) from transactions where transactions.currency='INR\r';


![image](https://github.com/user-attachments/assets/668c6225-4c32-4dfc-9545-bd034283e269)



Now Apply all the changes.


Step 6: Now go back to powerBI and select 'Enter Data' and give an entry with name 'Base Measures' (use it to plot different UI elements )
Step 7: Makes dashboard using various visualizations


![image](https://github.com/user-attachments/assets/a4e7d2e7-edf7-49e2-b757-455e2ba79bb8)



![image](https://github.com/user-attachments/assets/7abd5c16-cdec-422d-a60d-f36667286654)



![image](https://github.com/user-attachments/assets/dc7cca8c-a7d1-4810-9709-aad855a88eb3)
