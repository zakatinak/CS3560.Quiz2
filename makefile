DEP = node.h tarray.h college.h course.h
OBJ = collegemain.cc college.cc course.cc

all: build doczip

build: collegemain.o college.o course.o
	g++ -o $@ $^

doczip: doc html
	zip html html

collegemain.o: collegemain.cc $(DEP)
	g++ -c collegemain.cc

college.o: college.cc $(DEP)
	g++ -c college.cc

course.o: course.cc $(DEP)
	g++ -c course.cc

doc: $(DEP) $(OBJ)
	doxygen -g Sample_student_project.doc
	doxygen Sample_student_project.doc

clean:
	rm -f -r  *.o core *.core build Sample_student_project.doc latex html html.zip
