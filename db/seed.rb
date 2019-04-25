require_relative( '../models/classes' )


class1 = FitClass.new('type'=>'Tabata', 'time'=> '12:40')
class1.save
p class1
