# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
teacher = User.create(email:'teacher@nu.edu.pl', password: 'teacher', password_confirmation:'teacher', username:'teacher')
teacher.add_role :teacher

Category.create([{name:'Arts'},{name:'Biology'},{name:'Business & Managment'},{name:'Chemistry'},{name:'Computer Science'},{name:'Economics & Finance'},{name:'Education'},{name:'Food'},{name:'Law'},{name:'Mathematics'},{name:'Medicine'},{name:'Social Sciences'},{name:'Data Analysis'},{name:'Earth Science'}])
Category.create([{name: 'CS: Artificial Intelligence'},{name: 'CS: Software Engineering'},{name: 'CS: Systems & Security'},{name: 'CS: Theory'}])
# Category.create({name: 'CS: Artificial Intelligence', parent: cs},{name: 'CS: Software Engineering', parent: cs},{name: 'CS: Systems & Security', parent: cs},{name: 'CS: Theory', parent: cs})
medicine = Category.where(name: 'Medicine').first
business = Category.where(name: 'Business & Managment').first
education = Category.where(name: 'Education').first
cs = Category.where(name: 'Computer Science').first

description = '<h2 class="coursera-course-heading" style="box-sizing: border-box; margin: 10.5px 0px; font-family: sofiapro-light, Arial, sans-serif; font-weight: normal; line-height: 32px; color: #333333; text-rendering: optimizelegibility; font-size: 24px;" data-msg="coursera-course-about">About the Course</h2>
<div class="coursera-course-detail" style="box-sizing: border-box; margin: 10px auto 20px; clear: both; color: #5f5f5f; font-family: Helvetica, Arial, sans-serif; font-size: 14px; line-height: 21px;" data-user-generated="data-user-generated">Fantasy is a key term both in psychology and in the art and artifice of humanity. The things we make, including our stories, reflect, serve, and often shape our needs and desires. We see this everywhere from fairy tale to kiddie lit to myth; from "Cinderella" to&nbsp;<em style="box-sizing: border-box;">Alice in Wonderland&nbsp;</em>to&nbsp;<em style="box-sizing: border-box;">Superman</em>; from building a fort as a child to building ideal, planned cities as whole societies. Fantasy in ways both entertaining and practical serves our persistent needs and desires and illuminates the human mind. Fantasy expresses itself in many ways, from the comfort we feel in the godlike powers of a fairy godmother to the seductive unease we feel confronting Dracula. From a practical viewpoint, of all the fictional forms that fantasy takes, science fiction, from<em style="box-sizing: border-box;">Frankenstein</em>&nbsp;to&nbsp;<em style="box-sizing: border-box;">Avatar</em>, is the most important in our modern world because it is the only kind that explicitly recognizes the profound ways in which science and technology, those key products of the human mind, shape not only our world but our very hopes and fears. This course will explore Fantasy in general and Science Fiction in specific both as art and as insights into ourselves and our world.&nbsp;<br style="box-sizing: border-box;" /><br style="box-sizing: border-box;" />
<h2 style="box-sizing: border-box; margin: 10.5px 0px; font-family: sofiapro-light, Arial, sans-serif; font-weight: normal; line-height: 32px; color: inherit; text-rendering: optimizelegibility; font-size: 24px;">Work Expectations</h2>
For further information about the coursework, please see the&nbsp;<a style="box-sizing: border-box; color: #0367b0; text-decoration: none; cursor: pointer;" href="http://spark-public.s3.amazonaws.com/fantasysf/Documents/WorkExpectations.html">Work Expectations</a>page.</div>
<h2 class="coursera-course-heading" style="box-sizing: border-box; margin: 10.5px 0px; font-family: sofiapro-light, Arial, sans-serif; font-weight: normal; line-height: 32px; color: #333333; text-rendering: optimizelegibility; font-size: 24px; clear: both;" data-msg="coursera-course-syllabus">Course Syllabus</h2>
<div class="coursera-course-detail" style="box-sizing: border-box; margin: 10px auto 20px; clear: both; color: #5f5f5f; font-family:Helvetica, Arial, sans-serif; font-size: 14px; line-height: 21px;" data-user-generated="data-user-generated">This course comprises ten units. Each will include a significant reading, typically a novel or a selection of shorter works. I will offer video discussions of each of the readings and also of more general topics in art and psychology that those readings help illuminate. Each unit will include online quizzes and ask you to write a brief essay offering your own insights into the reading. In order, the units are:<ol style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10.5px 25px;">
<li style="box-sizing: border-box;">Grimm &mdash;&nbsp;<em style="box-sizing: border-box;">Children s and Household Tales</em></li>
<li style="box-sizing: border-box;">Carroll &mdash;&nbsp;<em style="box-sizing: border-box;">Alice s Adventures in Wonderland</em>&nbsp;and&nbsp;<em style="box-sizing: border-box;">Through the Looking-Glass</em></li>
<li style="box-sizing: border-box;">Stoker &mdash;&nbsp;<em style="box-sizing: border-box;">Dracula</em></li>
<li style="box-sizing: border-box;">Shelley &mdash;&nbsp;<em style="box-sizing: border-box;">Frankenstein</em></li>
<li style="box-sizing: border-box;">Hawthorne &amp; Poe &mdash; Stories and Poems</li>
<li style="box-sizing: border-box;">Wells &mdash;&nbsp;<em style="box-sizing: border-box;">The Island of Dr. Moreau</em>,&nbsp;<em style="box-sizing: border-box;">The Invisible Man</em>, "The Country of the Blind," "The Star"</li>
<li style="box-sizing: border-box;">Burroughs &amp; Gilman &mdash;&nbsp;<em style="box-sizing: border-box;">A Princess of Mars</em>&nbsp;&amp;&nbsp;<em style="box-sizing: border-box;">Herland</em></li>
<li style="box-sizing: border-box;">Bradbury &mdash;&nbsp;<em style="box-sizing: border-box;">The Martian Chronicles</em></li>
<li style="box-sizing: border-box;">LeGuin &mdash;&nbsp;<em style="box-sizing: border-box;">The Left Hand of Darkness</em></li>
<li style="box-sizing: border-box;">Doctorow &mdash;&nbsp;<em style="box-sizing: border-box;">Little Brother</em></li>
</ol></div>'

