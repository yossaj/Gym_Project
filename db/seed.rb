require_relative( '../models/classes' )
require_relative( '../models/members' )
require_relative( '../models/bookings' )


Booking.delete_all
FitClass.delete_all
Member.delete_all

class1 = FitClass.new({'type'=>'Tabata', 'time'=> '12:40'})
class1.save

member1 = Member.new({'name'=>'Billy', 'membership_type'=> 'Standard', 'reg_date'=>'11-08-2009'} )
member1.save()
member2 = Member.new({'name'=>'Jess', 'membership_type'=> 'Standard', 'reg_date'=>'11-08-2011'} )
member2.save()
member3 = Member.new({'name'=>'Sean', 'membership_type'=> 'Standard', 'reg_date'=>'20-11-2016'} )
member3.save()

booking1 = Booking.new({'class_id'=>class1.id, 'member_id'=> member1.id})
booking1.save

class1.type = 'salsa'
class1.update()

member1.name = 'Jim'
member1.update

Member.all()
FitClass.all()
p Booking.all()
