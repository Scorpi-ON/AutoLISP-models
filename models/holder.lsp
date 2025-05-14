(defun input (prompt_ type_ default min_ max_)
  (setq flag T)
  (if (= type_ "point")
    (setq prompt_
	   (strcat prompt_
		   " ("
		   (rtos (car default))
		   ","
		   (rtos (cadr default))
		   ","
		   (rtos (caddr default))
		   "): "
	   )
    )
    (setq prompt_ (strcat prompt_ " (" (rtos default) "): "))
  )
  (while flag
    (cond
      ((= type_ "point")
       (setq value (getpoint prompt_))
      )
      ((= type_ "real")
       (setq value (getreal prompt_))
      )
      ((= type_ "int")
       (setq value (getint prompt_))
      )
    )
    (if	(null value)
      (progn
	(setq value default)
	(setq flag nil)
      )
      (progn
	(setq flag (and	(/= type_ "point")
			(or (> value max_) (< value min_))
		   )
	)
	(if flag
	  (prompt (strcat "�������� ������ ���� � ��������� �� "
			  (rtos min_)
			  " �� "
			  (rtos max_)
			  ". ���������� ��� ���.\n"
		  )
	  )
	)
      )
    )
    (setq value value)
  )
)



(defun rounded_border_section ()
  (command "����"
	   (list secondary_round_rad h)
	   "�"
	   (list secondary_round_rad (- h secondary_round_rad))
	   (list 0 (- h secondary_round_rad))
	   )
  (setq arc (entlast))
  (command "������"
	   (list 0 (- h secondary_round_rad))
	   '(0 0)
	   (list secondary_round_rad 0)
	   (list secondary_round_rad h)
	   ""
	   )
  (command "�������" arc (entlast) "")
  (command "���������3d"
	   (entlast)
	   ""
	   "X"
	   '(0 0)
	   90
	   )
  )


(defun quater_rounded_border ()
  (rounded_border_section)
  (command "��������" (entlast) "" (- main_round_rad (/ w 2)))
  (command "���������" (entlast) "" '(0 0) (list 0 main_round_rad))
  (setq part_w (entlast))
    
  (rounded_border_section)
  (command "���������3d"
	   (entlast)
	   ""
	   "Z"
	   '(0 0)
	   90
	   )
  (command "��������" (entlast) "" (- (/ l 2) main_round_rad))
  (command "���������" (entlast) "" '(0 0) (list main_round_rad 0))
  (setq part_l (entlast))

  (rounded_border_section)
  (command "���������" (entlast) "" '(0 0) (list 0 main_round_rad))
  (command "�������"
	   (entlast)
	   ""
	   (list main_round_rad main_round_rad 0)
	   (list main_round_rad main_round_rad 1)
	   90
	   )
  (setq corner (entlast))
  
  (command "�����������" part_w corner part_l "")
  )



(defun platform ()
  (command "�������"
	   "�"
	   secondary_round_rad
	   (list secondary_round_rad secondary_round_rad)
	   (list (- l secondary_round_rad) (- w secondary_round_rad))
	   )
  (command "�������" (entlast) "")
  (command "��������" (entlast) "" h)
  (setq middle_part (entlast))
  
  (quater_rounded_border)
  (setq quater_rounded_border_ (entlast))
  (command "�������" quater_rounded_border_ ""
	   (list (/ l 2) 0)
	   (list (/ l 2) 1)
	   "�"
	   )
  (command "�����������" quater_rounded_border_ (entlast) "")
  (command "�������" (entlast) ""
	   (list 0 (/ w 2))
	   (list 1 (/ w 2))
	   "�"
	   )
  (command "�����������" middle_part quater_rounded_border_ (entlast) "")
  )



(defun cut_gutter (platform_)
  (command "�������" '(0 0) gutter_rad w)
  (command "���������3d"
	   (entlast)
	   ""
	   "X"
	   '(0 0)
	   -90
	   )
  (command "���������"
	   (entlast)
	   ""
	   '(0 0 0)
	   (list (+ secondary_round_rad gutter_rad)
		 0
		 h
		 )
	   )
  (command "���������" platform_ "" (entlast) "")
  )



(defun cut_slots_and_install_log (platform_)
  (setq step 1)
  (repeat slot_�
    (command "�������"
	   (list (* (/ l (+ slot_� 1)) step)
		 (/ w 2)
		 (- h slot_depth)
		 )
	   log_rad
	   log_h
	   )
    (if (/= step 2)
      (command "���������" platform_ "" (entlast) "")
      )
    (setq step (+ step 1))
    ) 
  )



(defun c:holder ()
  (setq osm (getvar "osmode"))
  (setvar "osmode" 0)

  (setq base_pt (input "������� ������� �����" "point" '(0 0 0) null null))
  (setq l (input "������� ����� ���������" "real" 120.0 50.0 300.0))
  (setq w (input "������� ������ ���������" "real" 60.0 25.0 150.0))
  (setq h (input "������� ������ ���������" "real" 15.0 8.0 30.0))
  (setq main_round_rad (input "������� ������ ���������� ������� ����� ���������" "real" 10.0 0.0 20.0))
  (setq secondary_round_rad (input "������� ������ ���������� ������� ����� ���������" "real" 5.0 0.0 10.0))
  (setq gutter_rad (input "������� ������ ������ ��� ��������" "real" 4.0 2.0 10.0))
  (setq log_rad (input "������� ������ ����������� ��� ��������� ��������" "real" 6.0 3.0 15.0))
  (setq log_h (input "������� ������ ����������� ��� ��������� ��������" "real" 60.0 30.0 90.0))
  (setq slot_depth (input "������� ������� �������� ��� �����������" "real" 10.0 5.0 20.0))
  (setq slot_� (input "������� ���������� �������� ��� �����������" "int" 4 2 10))
 
  (platform)  
  (cut_gutter (entlast))
  (setq platform_ (entlast))
  (cut_slots_and_install_log (entlast))
  (command "���������" platform_ (entlast) "" '(0 0 0) base_pt)
  
  (setvar "osmode" osm)
  )





