   M S B A M L   `   `   `  ����U  QParkingAnalysisApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullG(clr-namespace:ParkingAnalysisApplicationParkingAnalysisApplication  5   	   +    %ParkingAnalysisApplication.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   :local(clr-namespace:ParkingAnalysisApplication     5   	     � WindowStartupLocation$  CenterScreen=�5   	    � Title$ Parking Explorer��5	   	   $	��600��5
   	   $	��800��5      $	��300��5      $	��500��5      .��5      �  � ColumnDefinitions 5   
   �� 5      $
��400* �6   �� 5      $
��400* �6    � RowDefinitions 5   
   �� 5      $��50 �6   �� 5      $��25 �6   �� 5      $
��450* �6   �� 5      $��75 �6   .+�5   
   �� 
���   �
�������$��1q�69   $��2��6M   �� 5   
    �� Orientation$ 
Horizontal=�6   $��2��6.   .+�5       �� $��Instruments��6   $��14(�6+   $
��Bold"�69   $��	10 15 5 0q�6K   �� 5!      -   5        $��ButtonAddCar��5!      $��30��6)   $��80��65   $��10 0 5 0q�6@    � Cursor$
 Hand��6R   .��6`   	Add Car6i   �� 5"      -   5        $��ButtonFindCar��5"      $��30��6*   $��80��66   $��0 0 5 0q�6A   $
 Hand��6R   .��6`   
Find Car6j   �� 5#      -   5        $��ButtonReservePlace��5#      $��30��6/   $��80��6;   $��0 0 5 0q�6F   $
 Hand��6W   .��6e   Reserve Place6t   �� 5$      -   5        $��ButtonClearLogs��5$      $��30��6,   $��80��68   $��20 0 0 0q�6C   .��6U   Clear Story6b   5%      �� 5*   
   $��Places��6   $��1��6"   $��Center=�6/   $��Center=�6L   $��0 0 0 0q�6g   �� 5+   
   $��Floors��6   $��1��6"   $��1��6/   $��Center=�6?   $��Center=�6\   $��0 0 0 0q�6w   �� 5-   
   -   5        $��ListBoxPlaces��5-      $��2��6'   $��0��64   $��10 0 0 0q�6D   ��5.      �� 5/      .R�50      �� $ 
Horizontal=�6!   .+�51      �� ��6$   �� *Id+�� 52      $��  |  ��6$   �� 53      ��6$   �� *StringState+54      55      57      �� 59   
   -   5        $��ListBoxFloors��59      $��2��6'   $��1��64   $��0 0 10 0q�6D   ��5:      �� 5;      .R�5<      �� $ 
Horizontal=�6!   .+�5=      �� $��Floor ��6$   �� 5>      ��6$   �� *Id+5?      5@      5B      �� 5D   
   $��3��6   $��2��6"   $ 
Horizontal=�66   $��0 0 0 10q�6O   .+�5E      �� -   5        $��ButtonRemoveCar��5E      $��30��6,   $	��110��68   $��10 0 5 0q�6D   $
 Hand��6V   .��6d   
Remove Car6p   �� 5F      -   5        $��ButtonDeleteReservation��5F      $��30��64   $	��110��6@   $��0 0 5 0q�6L   $
 Hand��6]   .��6k   Cancel Reservation6   5G      5J      5K      