c1 = Course.create!(name:'Health for All Through Primary Health Care', description: description, categories: [medicine], status:'PUBLISHED')
c2 = Course.create!(name:'Model Thinking', description: description, categories: [education], status:'DRAFT')
c3 = Course.create!(name:'Instructional Methods in Health Education', description: description, categories: [medicine], status:'PUBLISHED')
c4 = Course.create!(name:'Introduction to Finance', description: description, categories: [business], status:'PUBLISHED')
c5 = Course.create!(name:'Property and Liability', description: description, categories: [business], status:'PUBLISHED')
c6 = Course.create!(name:'Introduction to Mathematical Thinking', description: description, categories: [cs], status:'PUBLISHED')
c7 = Course.create!(name:'Statistical Mechanics: Algorithms and Computations', description: description, categories: [cs], status:'PUBLISHED')
c8 = Course.create!(name:'Advanced Chemistry', description: description, categories: [medicine], status:'DRAFT')
c9 = Course.create!(name:'Beginning Game Programing C#', description: description, categories: [cs], status:'PUBLISHED')
c10 = Course.create!(name:'Preparing for AP Statistics Exam', description: description, categories: [cs], status:'PUBLISHED')
c11 = Course.create!(name:'Imagining Other Worlds', description: description, categories: [education], status:'PUBLISHED')
c12 = Course.create!(name:'Globalization of Business Enterprise', description: description, categories: [business], status:'PUBLISHED')


step_description = '<p><span style="color: #333333; font-family: Helvetica, Arial, sans-serif; font-size: 14px; line-height: 21px;">Leon Battista Alberti (1404-1472):&nbsp; Knowing Leon Battista Alberti and his architectures in Rimini, Florence and Mantua.</span></p>
<ul style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10.5px 25px; color: #333333; font-family: Helvetica, Arial, sans-serif; font-size: 14px; line-height: 21px;">
<li style="box-sizing: border-box;"><strong style="box-sizing: border-box;">Lecture #2.1</strong><strong style="box-sizing: border-box;">&nbsp;- Rimini, Tempio Malatestiano</strong></li>
<li style="box-sizing: border-box;"><strong style="box-sizing: border-box;">Lecture #2.2 -&nbsp;</strong><strong style="box-sizing: border-box;">Florence, the Rucellai Palace</strong></li>
<li style="box-sizing: border-box;"><strong style="box-sizing: border-box;">Lecture #2.3 - Florence, the fa&ccedil;ade of S. Maria Novella)</strong></li>
<li style="box-sizing: border-box;"><strong style="box-sizing: border-box;">Lecture #2.4 -&nbsp;</strong><strong style="box-sizing: border-box;">Mantua, the churches of S. Sebastiano and S. Andrea)</strong></li>
</ul>'

Course.all.each_with_index do |course,idx|

  course.logo = File.exists?("db/seed/images/#{idx}.png") ? File.open("db/seed/images/#{idx}.png") :  File.open("db/seed/images/#{idx}.jpg")
  course.save!

  teacher.add_role :moderator, course
  5.times.each do |idx|
    Step.create!(course:course, name: "Week #{idx}", description: step_description)
  end 
end

puts  "Courses created: #{Course.all.count}"

