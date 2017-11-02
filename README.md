# Parker Team Player Quiz 

## Description

This application will allow students to digitally take the Parker Team Player Style quiz and see their score for each Team Player category. The students can then write a reflection of their results. Students will be able to take the quiz multiple times and write a reflection. Students will be able to view their own results and reflections for all the quizzes they have taken. Administrators can organize students to see all the results of one class. The administrator will also be able to export the results of each class. 

## Minimum Viable Product

Our application has a student interface and an admin interface. In the student interface students have the ability to take the quiz and to see their own results. On each student’s dedicated page they can see all of their past results and corresponding reflections written by them. In the admin interface, the admin will have the ability to view all the results from students in different classes, and they will have the ability to export all the student data for a specific class.
 
The students will be organized into classes created by the admin. This allows the admin to view all the students in a specific class. The students will not have the ability to create a class or put other students, including themselves, into a class. This feature will only be implemented in the admin interface. The class will have the ID numbers of all the students that belong to the class. This should allow us to access the data for all the students.

On the admin interface, the admin will first see a page where they must enter a password. They will then be redirected to a page that has all their classes. They will be able to click on a class and be redirected to that class page. They will also be able to click somewhere on the page with all the classes, to create a new class and then add students to the class. For a specific class page, the admin will see a table of all the names of the students in the class with their most recent quiz results and most recent reflection. The admin can then click on a student and they will be redirected to the unique student page where they can see all the past results for that student. The admin will also be able to click a button to export all the data for a specific class. 
	
On the student interface, the student will first see a page where they are prompted to enter their student ID. They will then be redirected to their own unique student page. The student will see all their quiz results and all their reflections. They should be sorted so that the student can quickly see their most recent quiz results and reflection. The student will also have a button that they can press to take/retake the quiz. They will also have a button to submit a new reflection. Both buttons will redirect the students to different pages. The take/retake quiz button will redirect them to a page where they will be able to take the quiz. The new reflection button will redirect them to a page where they will be able to write their reflection.


## Requirements

* [Ruby 2.3+](https://www.ruby-lang.org/en/)
* [Rails 5+](http://rubyonrails.org)

## Run on localhost
First you will need to clone the project and go into its directory.  
```git clone https://github.com/famendola1/Worksheet-Digitalization.git && cd Worksheet-Digitalization```

Next, run the following commands:
* ```bundle install```, installs the necessary Ruby gems if not installed
* ```rake assets:precompile```, precomiles javascript, stylesheets, etc.

Now, to use the app, run ```rails server``` and navigate to localhost:3000 in your browser of choice.
