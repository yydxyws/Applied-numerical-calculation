The File Structure:

-->HW3
 |---hw3_env.m              # set environment before run the code(set path)
 |---readme.text            # handbook about hw3
 |---202428013826018_尉文硕_hw3.pdf         # report about the hw3
 |-->problem                # the problem conditions about hw3, used as input files
 |  |---BCinput.m           # function BC = BCinput()
 |  |                       # creates a structure to store mesh parameters and boundary conditions
 |  |---PoissonFC.m         # function pde = PoissonFC()
 |  |                       # creates a structure to store pde-equations and its boundary conditions
 |  |---main_Poisson.m      # MAIN: the main function to solver the P1 FEM PDE solver
 |  |                       # if you have set the paramaters in BCinput.m and PossionFC.m, only you do is run it!
 |  |---main_PoissonP3.m    # MAIN: the main function to solver the P3 FEM PDE solver
 |  |                       # if you have set the paramaters in BCinput.m and PossionFC.m, only you do is run it!
 |-->solver
 |  |---Poisson.m           # function u = Poisson(node,elem,pde,bdStruct)
 |  |                       # it solves Poisson equation with P1 linear element, including assembling stiffness matrix and load vector, 
 |  |                       # then apply Dirichlet boundary conditions and directly solve the matrix.
 |  |---PoissonP3.m         # function u = PoissonP3(node,elem,pde,bdStruct)
 |  |                       # it solves Poisson equation with P3 Lagrangian finite element, including initializing the grid and degree of freedom mapping, 
 |  |                       # using Gaussian integration to calculate and assemble stiffness matrix and load vector, then apply Dirichlet boundary conditions and directly solve the matrix.
 |  |-->mesh
 |  |   |---squaremesh.m    # function [node,elem] = squaremesh(square,h1,h2)
 |  |   |                   # it used to generate a square domain and divide it into triangular elements
 |  |   |---setboundary.m   # function bdStruct= setboundary(node,elem)
 |  |   |                   # it exacts all edges from grid and returns structure of boundary
 |  |-->basis
 |  |   |---auxstructure.m  # function aux = auxstructure(node,elem)
 |  |   |                   # it used to calculate the auxiliary structure information of the grid
 |  |   |---gradebasis.m    # function [Dphi,area] = gradbasis(node,elem)
 |  |   |                   # this code calculates the P1 linear finite element basis function gradient and element area on each triangular element.
 |  |   |---quadpts.m       # function [lambda,weight] = quadpts(order)
 |  |   |                   # QUADPTS quadrature points in 2-D.
 |  |   | --quadpts1.m      # function [lambda,weight] = quadpts1(order)
 |  |   |                   # QUADPTS1 quadrature points in 1-D.
 |  |-->error
 |  |   |---getL2error.m    # function err = getL2error(node,elem,u,uh,quadOrder)
 |  |   |                   # getL2error gets L2 norm of the approximation error.
 |  |-->show
 |  |   |---showmesh.m      # function showmesh(node,elem,options)
 |  |   |                   # Showmesh displays a 2D triangular mesh
 |  |   |---showsolution.m  # function showsolution(node,elem,u)
 |  |   |                   # displays the uh solution corresponding to a mesh given by [node,elem] 
 |  |   |---showresult.m    # display the plot of grid and numarical solution
 |-->output
 |  |---P1.fig
 |  |---P1.jpg
 |  |---P3.fig
 |  |---P3.jpg
>>>