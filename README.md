#Algorithms, Part I by Princeton University

##Week 1. Dynamic Connectivity problem

####1. What is Dynamic Connectivity problem? 
A dynamic connectivity structure is a data structure that dynamically maintains information about the connected components of a graph.
The set V of vertices of the graph is fixed, but the set E of edges can change. The three cases, in order of difficulty, are:

1. Edges are only added to the graph (this can be called incremental connectivity);
        
2. Edges are only deleted from the graph (this can be called decremental connectivity);
        
3. Edges can be either added or deleted (this can be called fully dynamic connectivity).

After each addition/deletion of an edge, the dynamic connectivity structure should adapt itself such that it can give quick answers to 
queries of the form "is there a path between x and y?" (equivalently: "do vertices x and y belong to the same connected component?").

####2. Requirements and Goals of the algorithm

   1. Union command: connect two objects.
    
   2. Find/Connected query: is there a path connecting the two objects?

####3. System APIs
 **union** method call should bind two objects
 
    union(p, q)    
    
 **connected?** method call should return boolean value showing are these objects connected or not
    
    connected?(p, q) 
 
 **root** method call should return parent of all ancestors. Method is private thus it will be invoked only implicitly
 and only in cases when we have graph data structure(Quick Union with all its modifications) 
    
    root(p)
    
    
####4. Capacity Estimation

| Algorithms | Worst-case time |
| ------------- |:-------------:|
| Quick Find(Eager approach)                            | M N |
| Quick union(Lazy approach)                            | M N |
| Quick union(Weighted improvement)                     | N + M log N |
| Quick union(Compression path improvement)             | N + M log N|
| Quick union(Weighted + Compression path improvements) | N + M lg* N|
