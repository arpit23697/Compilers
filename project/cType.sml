structure cType = struct
    datatype ty = INT 
            | BOOL
            | CHAR
            | VOID
            | ARRAY of ty
            | FUNC of (ty list * ty)            


    fun printTypes (INT) = print "int "
        | printTypes (BOOL) = print "bool "
        | printTypes (CHAR) = print "char "
        | printTypes (VOID) = print "void "
        | printTypes (ARRAY (x) ) = (print "array" ; printTypes x)  
        | printTypes (FUNC (x,y)) = (print "Function : " ; (map printTypes x) ; printTypes y)

end