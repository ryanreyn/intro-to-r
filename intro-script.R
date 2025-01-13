# Running basic commands, how to store commands as variables, and the basics of numerical operations ----
#--------------------------------#

#Try printing "Hello World" to the console output

print("Hello World")

#Now we can try storing the above command as a variable called "statement". When we run this, do we see anything in the console output?

statement<-print("Hello World")

#Now try running the variable "statement" as a command itself. Now what do we see in the console output?

statement

#There are many different data types that RStudio uses to help keep track of how to interpret different pieces of information we provide it. One common type is integer/numeric. Numbers that are not contatined within quotes are typically interpeted as an integer/numeric data type and can be manipulated with typical arithmetic. Try running the following lines to see how to use numeric data, and how to create numeric variables.

#NOTE: As you'll see throughout this document, RStudio will not print operations such as 2+2 to the screen by default when you run them so we use the "print" command to make it do so. If you want to try this, add just the line 2+2 below and try running it.

print(2+2)
print(2-5)
print(2*7)
print(2/3)

#Running this last command outputs our first instance of a numeric data type called a double, which is what we call non-integer numeric data (numbers with decimal points)


#We can create a variable "a" whose value is the integer 2. Now anytime we use "a" the computer will substitute the integer 2 for us

a<-2

print(a)
#Using print() or running a variable as a command are equivalent in RStudio

#Now we can use "a" as a placeholder for 2 to do arithmetic in the same way as we were above

print(a+2)
print(a-5)
print(a*7)
print(a/3)

#If we create another variable "b" to be the number 4, we can now do arithmetic without actually typing any numbers out. Now we could write new statements changing the variables "a" and "b" without tediously rewriting all of the mathematics below.

b<-4

print(a+b)
print(a-b)
print(a*b)
print(a/b)


# Determining your working directory, and how to change it ---- 
#--------------------------------#

#Get the current working directory that RStudio is using as its current homebase when looking for files

getwd()

#Save this as a variable, "curr_directory" just in case we want to send it back to this directory while we play around with different options
#And yes, you can store just about anything as a variable, in this case RStudio will remember that "curr_directory" is a string data type object that contains the filepath to your working directory (the output of the getwd() command)

curr_directory<-getwd()

#Now let's try setting the working directory to the string "~". This may seem like a funky choice, but ~ is another special character in our human to computer syntax that tells RStudio to go to the root of your home directory where all your files originate

setwd("~")

#And now if we run getwd() we'll see that we've relocated RStudio to your home directory (NOTE: this usually isn't called ~ and has a name such as Users/<your-name> on Mac).

getwd()

#Learning how to install and load packages in order to do more complex operations in RStudio ----
#--------------------------------#

#We can install various packages, which give us access to more pre-built functions, as well as new and powerful syntax for telling the computer to do more complicated operations for us.

install.packages("datasets")
install.packages("tidyverse")
#NOTE: you only need to install packages one time, so it is generally recommended to run these commands in the console below, rather than put them directly in a script as I have done here.

#Once we have our packages installed, we can let RStudio know that we want access to them in this script using the library() function

#The package datasets gives us access to some nice pre-built dataframes that we can mess around with.
library(datasets)

#The package tidyverse is an extremely powerful package that allows us to manipulate dataframes in much more advanced ways using new syntax and functions.
library(tidyverse)

#Creating a vector, loading a dataframe, and manipulating these more complicated data structures ----
#--------------------------------#

#We can define our own vectors using the c() command, which lets us give RStudio a list of items (separated by commas) that we want stored together as one variable

first.vector<-c(1,2,4,1,3,6,5,1)

print(first.vector)

#We can perform different numerical operations on this vector as well.

sum(first.vector)
mean(first.vector)

#We can also index vectors to look at specific elements. RStudio is a language that helpfully starts its counting from 1 to be more compatible with how we count (other languages like Python start from 0 and are more computer oriented). Indexing in RStudio is done using a pair of brackets, []. Let's look at some of the elements of the vector we made ourselves

print(first.vector[1])
print(first.vecotr[5])

#One convenient shorthand in RStudio is that we can index the last element of a vector using a negative index, specifically -1. You can use other negative numbers to index backwards (e.g., -2 would index the second to last element) but people typically only use this for the last element
print(first.vector[-1])

#Now that we've loaded the datasets package, we can use a new function we have access to called data() to load the iris dataset.

data(iris)

#Run the variable iris as a command to take a peek at the dataframe's contents.

iris

#Dataframes are a very unique data type in RStudio with specific syntax. For example, you'll notice that in your preview of iris that there are names associated with each column of data. We can index these directly using the $ symbol.

iris$Species

#We can use the colnames() function to help us store the column names as a vector variable so we don't have to print the whole dataset every time we want to look at what columns we can index.

iris.cols<-colnames(iris)

print(iris.cols)

#We can also perform arithmetic on these columns. Cleverly, RStudio knows that when we give it a numerical operation to perform on a vector that it should do that operation on each value within that vector individually.

iris$Sepal.Width
iris$Sepal.Width+1

#Like with the vector we created earlier, we can perform more advanced numerical operations on the columns that we index from our dataframes.

mean(iris$Sepal.Width)
median(iris$Sepal.Width)

#With the tidyverse package loaded, we can also use pipes and special commands to manipulate our dataframes with high precision. Pipes, denoted by the special string %>% pass the output of one command to the next. Let's use these pipes and a new command filter() to look at petals from our dataset above a certain width.

iris%>%
  filter(Sepal.Width >= 3)
#RStudio will indent your lines nicely to help let you know when something is part of a pipe, or inside a command loop (next section)

#We could also filter our Species column for a certain species.

iris%>%
  filter(Species=="setosa")

#You can store these filtered sets (or "slices") as a variable to do further work on too.
setosa<-iris%>%
  filter(Species=="setosa")

# Basic if and for loops, as well as logical statements ----
#--------------------------------#

#Often in coding we need RStudio to scan through the elements of a vector and perform complicated operations using each of them. To do this we can use command loops with the special words "if" and "for" (as well as "while" but that's for a later date). Let's use our first vector to demonstrate these loops

print(first.vector)
for (element in first.vector){
  print(element)
}
#This loop takes each element of our vector (defined to the computer as the variable named "element") and prints them in sequence.

#Loops also rely on logical statements, which are ways that we can communicate with the computer about whether a statement we make is TRUE or FALSE. 

print(1==1)
print(4>2)
print(1>5)
print((2+2)==5)

#With loops, we can use logic to tell the computer only to perform an operation if a certain logical statement is true.

vec.length<-length(first.vector)

if (vec.length == 8){
  print("Yes, this vector has 8 elements!")
}

#With if statements we can also use "else" to let the computer know what to do when the logical statement in our if statement is not met (not evaluated as TRUE)

if (vec.length == 7){
  print("Yes, this vector has 7 elements!")
} else {
  print("Sorry, looks like this vector doesn't have 7 elements :(")
}

#We can also combine for and if loops together to make more complicated operations.

print(first.vector)

for (element in first.vector){
  #Store each element of the vector as you run through the loop to a nicely named variable.
  current.value<-first.vector[element]
  print(current.value)
  #Now use a nested if loop to check which elements of the vector have a value of 1.
  if (current.value == 1){
    print("This element of the vector has a value of 1!")
  } else {
    print("This element of the vector has a value different than 1 :(")
  }
}

#When we filtered the iris dataset above using the >= syntax, that was actually another exmaple of using a logical statement. Only the entries of iris where Sepal.Width >= 3 was labeled TRUE were kept in the output.




