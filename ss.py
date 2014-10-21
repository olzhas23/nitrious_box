def sequentialSearch(alist, item):
2	    pos = 0
3	    found = False
4	
5	    while pos < len(alist) and not found:
6	        if alist[pos] == item:
7	            found = True
8	        else:
9	            pos = pos+1
10	
11	    return found
12	
13	testlist = [1, 2, 32, 8, 17, 19, 42, 13, 0]
14	print(sequentialSearch(testlist, 3))
15	print(sequentialSearch(testlist, 13))