require_relative( '../models/classes' )
require_relative( '../models/members' )
require_relative( '../models/bookings' )


Booking.delete_all
FitClass.delete_all
Member.delete_all

class1 = FitClass.new({'type'=>'Tabata', 'time'=> '12:40'})
class1.save
class2 = FitClass.new({'type'=>'Tabata', 'time'=> '15:00'})
class2.save
class3 = FitClass.new({'type'=>'Boxercise', 'time'=> '17:30'})
class3.save

member1 = Member.new({'name'=>'Billy', 'membership_type'=> 'Standard', 'reg_date'=>'11-08-2009'} )
member1.save()
member2 = Member.new({'name'=>'Jess', 'membership_type'=> 'Standard', 'reg_date'=>'11-08-2011'} )
member2.save()
member3 = Member.new({'name'=>'Sean', 'membership_type'=> 'Standard', 'reg_date'=>'20-11-2016'} )
member3.save()

booking1 = Booking.new({'class_id'=>class1.id, 'member_id'=> member1.id})
booking1.save
booking1 = Booking.new({'class_id'=>class2.id, 'member_id'=> member1.id})
booking1.save
booking1 = Booking.new({'class_id'=>class3.id, 'member_id'=> member2.id})
booking1.save
booking1 = Booking.new({'class_id'=>class3.id, 'member_id'=> member3.id})
booking1.save

class1.type = 'salsa'
class1.update()

member1.name = 'Jim'
member1.update()

# class1.delete()
# member1.delete()
# booking1.delete( )
# Member.all()
# FitClass.all()
# Booking.all()

p Member.find(member2.id)
# FitClass.find(class2.id)
# Booking.find(booking1.id)
#
#  Member.find_by_name('Sean')
#
#  Member.find_by_membership_type('Standard')
#  FitClass.find_by_type('Tabata')

# class3.who_registered_for_class
