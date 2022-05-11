query 50150 "Student Query"
{
    Caption = 'Student ';
    QueryCategory = 'Student List';

    elements
    {
        dataitem(Student; Student)
        {
            column(StudentNo; StudentNo)
            {

            }
            column(Name; Name)
            {

            }
            column(AverageGrade; AverageGrade)
            {

            }
            column(Education; Education)
            {

            }
            // filter(FilterName; SourceFieldName)
            // {

            // }
            dataitem(StudentLine; StudentLine)
            {
                DataItemLink = StudentNo = Student.StudentNo;
                SqlJoinType = InnerJoin;

                column(LineNo; LineNo)
                {

                }
                column(CourseName; CourseName)
                {

                }

            }
        }
    }

    var
        myInt: Record Bin;

    trigger OnBeforeOpen()
    begin

    end;
}