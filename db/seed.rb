require_relative( '../models/classes' )
require_relative( '../models/members' )
require_relative( '../models/bookings' )
require('pg')


Booking.delete_all
FitClass.delete_all
Member.delete_all

class1 = FitClass.new({'type'=>'Tabata', 'time'=> '12:40', 'date' => '2019-05-06', 'capacity' => '5', 'tier' => 'standard'})
class1.save
class2 = FitClass.new({'type'=>'Judo', 'time'=> '22:00', 'date' => '2019-05-03', 'capacity' => '6', 'tier' => 'standard'})
class2.save
class3 = FitClass.new({'type'=>'Boxercise', 'time'=> '17:30', 'date' => '2019-05-27', 'capacity' => '7', 'tier' => 'standard'})
class3.save

member1 = Member.new({'name'=>'Billy', 'membership_type'=> 'Standard', 'registration_date'=>'11-08-2009', 'pic_url' => 'donald.jpg'} )
member1.save()
member2 = Member.new({'name'=>'Jess', 'membership_type'=> 'Standard', 'registration_date'=>'11-08-2011', 'pic_url' => 'tom.jpg'} )
member2.save()
member3 = Member.new({'name'=>'Sean', 'membership_type'=> 'Standard', 'registration_date'=>'20-11-2016', 'pic_url' => 'vicky.jpg'} )
member3.save()
member4 = Member.new({'name'=>'Jenny', 'membership_type'=> 'Standard', 'registration_date'=>'20-02-2016', 'pic_url' => 'tim.jpg'} )
member4.save()
member5 = Member.new({'name'=>'Jon', 'membership_type'=> 'Golden', 'registration_date'=>'20-12-2011', 'pic_url' => 'harold.jpg'} )
member5.save()
member6 = Member.new({'name'=>'Natashia', 'membership_type'=> 'Golden', 'registration_date'=>'22-12-2013', 'pic_url' => 'profile_holder.png'} )
member6.save()

booking1 = Booking.new({'class_id'=>class1.id, 'member_id'=> member1.id})
booking1.save
booking2 = Booking.new({'class_id'=>class2.id, 'member_id'=> member1.id})
booking2.save
booking3 = Booking.new({'class_id'=>class3.id, 'member_id'=> member2.id})
booking3.save
booking4 = Booking.new({'class_id'=>class3.id, 'member_id'=> member3.id})
booking4.save

booking5 = Booking.new({'class_id'=>class1.id, 'member_id'=> member2.id})
booking5.save
booking6 = Booking.new({'class_id'=>class1.id, 'member_id'=> member3.id})
booking6.save

# booking7 = Booking.new({'class_id'=>class1.id, 'member_id'=> member4.id})
# booking7.cap_save
#
# booking8 = Booking.new({'class_id'=>class1.id, 'member_id'=> member5.id})
# booking8.cap_save
#
# booking8 = Booking.new({'class_id'=>class1.id, 'member_id'=> member6.id})
# p booking8.cap_save
 # booking6.member_id = member6.id
 # booking6.update
 #
 # booking6



# class1.type = 'salsa'
# class1.update()
#
# member1.name = 'Jim'
# member1.update()
#
# member1.registration_date = '19-02-2000'
# member1.update
#
# Booking.show_all_by_name
#
# # booking2.show_booking_by_name
#
# booking = Booking.find(booking1.id)
# p new_book = booking.first.show_booking_by_name
# p new_book.first

# p booking4.member_name

# try this in the controller


# shoe = Booking.find_by_class(class1.id)
# shoe
# shoe.verify
# p booking1.verify

# p booking1.check_capacity
# p booking1.how_many_attending_class
# p class1.who_registered_for_class.count

# class1.delete()
# member1.delete()
# booking1.delete( )
# Member.all()
# FitClass.all()
# Booking.all()

 # Member.find(member1.id)
# p FitClass.find(class2.id)
 # Booking.find(booking3.id)
 # Booking.show_all_by_name
#
#  Member.find_by_name('Sean')
#
#  Member.find_by_membership_type('Standard')
#  FitClass.find_by_type('Tabata')

# class3.who_registered_for_class
# FitClass.up_coming()

# Member.all_golden_members
#
# FitClass.up_coming

# member1.show_classes_for_member
# p member6.show_classes_for_member.first

# p class1.date_as_day
# p class2.date_as_day
# p class3.date_as_day
#
# p class1.date_as_written
# p class2.date_as_written
# p class3.date_as_written

num = ('20190501')
p num.to_i
as_day = Time.new(2019, 05, 01)
p as_day.strftime('%A')
