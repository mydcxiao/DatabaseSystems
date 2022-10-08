----------------------------------------
CSCI585 
HW4 
Yuhang Xiao
YXiao776
----------------------------------------
Q1

Linear Equation:

MEDV =

     -0.1084 * CRIM +
      0.0458 * ZN +
      2.7187 * CHAS=1 +
    -17.376  * NOX +
      3.8016 * RM +
     -1.4927 * DIS +
      0.2996 * RAD +
     -0.0118 * TAX +
     -0.9465 * PTRATIO +
      0.0093 * B +
     -0.5226 * LSTAT +
     36.3411

Discussion:

There are 12 terms in the equation including 11 attributes and one intercept. Finding that INDUS, AGE and CHAS=0 are missing in the equation, it's may caused by their low p-values, which means their changes are not associated with the changes in the predicted value. In other words, they are not statistically significant. As for other attributes, the positive coefficient means they are positive correlated to the predicted value and negative coefficient means negative correlation. The value of the weight means how significant can the attribute affect the result. E.g., every unit increase in the NOX (nitric oxides concentration) can cause 17.376 unit decrease in the MEDV (median home price).

--------------------------------------------------------------------------------------

Q2:

Linear Equation:

num_rings =

 -0.8249 * sex = I  +
  0.0577 * sex = M  +
 -0.4583 * length   +
 11.0751 * diameter +
 10.7615 * height   +
  8.9754 * whole_weight +
-19.7869 * shucked_weight +
-10.5818 * viscera_weight +
  8.7418 * shell_weight +
  3.8946

--------------------------------------------------------------------------------------

Q3:

Linear Equation:

num_rings =

- 11.933 * length
+ 25.766 * diameter
+ 20.358 * height
+ 2.836