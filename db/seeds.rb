# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
teacher = User.create(email:'teacher@nu.edu.pl', password: 'teacher', password_confirmation:'teacher', username:'Jame Frankies')
teacher2 = User.create(email:'teacher2@nu.edu.pl', password: 'password', password_confirmation:'password', username:'Tobby Novella')
teacher.add_role :teacher
teacher2.add_role :teacher

student1 = User.create(email:'student1@email.com', password: 'password', password_confirmation:'password', username:'jeremywilles')
student2 = User.create(email:'student2@email.com', password: 'password', password_confirmation:'password', username:'a2')
student3 = User.create(email:'student3@email.com', password: 'password', password_confirmation:'password', username:'igmarinee')
student4 = User.create(email:'student4@email.com', password: 'password', password_confirmation:'password', username:'rosandlin ahemaki')
student5 = User.create(email:'student5@email.com', password: 'password', password_confirmation:'password', username:'TryGit')

User.all.each_with_index do |user,idx|
  user.avatar = File.open("db/seed/images/faces/#{idx+1}.jpeg")
  user.save!
end



Category.create([{name:'Arts'},{name:'Biology'},{name:'Business & Managment'},{name:'Chemistry'},{name:'Computer Science'},{name:'Economics & Finance'},{name:'Education'},{name:'Food'},{name:'Law'},{name:'Mathematics'},{name:'Medicine'},{name:'Social Sciences'},{name:'Data Analysis'},{name:'Earth Science'}])
Category.create([{name: 'CS: Artificial Intelligence'},{name: 'CS: Software Engineering'},{name: 'CS: Systems & Security'},{name: 'CS: Theory'}])
# Category.create({name: 'CS: Artificial Intelligence', parent: cs},{name: 'CS: Software Engineering', parent: cs},{name: 'CS: Systems & Security', parent: cs},{name: 'CS: Theory', parent: cs})
medicine = Category.where(name: 'Medicine').first
business = Category.where(name: 'Business & Managment').first
education = Category.where(name: 'Education').first
chemistry = Category.where(name: 'Chemistry').first
biology = Category.where(name: 'Biology').first
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

c1 = Course.create!(name:'Health for All Through Primary Health Care', description: description, categories: [medicine,biology], status:'PUBLISHED')
c2 = Course.create!(name:'Model Thinking', description: description, categories: [education], status:'DRAFT')
c3 = Course.create!(name:'Instructional Methods in Health Education', description: description, categories: [medicine,biology,chemistry], status:'PUBLISHED')
c4 = Course.create!(name:'Introduction to Finance', description: description, categories: [business], status:'PUBLISHED')
c5 = Course.create!(name:'Property and Liability', description: description, categories: [business], status:'PUBLISHED')
c6 = Course.create!(name:'Introduction to Mathematical Thinking', description: description, categories: [cs], status:'PUBLISHED')
c7 = Course.create!(name:'Statistical Mechanics: Algorithms and Computations', description: description, categories: [cs], status:'PUBLISHED')
c8 = Course.create!(name:'Advanced Chemistry', description: description, categories: [medicine], status:'DRAFT')
c9 = Course.create!(name:'Beginning Game Programing C#', description: description, categories: [cs,biology], status:'PUBLISHED')
c10 = Course.create!(name:'Preparing for AP Statistics Exam', description: description, categories: [cs,chemistry], status:'PUBLISHED')
c11 = Course.create!(name:'Imagining Other Worlds', description: description, categories: [education,biology], status:'PUBLISHED')
c12 = Course.create!(name:'Globalization of Business Enterprise', description: description, categories: [business,chemistry], status:'PUBLISHED')


