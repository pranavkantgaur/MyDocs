ALL_FIGURE_NAMES=$(shell cat pgfplots.figlist)
ALL_FIGURES=$(ALL_FIGURE_NAMES:%=%.pdf)

allimages: $(ALL_FIGURES)
	@echo All images exist now. Use make -B to re-generate them.

FORCEREMAKE:

include $(ALL_FIGURE_NAMES:%=%.dep)

%.dep:
	mkdir -p $(dir $@)
	touch $@ # will be filled later.

figures/expensiveexampleXreference_addplot_0.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_addplot_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_addplot_1.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_addplot_1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_addplot_2.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_addplot_2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_twodim_0.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_twodim_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_twodim_1.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_twodim_1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_twodim_2.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_twodim_2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_twodim_3.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_twodim_3" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_twodim_4.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_twodim_4" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_0.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_1.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_2.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_3.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_3" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_4.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_4" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_5.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_5" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_6.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_6" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_7.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_7" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_8.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_8" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_9.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_9" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_10.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_10" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_11.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_11" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_12.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_12" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_13.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_13" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_14.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_14" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_15.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_15" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_16.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_16" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_17.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_17" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_18.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_18" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_19.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_19" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_20.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_20" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_21.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_21" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_22.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_22" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_23.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_23" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_24.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_24" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_interior_colormap_0.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_interior_colormap_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_interior_colormap_1.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_interior_colormap_1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_interior_colormap_2.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_interior_colormap_2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_interior_colormap_3.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_interior_colormap_3" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_0.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_1.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_2.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_3.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_3" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_contour_4.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_contour_4" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_25.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_25" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_26.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_26" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_27.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_27" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_28.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_28" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_29.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_29" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_30.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_30" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedim_31.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedim_31" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_0.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_1.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_2.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_3.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_3" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedimaxis_0.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedimaxis_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedimaxis_1.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedimaxis_1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedimaxis_2.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedimaxis_2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedimaxis_3.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedimaxis_3" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedimaxis_4.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedimaxis_4" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedimaxis_5.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedimaxis_5" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedimaxis_6.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedimaxis_6" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedimaxis_7.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedimaxis_7" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_threedimaxis_8.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_threedimaxis_8" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_4.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_4" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_5.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_5" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_nodes_0.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_nodes_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_nodes_1.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_nodes_1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_nodes_2.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_nodes_2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXreference_nodes_3.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXreference_nodes_3" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXpatchplot_0.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXpatchplot_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXpolar_0.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXpolar_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXmemspeed_0.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXmemspeed_0" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXmemspeed_1.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXmemspeed_1" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

figures/expensiveexampleXmemspeed_2.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "figures/expensiveexampleXmemspeed_2" "\def\tikzexternalrealjob{pgfplots}\input{pgfplots}"

