   M S B A M L   `   `   `  ����U  QParkingAnalysisApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullG(clr-namespace:ParkingAnalysisApplicationParkingAnalysisApplication  5   	   (    "ParkingAnalysisApplication.FindCar   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   :local(clr-namespace:ParkingAnalysisApplication     5   	     � WindowStartupLocation$  CenterOwner=�5   	    � Title$) #Getting information to find the Car��5	   	   $	��200��5
   	   $	��550��5   	   $	��200��5   	   $	��600��5   	   $	��200��5   	   $	��400��5   	   .��5      �  � ColumnDefinitions 5   
   �� 5      $
��200* �6   �� 5      $
��300* �6    � RowDefinitions 5   
   �� 5      $��30 �6   �� 5      $	��30* �6   �� 5      $	��30* �6   �� 5      $	��30* �6   .+�5   
   �� 
�������
���   �$��1q�69   $��2��6M   �� 5   
   $%��Enter information about the car��6   $��Center=�6;   $��2��6X   $��18(�6l   $��10 0 5 0q�6z   �� 5    
   -   5        $��TextBlockMode��5       $��Find Car��6)   $��5q�69   $��15(�6D   �� 5!   
   $��
Car Number��6   $��1��6&   $��5q�63   �� 5"   
   $��Car Owner`s name��6   $��2��6,   $��5q�69   �� 5$   
   -   5        $��TextBoxCarNumber��5$      $��30��6*   $��1��66   $��1��6C   $��5q�6S   �� 5%   
   -   5        $��TextBoxOwnersName��5%      $��30��6+   $��2��67   $��1��6D   $��5q�6T   �� 5'   
    �� Orientation$ 
Horizontal=�6   $��3��6.   $��2��6;   $��Center=�6O   .+�5(      �� -   5        $��ButtonConformAddition��5(      $��30��62   $��60��6>    � Cursor$
 Hand��6I   $��5q�6W   .��6b   	Conform6k   �� 5)      -   5        $��ButtonCancelAddition��5)      $��30��61   $��60��6=   $
 Hand��6H   $��5q�6V   .��6a   Cancel6i   5*      5+      5,      