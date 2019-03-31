structure cType = struct
    datatype ty = INT 
            | BOOL
            | CHAR
            | ARRAY of ty

    fun printTypes (INT) = print "int"
        | printTypes (BOOL) = print "bool"
        | printTypes (CHAR) = print "char"
        | printTypes (ARRAY (x) ) = (print "array" ; printTypes x)  
end