step_description = '<p><span style="color: #333333; font-family: Helvetica, Arial, sans-serif; font-size: 14px; line-height: 21px;">Leon Battista Alberti (1404-1472):&nbsp; Knowing Leon Battista Alberti and his architectures in Rimini, Florence and Mantua.</span></p>
<ul style="box-sizing: border-box; padding: 0px; margin: 0px 0px 10.5px 25px; color: #333333; font-family: Helvetica, Arial, sans-serif; font-size: 14px; line-height: 21px;">
<li style="box-sizing: border-box;"><strong style="box-sizing: border-box;">Lecture #2.1</strong><strong style="box-sizing: border-box;">&nbsp;- Rimini, Tempio Malatestiano</strong></li>
<li style="box-sizing: border-box;"><strong style="box-sizing: border-box;">Lecture #2.2 -&nbsp;</strong><strong style="box-sizing: border-box;">Florence, the Rucellai Palace</strong></li>
<li style="box-sizing: border-box;"><strong style="box-sizing: border-box;">Lecture #2.3 - Florence, the fa&ccedil;ade of S. Maria Novella)</strong></li>
<li style="box-sizing: border-box;"><strong style="box-sizing: border-box;">Lecture #2.4 -&nbsp;</strong><strong style="box-sizing: border-box;">Mantua, the churches of S. Sebastiano and S. Andrea)</strong></li>
</ul>'

Course.all.each_with_index do |course,idx|
  puts 'uploading photo'
  course.logo = File.exists?("db/seed/images/#{idx}.png") ? File.open("db/seed/images/#{idx}.png") :  File.open("db/seed/images/#{idx}.jpg")
  course.save!

  teacher.add_role :moderator, course
  teacher2.add_role :moderator, course if idx < 8
  
  5.times.each do |idx|
    step = Step.create!(course:course, name: "Week #{idx}", description: step_description, position: idx)

    exam = Exam.create!(examable: step, name: "step #{idx}")
    (2..5).to_a.sample.times.each do |idx1|
      question = Question.create!(question: 'Knowing Leon Battista Alberti and his architectures in Rimini, Florence and Mantua', exam:exam)
      (2..4).to_a.sample.times.each do |idx2|
        Answer.create!(answer:"Rimini, Tempio Malate#{idx2}", question:question, correct: [true,false].sample)
      end
    end


    (1..5).to_a.sample.times.each do |idx|
      video = Video.create!(title: "Sample #{idx}", yt_id:'iINR7d2cYJQ', step:step, complete:true, position: idx)
      exam = Exam.create!(examable: video, name: video.title)
      (2..5).to_a.sample.times.each do |idx1|
        question = Question.create!(question: 'Knowing Leon Battista Alberti and his architectures in Rimini, Florence and Mantua', exam:exam)
        (2..4).to_a.sample.times.each do |idx2|
          Answer.create!(answer:"Rimini, Tempio Malate#{idx2}", question:question, correct: [true,false].sample)
        end
      end
    end
  end
end

Review.create!(user:student1, course:c1, status:'approved', content: "This is my favorite course yet. The topic is increasingly relevant and soon to be essential knowledge for most front end developers. And a great topic is just the first thing the course gets right. Each screencast is professionally produced, informative yet not excessive, and builds incrementally. Alternating lectures with exercises is a proven learning technique that absolutely works. Despite an already awkwardly long and glowing review, I feel compelled to point out that these courses are technically outstanding! They sport an in-browser code editor (with syntax highlighting) that can compile and check your work in real-time. Oh, and it has a polished theme. Code School, you need to know: I want to have all your code babies. Is it a little embarrassing to be publicly admitting this in my review? I mean, yes. It is. But I'm just being honest. Honest feedback - that's what you wanted, right? We can work this out. Call me.")
Review.create!(user:student1, course:c1, status:'approved', content:"Lots of great info here. Clearing up some of the confusion I had about various parts of mobile design. Thanks again guys!")
Review.create!(user:student2, course:c1, status:'approved', content:"I have been studying, learning and implementing mobile and responsive techniques over the past year. I loved this course as it teaches sound principles for creating sites. You'll learn some specific techniques, but more importantly you'll learn the 'why' behind the approach")
Review.create!(user:student3, course:c3, status:'approved', content:"Best course yet in terms of the exercises UX and I've taken them all. I really liked the render tab so I could see how the code I wrote affected the site.")
Review.create!(user:student4, course:c3, status:'approved', content:"School teaches web technologies in the comfort of your browser with video lessons, coding challenges, and screencasts. We strive to help you learn by doing")
Review.create!(user:student5, course:c3, status:'approved', content:"Lots of great info here. Clearing up some of the confusion I had about various parts of mobile design. Thanks again guys!")
Review.create!(user:student5, course:c6, status:'approved', content:"Best course yet in terms of the exercises UX and I've taken them all. I really liked the render tab so I could see how the code I wrote affected the site.")

puts  "Courses created: #{Course.all.count}"
