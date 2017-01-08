; ModuleID = 'simpleruntime.c'

%struct.IntList = type { i32, %struct.IntList*, i32 }
%struct.VContext = type { %struct.Value*, %struct.VContext*, i32 }
%struct.Value = type { i32, %union.anon.0, i32 }
%union.anon.0 = type { %struct.anon.7 }
%struct.anon.7 = type { %struct.VExp*, %struct.VContext*, %struct.Continuation* }
%struct.VExp = type { i32, i32, i32, %union.anon.1, i32 }
%union.anon.1 = type { %struct.anon.6 }
%struct.anon.6 = type { i32, i32, %union.SyscallArg, i32, %struct.Value* }
%union.SyscallArg = type { %struct.IntList* }
%struct.Continuation = type { i32, %union.anon.8, %struct.Continuation* }
%union.anon.8 = type { %struct.anon.9 }
%struct.anon.9 = type { %struct.VExp*, %struct.VContext* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.ValueStack = type { %struct.Value*, %struct.ValueStack* }

@.str = private unnamed_addr constant [16 x i8] c"divided by zero\00", align 1
@.str1 = private unnamed_addr constant [36 x i8] c"cannot use non-integer value in mod\00", align 1
@allocateIntList.pool = internal unnamed_addr global %struct.IntList* null, align 8
@syscall_arginfo = constant [8 x [4 x i32]] [[4 x i32] [i32 1, i32 0, i32 -1, i32 -1], [4 x i32] [i32 3, i32 1, i32 0, i32 2], [4 x i32] [i32 2, i32 0, i32 2, i32 -1], [4 x i32] [i32 2, i32 0, i32 2, i32 -1], [4 x i32] [i32 3, i32 0, i32 0, i32 2], [4 x i32] [i32 2, i32 0, i32 2, i32 -1], [4 x i32] [i32 1, i32 2, i32 -1, i32 -1], [4 x i32] [i32 2, i32 1, i32 2, i32 -1]], align 16
@allocateVContext.pool = internal unnamed_addr global %struct.VContext* null, align 8
@.str2 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str3 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@.str4 = private unnamed_addr constant [13 x i8] c"Not a number\00", align 1
@allocateVExp.pool = internal unnamed_addr global %struct.VExp* null, align 8
@allocateValue.pool = internal unnamed_addr global %struct.Value* null, align 8
@.str5 = private unnamed_addr constant [30 x i8] c"too many arguments to syscall\00", align 1
@.str6 = private unnamed_addr constant [42 x i8] c"cannot apply non-integer value to syscall\00", align 1
@.str7 = private unnamed_addr constant [42 x i8] c"cannot apply non-intlist value to syscall\00", align 1
@.str8 = private unnamed_addr constant [37 x i8] c"cannot use numeric value as function\00", align 1
@.str9 = private unnamed_addr constant [52 x i8] c"cannot apply built-in function on non-numeric value\00", align 1
@.str10 = private unnamed_addr constant [44 x i8] c"cannot append non-integer number to IntList\00", align 1
@stdin = external global %struct._IO_FILE*
@stdout = external global %struct._IO_FILE*
@.str11 = private unnamed_addr constant [15 x i8] c"exception: %s\0A\00", align 1
@.str13 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str14 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str15 = private unnamed_addr constant [3 x i8] c"ab\00", align 1
@.str16 = private unnamed_addr constant [4 x i8] c"rwb\00", align 1
@.str28 = private unnamed_addr constant [6 x i8] c"toInt\00", align 1
@.str29 = private unnamed_addr constant [8 x i8] c"toFloat\00", align 1
@.str30 = private unnamed_addr constant [5 x i8] c"exit\00", align 1
@.str31 = private unnamed_addr constant [8 x i8] c"putChar\00", align 1
@.str32 = private unnamed_addr constant [9 x i8] c"putCharF\00", align 1
@.str33 = private unnamed_addr constant [8 x i8] c"getChar\00", align 1
@.str34 = private unnamed_addr constant [9 x i8] c"getCharF\00", align 1
@.str35 = private unnamed_addr constant [9 x i8] c"peekChar\00", align 1
@.str36 = private unnamed_addr constant [10 x i8] c"peekCharF\00", align 1
@.str37 = private unnamed_addr constant [6 x i8] c"close\00", align 1
@.str38 = private unnamed_addr constant [8 x i8] c"openCmd\00", align 1
@.str39 = private unnamed_addr constant [12 x i8] c"makeIntList\00", align 1
@.str40 = private unnamed_addr constant [7 x i8] c"getArg\00", align 1
@.str41 = private unnamed_addr constant [10 x i8] c"systemCmd\00", align 1
@str = private unnamed_addr constant [45 x i8] c"exception: insufficient arguments to syscall\00"
@switch.table = private unnamed_addr constant [4 x i8*] [i8* getelementptr inbounds ([3 x i8]* @.str13, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str15, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8]* @.str16, i64 0, i64 0)]

; Function Attrs: nounwind readnone uwtable
define { i32, i64 } @intNumber(i32 %a) #0 {
  %1 = zext i32 %a to i64
  %2 = insertvalue { i32, i64 } { i32 0, i64 undef }, i64 %1, 1
  ret { i32, i64 } %2
}

; Function Attrs: nounwind readnone uwtable
define { i32, i64 } @doubleNumber(double %a) #0 {
  %1 = bitcast double %a to i64
  %2 = insertvalue { i32, i64 } { i32 1, i64 undef }, i64 %1, 1
  ret { i32, i64 } %2
}

; Function Attrs: nounwind readnone uwtable
define { i32, i64 } @addNumber(i32 %a.coerce0, i64 %a.coerce1, i32 %b.coerce0, i64 %b.coerce1) #0 {
  %1 = icmp eq i32 %a.coerce0, 0
  %2 = icmp eq i32 %b.coerce0, 0
  br i1 %1, label %3, label %13

; <label>:3                                       ; preds = %0
  br i1 %2, label %4, label %7

; <label>:4                                       ; preds = %3
  %5 = add i64 %b.coerce1, %a.coerce1
  %6 = and i64 %5, 4294967295
  br label %25

; <label>:7                                       ; preds = %3
  %8 = trunc i64 %a.coerce1 to i32
  %9 = sitofp i32 %8 to double
  %10 = bitcast i64 %b.coerce1 to double
  %11 = fadd double %9, %10
  %12 = bitcast double %11 to i64
  br label %25

; <label>:13                                      ; preds = %0
  %14 = bitcast i64 %a.coerce1 to double
  br i1 %2, label %15, label %21

; <label>:15                                      ; preds = %13
  %16 = trunc i64 %b.coerce1 to i32
  %17 = sitofp i32 %16 to double
  %18 = fadd double %14, %17
  %19 = fptosi double %18 to i32
  %20 = zext i32 %19 to i64
  br label %25

; <label>:21                                      ; preds = %13
  %22 = bitcast i64 %b.coerce1 to double
  %23 = fadd double %14, %22
  %24 = bitcast double %23 to i64
  br label %25

; <label>:25                                      ; preds = %21, %15, %7, %4
  %.sroa.0.0 = phi i32 [ 0, %4 ], [ 1, %7 ], [ 1, %15 ], [ 1, %21 ]
  %.sroa.9.0 = phi i64 [ %6, %4 ], [ %12, %7 ], [ %20, %15 ], [ %24, %21 ]
  %26 = insertvalue { i32, i64 } undef, i32 %.sroa.0.0, 0
  %27 = insertvalue { i32, i64 } %26, i64 %.sroa.9.0, 1
  ret { i32, i64 } %27
}

; Function Attrs: nounwind readnone uwtable
define { i32, i64 } @subNumber(i32 %a.coerce0, i64 %a.coerce1, i32 %b.coerce0, i64 %b.coerce1) #0 {
  %1 = icmp eq i32 %a.coerce0, 0
  %2 = icmp eq i32 %b.coerce0, 0
  br i1 %1, label %3, label %13

; <label>:3                                       ; preds = %0
  br i1 %2, label %4, label %7

; <label>:4                                       ; preds = %3
  %5 = sub i64 %a.coerce1, %b.coerce1
  %6 = and i64 %5, 4294967295
  br label %25

; <label>:7                                       ; preds = %3
  %8 = trunc i64 %a.coerce1 to i32
  %9 = sitofp i32 %8 to double
  %10 = bitcast i64 %b.coerce1 to double
  %11 = fsub double %9, %10
  %12 = bitcast double %11 to i64
  br label %25

; <label>:13                                      ; preds = %0
  %14 = bitcast i64 %a.coerce1 to double
  br i1 %2, label %15, label %21

; <label>:15                                      ; preds = %13
  %16 = trunc i64 %b.coerce1 to i32
  %17 = sitofp i32 %16 to double
  %18 = fsub double %14, %17
  %19 = fptosi double %18 to i32
  %20 = zext i32 %19 to i64
  br label %25

; <label>:21                                      ; preds = %13
  %22 = bitcast i64 %b.coerce1 to double
  %23 = fsub double %14, %22
  %24 = bitcast double %23 to i64
  br label %25

; <label>:25                                      ; preds = %21, %15, %7, %4
  %.sroa.0.0 = phi i32 [ 0, %4 ], [ 1, %7 ], [ 1, %15 ], [ 1, %21 ]
  %.sroa.9.0 = phi i64 [ %6, %4 ], [ %12, %7 ], [ %20, %15 ], [ %24, %21 ]
  %26 = insertvalue { i32, i64 } undef, i32 %.sroa.0.0, 0
  %27 = insertvalue { i32, i64 } %26, i64 %.sroa.9.0, 1
  ret { i32, i64 } %27
}

; Function Attrs: nounwind readnone uwtable
define { i32, i64 } @mulNumber(i32 %a.coerce0, i64 %a.coerce1, i32 %b.coerce0, i64 %b.coerce1) #0 {
  %1 = icmp eq i32 %a.coerce0, 0
  %2 = icmp eq i32 %b.coerce0, 0
  br i1 %1, label %3, label %13

; <label>:3                                       ; preds = %0
  br i1 %2, label %4, label %7

; <label>:4                                       ; preds = %3
  %5 = mul i64 %b.coerce1, %a.coerce1
  %6 = and i64 %5, 4294967295
  br label %25

; <label>:7                                       ; preds = %3
  %8 = trunc i64 %a.coerce1 to i32
  %9 = sitofp i32 %8 to double
  %10 = bitcast i64 %b.coerce1 to double
  %11 = fmul double %9, %10
  %12 = bitcast double %11 to i64
  br label %25

; <label>:13                                      ; preds = %0
  %14 = bitcast i64 %a.coerce1 to double
  br i1 %2, label %15, label %21

; <label>:15                                      ; preds = %13
  %16 = trunc i64 %b.coerce1 to i32
  %17 = sitofp i32 %16 to double
  %18 = fmul double %14, %17
  %19 = fptosi double %18 to i32
  %20 = zext i32 %19 to i64
  br label %25

; <label>:21                                      ; preds = %13
  %22 = bitcast i64 %b.coerce1 to double
  %23 = fmul double %14, %22
  %24 = bitcast double %23 to i64
  br label %25

; <label>:25                                      ; preds = %21, %15, %7, %4
  %.sroa.0.0 = phi i32 [ 0, %4 ], [ 1, %7 ], [ 1, %15 ], [ 1, %21 ]
  %.sroa.9.0 = phi i64 [ %6, %4 ], [ %12, %7 ], [ %20, %15 ], [ %24, %21 ]
  %26 = insertvalue { i32, i64 } undef, i32 %.sroa.0.0, 0
  %27 = insertvalue { i32, i64 } %26, i64 %.sroa.9.0, 1
  ret { i32, i64 } %27
}

; Function Attrs: nounwind uwtable
define { i32, i64 } @divNumber(i32 %a.coerce0, i64 %a.coerce1, i32 %b.coerce0, i64 %b.coerce1, i8** nocapture %msg) #1 {
  %1 = icmp eq i32 %a.coerce0, 0
  %2 = icmp eq i32 %b.coerce0, 0
  br i1 %1, label %3, label %17

; <label>:3                                       ; preds = %0
  br i1 %2, label %4, label %11

; <label>:4                                       ; preds = %3
  %5 = trunc i64 %b.coerce1 to i32
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %4
  store i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i8** %msg, align 8, !tbaa !1
  br label %32

; <label>:8                                       ; preds = %4
  %9 = trunc i64 %a.coerce1 to i32
  %10 = sdiv i32 %9, %5
  %phitmp8 = zext i32 %10 to i64
  br label %32

; <label>:11                                      ; preds = %3
  %12 = trunc i64 %a.coerce1 to i32
  %13 = sitofp i32 %12 to double
  %14 = bitcast i64 %b.coerce1 to double
  %15 = fdiv double %13, %14
  %16 = bitcast double %15 to i64
  br label %32

; <label>:17                                      ; preds = %0
  br i1 %2, label %18, label %27

; <label>:18                                      ; preds = %17
  %19 = trunc i64 %b.coerce1 to i32
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %18
  store i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i8** %msg, align 8, !tbaa !1
  br label %32

; <label>:22                                      ; preds = %18
  %23 = bitcast i64 %a.coerce1 to double
  %24 = sitofp i32 %19 to double
  %25 = fdiv double %23, %24
  %26 = fptosi double %25 to i32
  %phitmp = zext i32 %26 to i64
  br label %32

; <label>:27                                      ; preds = %17
  %28 = bitcast i64 %a.coerce1 to double
  %29 = bitcast i64 %b.coerce1 to double
  %30 = fdiv double %28, %29
  %31 = bitcast double %30 to i64
  br label %32

; <label>:32                                      ; preds = %21, %22, %7, %8, %27, %11
  %.sroa.0.0 = phi i32 [ 1, %11 ], [ 1, %27 ], [ 0, %8 ], [ 0, %7 ], [ 1, %22 ], [ 1, %21 ]
  %.sroa.9.0 = phi i64 [ %16, %11 ], [ %31, %27 ], [ %phitmp8, %8 ], [ 0, %7 ], [ %phitmp, %22 ], [ 0, %21 ]
  %33 = insertvalue { i32, i64 } undef, i32 %.sroa.0.0, 0
  %34 = insertvalue { i32, i64 } %33, i64 %.sroa.9.0, 1
  ret { i32, i64 } %34
}

; Function Attrs: nounwind uwtable
define { i32, i64 } @modNumber(i32 %a.coerce0, i64 %a.coerce1, i32 %b.coerce0, i64 %b.coerce1, i8** nocapture %msg) #1 {
  %1 = or i32 %b.coerce0, %a.coerce0
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %4, label %3

; <label>:3                                       ; preds = %0
  store i8* getelementptr inbounds ([36 x i8]* @.str1, i64 0, i64 0), i8** %msg, align 8, !tbaa !1
  br label %8

; <label>:4                                       ; preds = %0
  %5 = trunc i64 %a.coerce1 to i32
  %6 = trunc i64 %b.coerce1 to i32
  %7 = srem i32 %5, %6
  %phitmp = zext i32 %7 to i64
  br label %8

; <label>:8                                       ; preds = %4, %3
  %c.sroa.21.0 = phi i64 [ 0, %3 ], [ %phitmp, %4 ]
  %9 = insertvalue { i32, i64 } { i32 0, i64 undef }, i64 %c.sroa.21.0, 1
  ret { i32, i64 } %9
}

; Function Attrs: nounwind readnone uwtable
define zeroext i1 @leNumber(i32 %a.coerce0, i64 %a.coerce1, i32 %b.coerce0, i64 %b.coerce1) #0 {
  %1 = icmp eq i32 %a.coerce0, 0
  %2 = icmp eq i32 %b.coerce0, 0
  br i1 %1, label %3, label %12

; <label>:3                                       ; preds = %0
  %4 = trunc i64 %a.coerce1 to i32
  br i1 %2, label %5, label %8

; <label>:5                                       ; preds = %3
  %6 = trunc i64 %b.coerce1 to i32
  %7 = icmp slt i32 %4, %6
  br label %21

; <label>:8                                       ; preds = %3
  %9 = sitofp i32 %4 to double
  %10 = bitcast i64 %b.coerce1 to double
  %11 = fcmp olt double %9, %10
  br label %21

; <label>:12                                      ; preds = %0
  %13 = bitcast i64 %a.coerce1 to double
  br i1 %2, label %14, label %18

; <label>:14                                      ; preds = %12
  %15 = trunc i64 %b.coerce1 to i32
  %16 = sitofp i32 %15 to double
  %17 = fcmp olt double %13, %16
  br label %21

; <label>:18                                      ; preds = %12
  %19 = bitcast i64 %b.coerce1 to double
  %20 = fcmp olt double %13, %19
  br label %21

; <label>:21                                      ; preds = %18, %14, %8, %5
  %.0 = phi i1 [ %7, %5 ], [ %11, %8 ], [ %17, %14 ], [ %20, %18 ]
  ret i1 %.0
}

; Function Attrs: nounwind readnone uwtable
define zeroext i1 @geNumber(i32 %a.coerce0, i64 %a.coerce1, i32 %b.coerce0, i64 %b.coerce1) #0 {
  %1 = icmp eq i32 %a.coerce0, 0
  %2 = icmp eq i32 %b.coerce0, 0
  br i1 %1, label %3, label %12

; <label>:3                                       ; preds = %0
  %4 = trunc i64 %a.coerce1 to i32
  br i1 %2, label %5, label %8

; <label>:5                                       ; preds = %3
  %6 = trunc i64 %b.coerce1 to i32
  %7 = icmp sgt i32 %4, %6
  br label %21

; <label>:8                                       ; preds = %3
  %9 = sitofp i32 %4 to double
  %10 = bitcast i64 %b.coerce1 to double
  %11 = fcmp ogt double %9, %10
  br label %21

; <label>:12                                      ; preds = %0
  %13 = bitcast i64 %a.coerce1 to double
  br i1 %2, label %14, label %18

; <label>:14                                      ; preds = %12
  %15 = trunc i64 %b.coerce1 to i32
  %16 = sitofp i32 %15 to double
  %17 = fcmp ogt double %13, %16
  br label %21

; <label>:18                                      ; preds = %12
  %19 = bitcast i64 %b.coerce1 to double
  %20 = fcmp ogt double %13, %19
  br label %21

; <label>:21                                      ; preds = %18, %14, %8, %5
  %.0 = phi i1 [ %7, %5 ], [ %11, %8 ], [ %17, %14 ], [ %20, %18 ]
  ret i1 %.0
}

; Function Attrs: nounwind readnone uwtable
define zeroext i1 @nleNumber(i32 %a.coerce0, i64 %a.coerce1, i32 %b.coerce0, i64 %b.coerce1) #0 {
  %1 = icmp eq i32 %a.coerce0, 0
  %2 = icmp eq i32 %b.coerce0, 0
  br i1 %1, label %3, label %12

; <label>:3                                       ; preds = %0
  %4 = trunc i64 %a.coerce1 to i32
  br i1 %2, label %5, label %8

; <label>:5                                       ; preds = %3
  %6 = trunc i64 %b.coerce1 to i32
  %7 = icmp sge i32 %4, %6
  br label %21

; <label>:8                                       ; preds = %3
  %9 = sitofp i32 %4 to double
  %10 = bitcast i64 %b.coerce1 to double
  %11 = fcmp oge double %9, %10
  br label %21

; <label>:12                                      ; preds = %0
  %13 = bitcast i64 %a.coerce1 to double
  br i1 %2, label %14, label %18

; <label>:14                                      ; preds = %12
  %15 = trunc i64 %b.coerce1 to i32
  %16 = sitofp i32 %15 to double
  %17 = fcmp oge double %13, %16
  br label %21

; <label>:18                                      ; preds = %12
  %19 = bitcast i64 %b.coerce1 to double
  %20 = fcmp oge double %13, %19
  br label %21

; <label>:21                                      ; preds = %18, %14, %8, %5
  %.0 = phi i1 [ %7, %5 ], [ %11, %8 ], [ %17, %14 ], [ %20, %18 ]
  ret i1 %.0
}

; Function Attrs: nounwind readnone uwtable
define zeroext i1 @ngeNumber(i32 %a.coerce0, i64 %a.coerce1, i32 %b.coerce0, i64 %b.coerce1) #0 {
  %1 = icmp eq i32 %a.coerce0, 0
  %2 = icmp eq i32 %b.coerce0, 0
  br i1 %1, label %3, label %12

; <label>:3                                       ; preds = %0
  %4 = trunc i64 %a.coerce1 to i32
  br i1 %2, label %5, label %8

; <label>:5                                       ; preds = %3
  %6 = trunc i64 %b.coerce1 to i32
  %7 = icmp sle i32 %4, %6
  br label %21

; <label>:8                                       ; preds = %3
  %9 = sitofp i32 %4 to double
  %10 = bitcast i64 %b.coerce1 to double
  %11 = fcmp ole double %9, %10
  br label %21

; <label>:12                                      ; preds = %0
  %13 = bitcast i64 %a.coerce1 to double
  br i1 %2, label %14, label %18

; <label>:14                                      ; preds = %12
  %15 = trunc i64 %b.coerce1 to i32
  %16 = sitofp i32 %15 to double
  %17 = fcmp ole double %13, %16
  br label %21

; <label>:18                                      ; preds = %12
  %19 = bitcast i64 %b.coerce1 to double
  %20 = fcmp ole double %13, %19
  br label %21

; <label>:21                                      ; preds = %18, %14, %8, %5
  %.0 = phi i1 [ %7, %5 ], [ %11, %8 ], [ %17, %14 ], [ %20, %18 ]
  ret i1 %.0
}

; Function Attrs: nounwind readnone uwtable
define zeroext i1 @eqNumber(i32 %a.coerce0, i64 %a.coerce1, i32 %b.coerce0, i64 %b.coerce1) #0 {
  %1 = icmp eq i32 %a.coerce0, 0
  %2 = icmp eq i32 %b.coerce0, 0
  br i1 %1, label %3, label %12

; <label>:3                                       ; preds = %0
  %4 = trunc i64 %a.coerce1 to i32
  br i1 %2, label %5, label %8

; <label>:5                                       ; preds = %3
  %6 = trunc i64 %b.coerce1 to i32
  %7 = icmp eq i32 %4, %6
  br label %21

; <label>:8                                       ; preds = %3
  %9 = sitofp i32 %4 to double
  %10 = bitcast i64 %b.coerce1 to double
  %11 = fcmp oeq double %9, %10
  br label %21

; <label>:12                                      ; preds = %0
  %13 = bitcast i64 %a.coerce1 to double
  br i1 %2, label %14, label %18

; <label>:14                                      ; preds = %12
  %15 = trunc i64 %b.coerce1 to i32
  %16 = sitofp i32 %15 to double
  %17 = fcmp oeq double %13, %16
  br label %21

; <label>:18                                      ; preds = %12
  %19 = bitcast i64 %b.coerce1 to double
  %20 = fcmp oeq double %13, %19
  br label %21

; <label>:21                                      ; preds = %18, %14, %8, %5
  %.0 = phi i1 [ %7, %5 ], [ %11, %8 ], [ %17, %14 ], [ %20, %18 ]
  ret i1 %.0
}

; Function Attrs: nounwind readnone uwtable
define zeroext i1 @neqNumber(i32 %a.coerce0, i64 %a.coerce1, i32 %b.coerce0, i64 %b.coerce1) #0 {
  %1 = icmp eq i32 %a.coerce0, 0
  %2 = icmp eq i32 %b.coerce0, 0
  br i1 %1, label %3, label %12

; <label>:3                                       ; preds = %0
  %4 = trunc i64 %a.coerce1 to i32
  br i1 %2, label %5, label %8

; <label>:5                                       ; preds = %3
  %6 = trunc i64 %b.coerce1 to i32
  %7 = icmp ne i32 %4, %6
  br label %21

; <label>:8                                       ; preds = %3
  %9 = sitofp i32 %4 to double
  %10 = bitcast i64 %b.coerce1 to double
  %11 = fcmp une double %9, %10
  br label %21

; <label>:12                                      ; preds = %0
  %13 = bitcast i64 %a.coerce1 to double
  br i1 %2, label %14, label %18

; <label>:14                                      ; preds = %12
  %15 = trunc i64 %b.coerce1 to i32
  %16 = sitofp i32 %15 to double
  %17 = fcmp une double %13, %16
  br label %21

; <label>:18                                      ; preds = %12
  %19 = bitcast i64 %b.coerce1 to double
  %20 = fcmp une double %13, %19
  br label %21

; <label>:21                                      ; preds = %18, %14, %8, %5
  %.0 = phi i1 [ %7, %5 ], [ %11, %8 ], [ %17, %14 ], [ %20, %18 ]
  ret i1 %.0
}

; Function Attrs: nounwind uwtable
define %struct.IntList* @allocateIntList(%struct.IntList* %p) #1 {
  %1 = icmp eq %struct.IntList* %p, null
  %2 = load %struct.IntList** @allocateIntList.pool, align 8, !tbaa !1
  br i1 %1, label %3, label %16

; <label>:3                                       ; preds = %0
  %4 = icmp eq %struct.IntList* %2, null
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %3
  %6 = tail call noalias i8* @malloc(i64 24000) #7
  %7 = bitcast i8* %6 to %struct.IntList*
  %scevgep = getelementptr i8* %6, i64 23976
  br label %8

; <label>:8                                       ; preds = %8, %5
  %indvars.iv = phi i64 [ 0, %5 ], [ %indvars.iv.next, %8 ]
  %9 = phi %struct.IntList* [ null, %5 ], [ %10, %8 ]
  %10 = getelementptr inbounds %struct.IntList* %7, i64 %indvars.iv
  %11 = getelementptr inbounds %struct.IntList* %7, i64 %indvars.iv, i32 1
  store %struct.IntList* %9, %struct.IntList** %11, align 8, !tbaa !5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %.loopexit, label %8

.loopexit:                                        ; preds = %8
  %scevgep3 = bitcast i8* %scevgep to %struct.IntList*
  store %struct.IntList* %scevgep3, %struct.IntList** @allocateIntList.pool, align 8, !tbaa !1
  br label %12

; <label>:12                                      ; preds = %.loopexit, %3
  %13 = phi %struct.IntList* [ %scevgep3, %.loopexit ], [ %2, %3 ]
  %14 = getelementptr inbounds %struct.IntList* %13, i64 0, i32 1
  %15 = load %struct.IntList** %14, align 8, !tbaa !5
  br label %19

; <label>:16                                      ; preds = %0
  %17 = getelementptr inbounds %struct.IntList* %p, i64 0, i32 1
  store %struct.IntList* %2, %struct.IntList** %17, align 8, !tbaa !5
  %18 = getelementptr inbounds %struct.IntList* %p, i64 0, i32 2
  store i32 1, i32* %18, align 4, !tbaa !8
  br label %19

; <label>:19                                      ; preds = %16, %12
  %storemerge = phi %struct.IntList* [ %15, %12 ], [ %p, %16 ]
  %.0 = phi %struct.IntList* [ %13, %12 ], [ null, %16 ]
  store %struct.IntList* %storemerge, %struct.IntList** @allocateIntList.pool, align 8, !tbaa !1
  ret %struct.IntList* %.0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define %struct.IntList* @retainIntList(%struct.IntList* %p) #1 {
  %1 = icmp eq %struct.IntList* %p, null
  br i1 %1, label %6, label %2

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.IntList* %p, i64 0, i32 2
  %4 = load i32* %3, align 4, !tbaa !8
  %5 = add nsw i32 %4, 1
  store i32 %5, i32* %3, align 4, !tbaa !8
  br label %6

; <label>:6                                       ; preds = %0, %2
  ret %struct.IntList* %p
}

; Function Attrs: nounwind uwtable
define noalias %struct.IntList* @releaseIntList(%struct.IntList* %p) #1 {
  %1 = icmp eq %struct.IntList* %p, null
  br i1 %1, label %14, label %2

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.IntList* %p, i64 0, i32 2
  %4 = load i32* %3, align 4, !tbaa !8
  %5 = add nsw i32 %4, -1
  store i32 %5, i32* %3, align 4, !tbaa !8
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %14

; <label>:7                                       ; preds = %2
  %8 = getelementptr inbounds %struct.IntList* %p, i64 0, i32 1
  %9 = load %struct.IntList** %8, align 8, !tbaa !5
  %10 = icmp eq %struct.IntList* %9, null
  br i1 %10, label %allocateIntList.exit, label %11

; <label>:11                                      ; preds = %7
  %12 = tail call %struct.IntList* @releaseIntList(%struct.IntList* %p)
  br label %allocateIntList.exit

allocateIntList.exit:                             ; preds = %7, %11
  %13 = load %struct.IntList** @allocateIntList.pool, align 8, !tbaa !1
  store %struct.IntList* %13, %struct.IntList** %8, align 8, !tbaa !5
  store i32 1, i32* %3, align 4, !tbaa !8
  store %struct.IntList* %p, %struct.IntList** @allocateIntList.pool, align 8, !tbaa !1
  br label %14

; <label>:14                                      ; preds = %0, %2, %allocateIntList.exit
  ret %struct.IntList* null
}

; Function Attrs: nounwind uwtable
define %struct.IntList* @newIntList(i32 %val, %struct.IntList* %nxt) #1 {
  %1 = load %struct.IntList** @allocateIntList.pool, align 8, !tbaa !1
  %2 = icmp eq %struct.IntList* %1, null
  br i1 %2, label %3, label %allocateIntList.exit

; <label>:3                                       ; preds = %0
  %4 = tail call noalias i8* @malloc(i64 24000) #7
  %5 = bitcast i8* %4 to %struct.IntList*
  br label %6

; <label>:6                                       ; preds = %6, %3
  %indvars.iv.i = phi i64 [ 0, %3 ], [ %indvars.iv.next.i, %6 ]
  %7 = phi %struct.IntList* [ null, %3 ], [ %8, %6 ]
  %8 = getelementptr inbounds %struct.IntList* %5, i64 %indvars.iv.i
  %9 = getelementptr inbounds %struct.IntList* %5, i64 %indvars.iv.i, i32 1
  store %struct.IntList* %7, %struct.IntList** %9, align 8, !tbaa !5
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 1000
  br i1 %exitcond.i, label %.loopexit.i, label %6

.loopexit.i:                                      ; preds = %6
  %scevgep.i = getelementptr i8* %4, i64 23976
  %scevgep3.i = bitcast i8* %scevgep.i to %struct.IntList*
  store %struct.IntList* %scevgep3.i, %struct.IntList** @allocateIntList.pool, align 8, !tbaa !1
  br label %allocateIntList.exit

allocateIntList.exit:                             ; preds = %0, %.loopexit.i
  %10 = phi %struct.IntList* [ %scevgep3.i, %.loopexit.i ], [ %1, %0 ]
  %11 = getelementptr inbounds %struct.IntList* %10, i64 0, i32 1
  %12 = load %struct.IntList** %11, align 8, !tbaa !5
  store %struct.IntList* %12, %struct.IntList** @allocateIntList.pool, align 8, !tbaa !1
  %13 = getelementptr inbounds %struct.IntList* %10, i64 0, i32 0
  store i32 %val, i32* %13, align 4, !tbaa !9
  store %struct.IntList* %nxt, %struct.IntList** %11, align 8, !tbaa !5
  ret %struct.IntList* %10
}

; Function Attrs: nounwind uwtable
define noalias i8* @convertIntListToString(%struct.IntList* readonly %list) #1 {
  %1 = icmp eq %struct.IntList* %list, null
  br i1 %1, label %.thread, label %.lr.ph7

.thread:                                          ; preds = %0
  %2 = tail call noalias i8* @malloc(i64 1) #7
  br label %16

.lr.ph7:                                          ; preds = %0, %.lr.ph7
  %l.05 = phi i32 [ %phitmp, %.lr.ph7 ], [ 1, %0 ]
  %p.04 = phi %struct.IntList* [ %4, %.lr.ph7 ], [ %list, %0 ]
  %3 = getelementptr inbounds %struct.IntList* %p.04, i64 0, i32 1
  %4 = load %struct.IntList** %3, align 8, !tbaa !5
  %phitmp = add i32 %l.05, 1
  %5 = icmp eq %struct.IntList* %4, null
  br i1 %5, label %6, label %.lr.ph7

; <label>:6                                       ; preds = %.lr.ph7
  %phitmp10 = sext i32 %phitmp to i64
  %7 = tail call noalias i8* @malloc(i64 %phitmp10) #7
  br i1 %1, label %16, label %.lr.ph

.lr.ph:                                           ; preds = %6, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %6 ]
  %p1.03 = phi %struct.IntList* [ %14, %.lr.ph ], [ %list, %6 ]
  %i.02 = phi i32 [ %12, %.lr.ph ], [ 0, %6 ]
  %8 = getelementptr inbounds %struct.IntList* %p1.03, i64 0, i32 0
  %9 = load i32* %8, align 4, !tbaa !9
  %10 = trunc i32 %9 to i8
  %11 = getelementptr inbounds i8* %7, i64 %indvars.iv
  store i8 %10, i8* %11, align 1, !tbaa !10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %12 = add nsw i32 %i.02, 1
  %13 = getelementptr inbounds %struct.IntList* %p1.03, i64 0, i32 1
  %14 = load %struct.IntList** %13, align 8, !tbaa !5
  %15 = icmp eq %struct.IntList* %14, null
  br i1 %15, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph
  %phitmp11 = sext i32 %12 to i64
  br label %16

; <label>:16                                      ; preds = %.thread, %._crit_edge, %6
  %17 = phi i8* [ %7, %._crit_edge ], [ %7, %6 ], [ %2, %.thread ]
  %i.0.lcssa = phi i64 [ %phitmp11, %._crit_edge ], [ 0, %6 ], [ 0, %.thread ]
  %18 = getelementptr inbounds i8* %17, i64 %i.0.lcssa
  store i8 0, i8* %18, align 1, !tbaa !10
  ret i8* %17
}

; Function Attrs: nounwind uwtable
define %struct.VContext* @allocateVContext(%struct.VContext* %p) #1 {
  %1 = icmp eq %struct.VContext* %p, null
  %2 = load %struct.VContext** @allocateVContext.pool, align 8, !tbaa !1
  br i1 %1, label %3, label %17

; <label>:3                                       ; preds = %0
  %4 = icmp eq %struct.VContext* %2, null
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %3
  %6 = tail call noalias i8* @malloc(i64 24000) #7
  %7 = bitcast i8* %6 to %struct.VContext*
  %scevgep = getelementptr i8* %6, i64 23976
  br label %8

; <label>:8                                       ; preds = %8, %5
  %indvars.iv = phi i64 [ 0, %5 ], [ %indvars.iv.next, %8 ]
  %9 = phi %struct.VContext* [ null, %5 ], [ %10, %8 ]
  %10 = getelementptr inbounds %struct.VContext* %7, i64 %indvars.iv
  %11 = getelementptr inbounds %struct.VContext* %7, i64 %indvars.iv, i32 1
  store %struct.VContext* %9, %struct.VContext** %11, align 8, !tbaa !11
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %.loopexit, label %8

.loopexit:                                        ; preds = %8
  %scevgep3 = bitcast i8* %scevgep to %struct.VContext*
  store %struct.VContext* %scevgep3, %struct.VContext** @allocateVContext.pool, align 8, !tbaa !1
  br label %12

; <label>:12                                      ; preds = %.loopexit, %3
  %13 = phi %struct.VContext* [ %scevgep3, %.loopexit ], [ %2, %3 ]
  %14 = getelementptr inbounds %struct.VContext* %13, i64 0, i32 2
  store i32 1, i32* %14, align 4, !tbaa !13
  %15 = getelementptr inbounds %struct.VContext* %13, i64 0, i32 1
  %16 = load %struct.VContext** %15, align 8, !tbaa !11
  br label %19

; <label>:17                                      ; preds = %0
  %18 = getelementptr inbounds %struct.VContext* %p, i64 0, i32 1
  store %struct.VContext* %2, %struct.VContext** %18, align 8, !tbaa !11
  br label %19

; <label>:19                                      ; preds = %17, %12
  %storemerge = phi %struct.VContext* [ %16, %12 ], [ %p, %17 ]
  %.0 = phi %struct.VContext* [ %13, %12 ], [ null, %17 ]
  store %struct.VContext* %storemerge, %struct.VContext** @allocateVContext.pool, align 8, !tbaa !1
  ret %struct.VContext* %.0
}

; Function Attrs: nounwind uwtable
define %struct.VContext* @newVContext() #1 {
  %1 = load %struct.VContext** @allocateVContext.pool, align 8, !tbaa !1
  %2 = icmp eq %struct.VContext* %1, null
  br i1 %2, label %3, label %allocateVContext.exit

; <label>:3                                       ; preds = %0
  %4 = tail call noalias i8* @malloc(i64 24000) #7
  %5 = bitcast i8* %4 to %struct.VContext*
  br label %6

; <label>:6                                       ; preds = %6, %3
  %indvars.iv.i = phi i64 [ 0, %3 ], [ %indvars.iv.next.i, %6 ]
  %7 = phi %struct.VContext* [ null, %3 ], [ %8, %6 ]
  %8 = getelementptr inbounds %struct.VContext* %5, i64 %indvars.iv.i
  %9 = getelementptr inbounds %struct.VContext* %5, i64 %indvars.iv.i, i32 1
  store %struct.VContext* %7, %struct.VContext** %9, align 8, !tbaa !11
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 1000
  br i1 %exitcond.i, label %.loopexit.i, label %6

.loopexit.i:                                      ; preds = %6
  %scevgep.i = getelementptr i8* %4, i64 23976
  %scevgep3.i = bitcast i8* %scevgep.i to %struct.VContext*
  store %struct.VContext* %scevgep3.i, %struct.VContext** @allocateVContext.pool, align 8, !tbaa !1
  br label %allocateVContext.exit

allocateVContext.exit:                            ; preds = %0, %.loopexit.i
  %10 = phi %struct.VContext* [ %scevgep3.i, %.loopexit.i ], [ %1, %0 ]
  %11 = getelementptr inbounds %struct.VContext* %10, i64 0, i32 2
  store i32 1, i32* %11, align 4, !tbaa !13
  %12 = getelementptr inbounds %struct.VContext* %10, i64 0, i32 1
  %13 = load %struct.VContext** %12, align 8, !tbaa !11
  store %struct.VContext* %13, %struct.VContext** @allocateVContext.pool, align 8, !tbaa !1
  %14 = bitcast %struct.VContext* %10 to i8*
  call void @llvm.memset.p0i8.i64(i8* %14, i8 0, i64 16, i32 8, i1 false)
  ret %struct.VContext* %10
}

; Function Attrs: nounwind uwtable
define %struct.VContext* @retainVContext(%struct.VContext* %p) #1 {
  %1 = icmp eq %struct.VContext* %p, null
  br i1 %1, label %6, label %2

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.VContext* %p, i64 0, i32 2
  %4 = load i32* %3, align 4, !tbaa !13
  %5 = add nsw i32 %4, 1
  store i32 %5, i32* %3, align 4, !tbaa !13
  br label %6

; <label>:6                                       ; preds = %0, %2
  ret %struct.VContext* %p
}

; Function Attrs: nounwind uwtable
define noalias %struct.VContext* @releaseVContext(%struct.VContext* %p) #1 {
  %1 = icmp eq %struct.VContext* %p, null
  br i1 %1, label %14, label %2

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.VContext* %p, i64 0, i32 2
  %4 = load i32* %3, align 4, !tbaa !13
  %5 = add nsw i32 %4, -1
  store i32 %5, i32* %3, align 4, !tbaa !13
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %14

; <label>:7                                       ; preds = %2
  %8 = getelementptr inbounds %struct.VContext* %p, i64 0, i32 1
  %9 = load %struct.VContext** %8, align 8, !tbaa !11
  %10 = icmp eq %struct.VContext* %9, null
  br i1 %10, label %allocateVContext.exit, label %11

; <label>:11                                      ; preds = %7
  %12 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %p)
  br label %allocateVContext.exit

allocateVContext.exit:                            ; preds = %7, %11
  %13 = load %struct.VContext** @allocateVContext.pool, align 8, !tbaa !1
  store %struct.VContext* %13, %struct.VContext** %8, align 8, !tbaa !11
  store %struct.VContext* %p, %struct.VContext** @allocateVContext.pool, align 8, !tbaa !1
  br label %14

; <label>:14                                      ; preds = %0, %2, %allocateVContext.exit
  ret %struct.VContext* null
}

; Function Attrs: nounwind readonly uwtable
define %struct.Value* @lookUpRef(i32 %ref, %struct.VContext* nocapture readonly %context) #3 {
  %1 = icmp sgt i32 %ref, 0
  br i1 %1, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %0, %.lr.ph
  %i.02 = phi i32 [ %4, %.lr.ph ], [ 0, %0 ]
  %.01 = phi %struct.VContext* [ %3, %.lr.ph ], [ %context, %0 ]
  %2 = getelementptr inbounds %struct.VContext* %.01, i64 0, i32 1
  %3 = load %struct.VContext** %2, align 8, !tbaa !11
  %4 = add nsw i32 %i.02, 1
  %exitcond = icmp eq i32 %4, %ref
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph, %0
  %.0.lcssa = phi %struct.VContext* [ %context, %0 ], [ %3, %.lr.ph ]
  %5 = getelementptr inbounds %struct.VContext* %.0.lcssa, i64 0, i32 0
  %6 = load %struct.Value** %5, align 8, !tbaa !14
  ret %struct.Value* %6
}

; Function Attrs: nounwind uwtable
define %struct.VContext* @insertRef(%struct.Value* %v, %struct.VContext* %context) #1 {
  %1 = load %struct.VContext** @allocateVContext.pool, align 8, !tbaa !1
  %2 = icmp eq %struct.VContext* %1, null
  br i1 %2, label %3, label %newVContext.exit

; <label>:3                                       ; preds = %0
  %4 = tail call noalias i8* @malloc(i64 24000) #7
  %5 = bitcast i8* %4 to %struct.VContext*
  br label %6

; <label>:6                                       ; preds = %6, %3
  %indvars.iv.i.i = phi i64 [ 0, %3 ], [ %indvars.iv.next.i.i, %6 ]
  %7 = phi %struct.VContext* [ null, %3 ], [ %8, %6 ]
  %8 = getelementptr inbounds %struct.VContext* %5, i64 %indvars.iv.i.i
  %9 = getelementptr inbounds %struct.VContext* %5, i64 %indvars.iv.i.i, i32 1
  store %struct.VContext* %7, %struct.VContext** %9, align 8, !tbaa !11
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %exitcond.i.i = icmp eq i64 %indvars.iv.next.i.i, 1000
  br i1 %exitcond.i.i, label %.loopexit.i.i, label %6

.loopexit.i.i:                                    ; preds = %6
  %scevgep.i.i = getelementptr i8* %4, i64 23976
  %scevgep3.i.i = bitcast i8* %scevgep.i.i to %struct.VContext*
  store %struct.VContext* %scevgep3.i.i, %struct.VContext** @allocateVContext.pool, align 8, !tbaa !1
  br label %newVContext.exit

newVContext.exit:                                 ; preds = %0, %.loopexit.i.i
  %10 = phi %struct.VContext* [ %scevgep3.i.i, %.loopexit.i.i ], [ %1, %0 ]
  %11 = getelementptr inbounds %struct.VContext* %10, i64 0, i32 2
  store i32 1, i32* %11, align 4, !tbaa !13
  %12 = getelementptr inbounds %struct.VContext* %10, i64 0, i32 1
  %13 = load %struct.VContext** %12, align 8, !tbaa !11
  store %struct.VContext* %13, %struct.VContext** @allocateVContext.pool, align 8, !tbaa !1
  %14 = getelementptr inbounds %struct.VContext* %10, i64 0, i32 0
  store %struct.Value* %v, %struct.Value** %14, align 8, !tbaa !14
  store %struct.VContext* %context, %struct.VContext** %12, align 8, !tbaa !11
  %15 = icmp eq %struct.VContext* %context, null
  br i1 %15, label %._crit_edge, label %retainVContext.exit

retainVContext.exit:                              ; preds = %newVContext.exit, %retainVContext.exit
  %p.01 = phi %struct.VContext* [ %20, %retainVContext.exit ], [ %context, %newVContext.exit ]
  %16 = getelementptr inbounds %struct.VContext* %p.01, i64 0, i32 2
  %17 = load i32* %16, align 4, !tbaa !13
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %16, align 4, !tbaa !13
  %19 = getelementptr inbounds %struct.VContext* %p.01, i64 0, i32 1
  %20 = load %struct.VContext** %19, align 8, !tbaa !11
  %21 = icmp eq %struct.VContext* %20, null
  br i1 %21, label %._crit_edge, label %retainVContext.exit

._crit_edge:                                      ; preds = %retainVContext.exit, %newVContext.exit
  ret %struct.VContext* %10
}

; Function Attrs: nounwind uwtable
define noalias %struct.Continuation* @newContinuation() #1 {
  %1 = tail call noalias i8* @malloc(i64 32) #7
  %2 = bitcast i8* %1 to %struct.Continuation*
  ret %struct.Continuation* %2
}

; Function Attrs: nounwind uwtable
define noalias %struct.Continuation* @releaseContinuation(%struct.Continuation* nocapture %p) #1 {
  %1 = bitcast %struct.Continuation* %p to i8*
  tail call void @free(i8* %1) #7
  ret %struct.Continuation* null
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @displayExp(%struct.VExp* nocapture readonly %e) #1 {
  %1 = getelementptr inbounds %struct.VExp* %e, i64 0, i32 0
  %2 = load i32* %1, align 4, !tbaa !15
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %17

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %struct.VExp* %e, i64 0, i32 3, i32 0, i32 0
  %6 = load i32* %5, align 8
  %7 = getelementptr inbounds %struct.VExp* %e, i64 0, i32 3, i32 0, i32 2
  %8 = bitcast %union.SyscallArg* %7 to double*
  %9 = load double* %8, align 8
  %10 = icmp eq i32 %6, 0
  br i1 %10, label %11, label %15

; <label>:11                                      ; preds = %4
  %12 = bitcast double %9 to i64
  %13 = trunc i64 %12 to i32
  %14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i32 %13) #7
  br label %19

; <label>:15                                      ; preds = %4
  %16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), double %9) #7
  br label %19

; <label>:17                                      ; preds = %0
  %18 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str4, i64 0, i64 0)) #7
  br label %19

; <label>:19                                      ; preds = %11, %15, %17
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define %struct.VExp* @allocateVExp(%struct.VExp* %p) #1 {
  %1 = icmp eq %struct.VExp* %p, null
  %2 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br i1 %1, label %3, label %19

; <label>:3                                       ; preds = %0
  %4 = icmp eq %struct.VExp* %2, null
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %3
  %6 = tail call noalias i8* @malloc(i64 56000) #7
  %7 = bitcast i8* %6 to %struct.VExp*
  %scevgep = getelementptr i8* %6, i64 55944
  br label %8

; <label>:8                                       ; preds = %8, %5
  %indvars.iv = phi i64 [ 0, %5 ], [ %indvars.iv.next, %8 ]
  %9 = phi %struct.VExp* [ null, %5 ], [ %10, %8 ]
  %10 = getelementptr inbounds %struct.VExp* %7, i64 %indvars.iv
  %11 = getelementptr inbounds %struct.VExp* %7, i64 %indvars.iv, i32 3
  %12 = bitcast %union.anon.1* %11 to %struct.VExp**
  store %struct.VExp* %9, %struct.VExp** %12, align 8, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %.loopexit, label %8

.loopexit:                                        ; preds = %8
  %scevgep3 = bitcast i8* %scevgep to %struct.VExp*
  store %struct.VExp* %scevgep3, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %13

; <label>:13                                      ; preds = %.loopexit, %3
  %14 = phi %struct.VExp* [ %scevgep3, %.loopexit ], [ %2, %3 ]
  %15 = getelementptr inbounds %struct.VExp* %14, i64 0, i32 4
  store i32 1, i32* %15, align 4, !tbaa !17
  %16 = getelementptr inbounds %struct.VExp* %14, i64 0, i32 3
  %17 = bitcast %union.anon.1* %16 to %struct.VExp**
  %18 = load %struct.VExp** %17, align 8, !tbaa !1
  br label %22

; <label>:19                                      ; preds = %0
  %20 = getelementptr inbounds %struct.VExp* %p, i64 0, i32 3
  %21 = bitcast %union.anon.1* %20 to %struct.VExp**
  store %struct.VExp* %2, %struct.VExp** %21, align 8, !tbaa !1
  br label %22

; <label>:22                                      ; preds = %19, %13
  %storemerge = phi %struct.VExp* [ %18, %13 ], [ %p, %19 ]
  %.0 = phi %struct.VExp* [ %14, %13 ], [ null, %19 ]
  store %struct.VExp* %storemerge, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  ret %struct.VExp* %.0
}

; Function Attrs: nounwind uwtable
define %struct.VExp* @retainVExp(%struct.VExp* %p) #1 {
  %1 = icmp eq %struct.VExp* %p, null
  br i1 %1, label %6, label %2

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.VExp* %p, i64 0, i32 4
  %4 = load i32* %3, align 4, !tbaa !17
  %5 = add nsw i32 %4, 1
  store i32 %5, i32* %3, align 4, !tbaa !17
  br label %6

; <label>:6                                       ; preds = %0, %2
  ret %struct.VExp* %p
}

; Function Attrs: nounwind uwtable
define noalias %struct.VExp* @releaseVExp(%struct.VExp* %p) #1 {
  %1 = icmp eq %struct.VExp* %p, null
  br i1 %1, label %58, label %2

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.VExp* %p, i64 0, i32 4
  %4 = load i32* %3, align 4, !tbaa !17
  %5 = add nsw i32 %4, -1
  store i32 %5, i32* %3, align 4, !tbaa !17
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %58

; <label>:7                                       ; preds = %2
  %8 = getelementptr inbounds %struct.VExp* %p, i64 0, i32 0
  %9 = load i32* %8, align 4, !tbaa !15
  switch i32 %9, label %allocateVExp.exit [
    i32 1, label %10
    i32 8, label %15
    i32 4, label %24
    i32 5, label %29
  ]

; <label>:10                                      ; preds = %7
  %11 = getelementptr inbounds %struct.VExp* %p, i64 0, i32 3
  %12 = bitcast %union.anon.1* %11 to %struct.VExp**
  %13 = load %struct.VExp** %12, align 8, !tbaa !1
  %14 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %13)
  br label %allocateVExp.exit

; <label>:15                                      ; preds = %7
  %16 = getelementptr inbounds %struct.VExp* %p, i64 0, i32 3
  %17 = bitcast %union.anon.1* %16 to %struct.VExp**
  %18 = load %struct.VExp** %17, align 8, !tbaa !18
  %19 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %18)
  %20 = getelementptr inbounds %struct.VExp* %p, i64 0, i32 3, i32 0, i32 2
  %21 = bitcast %union.SyscallArg* %20 to %struct.VExp**
  %22 = load %struct.VExp** %21, align 8, !tbaa !20
  %23 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %22)
  br label %allocateVExp.exit

; <label>:24                                      ; preds = %7
  %25 = getelementptr inbounds %struct.VExp* %p, i64 0, i32 3
  %26 = bitcast %union.anon.1* %25 to %struct.IntList**
  %27 = load %struct.IntList** %26, align 8, !tbaa !21
  %28 = tail call %struct.IntList* @releaseIntList(%struct.IntList* %27)
  br label %allocateVExp.exit

; <label>:29                                      ; preds = %7
  %30 = getelementptr inbounds %struct.VExp* %p, i64 0, i32 3, i32 0, i32 1
  %31 = load i32* %30, align 4, !tbaa !23
  %32 = icmp sgt i32 %31, 0
  %33 = getelementptr inbounds %struct.VExp* %p, i64 0, i32 3, i32 0, i32 0
  br i1 %32, label %34, label %._crit_edge

; <label>:34                                      ; preds = %29
  %35 = load i32* %33, align 4, !tbaa !25
  switch i32 %35, label %._crit_edge [
    i32 7, label %36
    i32 1, label %36
  ]

; <label>:36                                      ; preds = %34, %34
  %37 = getelementptr inbounds %struct.VExp* %p, i64 0, i32 3, i32 0, i32 2, i32 0
  %38 = load %struct.IntList** %37, align 8, !tbaa !1
  %39 = tail call %struct.IntList* @releaseIntList(%struct.IntList* %38)
  %.pre = load i32* %30, align 4, !tbaa !23
  br label %._crit_edge

._crit_edge:                                      ; preds = %29, %34, %36
  %40 = phi i32 [ %31, %34 ], [ %.pre, %36 ], [ %31, %29 ]
  %41 = load i32* %33, align 4, !tbaa !25
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds [8 x [4 x i32]]* @syscall_arginfo, i64 0, i64 %42, i64 0
  %44 = load i32* %43, align 16, !tbaa !26
  %45 = icmp eq i32 %40, %44
  br i1 %45, label %46, label %allocateVExp.exit

; <label>:46                                      ; preds = %._crit_edge
  %47 = sext i32 %40 to i64
  %48 = getelementptr inbounds [8 x [4 x i32]]* @syscall_arginfo, i64 0, i64 %42, i64 %47
  %49 = load i32* %48, align 4, !tbaa !26
  %50 = icmp eq i32 %49, 2
  br i1 %50, label %51, label %allocateVExp.exit

; <label>:51                                      ; preds = %46
  %52 = getelementptr inbounds %struct.VExp* %p, i64 0, i32 3, i32 0, i32 4
  %53 = load %struct.Value** %52, align 8, !tbaa !27
  %54 = tail call %struct.Value* @releaseValue(%struct.Value* %53)
  br label %allocateVExp.exit

allocateVExp.exit:                                ; preds = %7, %15, %51, %46, %._crit_edge, %24, %10
  %55 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %56 = getelementptr inbounds %struct.VExp* %p, i64 0, i32 3
  %57 = bitcast %union.anon.1* %56 to %struct.VExp**
  store %struct.VExp* %55, %struct.VExp** %57, align 8, !tbaa !1
  store %struct.VExp* %p, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %58

; <label>:58                                      ; preds = %0, %2, %allocateVExp.exit
  ret %struct.VExp* null
}

; Function Attrs: nounwind uwtable
define noalias %struct.Value* @releaseValue(%struct.Value* %p) #1 {
  %1 = icmp eq %struct.Value* %p, null
  br i1 %1, label %29, label %2

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.Value* %p, i64 0, i32 2
  %4 = load i32* %3, align 4, !tbaa !28
  %5 = add nsw i32 %4, -1
  store i32 %5, i32* %3, align 4, !tbaa !28
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %allocateValue.exit

; <label>:7                                       ; preds = %2
  %8 = getelementptr inbounds %struct.Value* %p, i64 0, i32 0
  %9 = load i32* %8, align 4, !tbaa !30
  switch i32 %9, label %allocateValue.exit [
    i32 0, label %10
    i32 2, label %17
  ]

; <label>:10                                      ; preds = %7
  %11 = getelementptr inbounds %struct.Value* %p, i64 0, i32 1, i32 0, i32 0
  %12 = load %struct.VExp** %11, align 8, !tbaa !18
  %13 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %12)
  %14 = getelementptr inbounds %struct.Value* %p, i64 0, i32 1, i32 0, i32 1
  %15 = load %struct.VContext** %14, align 8, !tbaa !20
  %16 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %15)
  br label %allocateValue.exit

; <label>:17                                      ; preds = %7
  %18 = getelementptr inbounds %struct.Value* %p, i64 0, i32 1, i32 0, i32 0
  %19 = load %struct.VExp** %18, align 8, !tbaa !31
  %20 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %19)
  %21 = getelementptr inbounds %struct.Value* %p, i64 0, i32 1, i32 0, i32 1
  %22 = load %struct.VContext** %21, align 8, !tbaa !33
  %23 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %22)
  %24 = getelementptr inbounds %struct.Value* %p, i64 0, i32 1, i32 0, i32 2
  %25 = load %struct.Continuation** %24, align 8, !tbaa !34
  %26 = bitcast %struct.Continuation* %25 to i8*
  tail call void @free(i8* %26) #7
  br label %allocateValue.exit

allocateValue.exit:                               ; preds = %2, %7, %10, %17
  %27 = load %struct.Value** @allocateValue.pool, align 8
  %28 = getelementptr inbounds %struct.Value* %p, i64 0, i32 1, i32 0, i32 0
  %.c2.i = bitcast %struct.Value* %27 to %struct.VExp*
  store %struct.VExp* %.c2.i, %struct.VExp** %28, align 8, !tbaa !1
  store %struct.Value* %p, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  br label %29

; <label>:29                                      ; preds = %0, %allocateValue.exit
  ret %struct.Value* null
}

; Function Attrs: nounwind uwtable
define %struct.Value* @allocateValue(%struct.Value* %p) #1 {
  %1 = icmp eq %struct.Value* %p, null
  %2 = load %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  br i1 %1, label %3, label %18

; <label>:3                                       ; preds = %0
  %4 = icmp eq %struct.Value* %2, null
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %3
  %6 = tail call noalias i8* @malloc(i64 40000) #7
  %7 = bitcast i8* %6 to %struct.Value*
  %scevgep = getelementptr i8* %6, i64 39960
  br label %8

; <label>:8                                       ; preds = %8, %5
  %indvars.iv = phi i64 [ 0, %5 ], [ %indvars.iv.next, %8 ]
  %9 = phi %struct.Value* [ null, %5 ], [ %10, %8 ]
  %10 = getelementptr inbounds %struct.Value* %7, i64 %indvars.iv
  %11 = getelementptr inbounds %struct.Value* %7, i64 %indvars.iv, i32 1, i32 0, i32 0
  %.c = bitcast %struct.Value* %9 to %struct.VExp*
  store %struct.VExp* %.c, %struct.VExp** %11, align 8, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %.loopexit, label %8

.loopexit:                                        ; preds = %8
  %scevgep4 = bitcast i8* %scevgep to %struct.Value*
  store %struct.Value* %scevgep4, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  br label %12

; <label>:12                                      ; preds = %.loopexit, %3
  %13 = phi %struct.Value* [ %scevgep4, %.loopexit ], [ %2, %3 ]
  %14 = getelementptr inbounds %struct.Value* %13, i64 0, i32 2
  store i32 1, i32* %14, align 4, !tbaa !28
  %15 = getelementptr inbounds %struct.Value* %13, i64 0, i32 1
  %16 = bitcast %union.anon.0* %15 to %struct.Value**
  %17 = load %struct.Value** %16, align 8, !tbaa !1
  br label %20

; <label>:18                                      ; preds = %0
  %19 = getelementptr inbounds %struct.Value* %p, i64 0, i32 1, i32 0, i32 0
  %.c2 = bitcast %struct.Value* %2 to %struct.VExp*
  store %struct.VExp* %.c2, %struct.VExp** %19, align 8, !tbaa !1
  br label %20

; <label>:20                                      ; preds = %18, %12
  %storemerge = phi %struct.Value* [ %17, %12 ], [ %p, %18 ]
  %.0 = phi %struct.Value* [ %13, %12 ], [ null, %18 ]
  store %struct.Value* %storemerge, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  ret %struct.Value* %.0
}

; Function Attrs: nounwind uwtable
define %struct.Value* @newValue() #1 {
  %1 = load %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %2 = icmp eq %struct.Value* %1, null
  br i1 %2, label %3, label %allocateValue.exit

; <label>:3                                       ; preds = %0
  %4 = tail call noalias i8* @malloc(i64 40000) #7
  %5 = bitcast i8* %4 to %struct.Value*
  br label %6

; <label>:6                                       ; preds = %6, %3
  %indvars.iv.i = phi i64 [ 0, %3 ], [ %indvars.iv.next.i, %6 ]
  %7 = phi %struct.Value* [ null, %3 ], [ %8, %6 ]
  %8 = getelementptr inbounds %struct.Value* %5, i64 %indvars.iv.i
  %9 = getelementptr inbounds %struct.Value* %5, i64 %indvars.iv.i, i32 1, i32 0, i32 0
  %.c.i = bitcast %struct.Value* %7 to %struct.VExp*
  store %struct.VExp* %.c.i, %struct.VExp** %9, align 8, !tbaa !1
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 1000
  br i1 %exitcond.i, label %.loopexit.i, label %6

.loopexit.i:                                      ; preds = %6
  %scevgep.i = getelementptr i8* %4, i64 39960
  %scevgep4.i = bitcast i8* %scevgep.i to %struct.Value*
  store %struct.Value* %scevgep4.i, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  br label %allocateValue.exit

allocateValue.exit:                               ; preds = %0, %.loopexit.i
  %10 = phi %struct.Value* [ %scevgep4.i, %.loopexit.i ], [ %1, %0 ]
  %11 = getelementptr inbounds %struct.Value* %10, i64 0, i32 2
  store i32 1, i32* %11, align 4, !tbaa !28
  %12 = getelementptr inbounds %struct.Value* %10, i64 0, i32 1
  %13 = bitcast %union.anon.0* %12 to %struct.Value**
  %14 = load %struct.Value** %13, align 8, !tbaa !1
  store %struct.Value* %14, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %15 = getelementptr inbounds %struct.Value* %10, i64 0, i32 0
  store i32 2, i32* %15, align 4, !tbaa !30
  ret %struct.Value* %10
}

; Function Attrs: nounwind uwtable
define %struct.Value* @retainValue(%struct.Value* %p) #1 {
  %1 = icmp eq %struct.Value* %p, null
  br i1 %1, label %6, label %2

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.Value* %p, i64 0, i32 2
  %4 = load i32* %3, align 4, !tbaa !28
  %5 = add nsw i32 %4, 1
  store i32 %5, i32* %3, align 4, !tbaa !28
  br label %6

; <label>:6                                       ; preds = %0, %2
  ret %struct.Value* %p
}

; Function Attrs: nounwind uwtable
define noalias %struct.ValueStack* @newValueStack() #1 {
  %1 = tail call noalias i8* @malloc(i64 16) #7
  %2 = bitcast i8* %1 to %struct.ValueStack*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 16, i32 8, i1 false)
  ret %struct.ValueStack* %2
}

; Function Attrs: nounwind uwtable
define %struct.VExp* @newVExpNum(i32 %num_val.coerce0, i64 %num_val.coerce1) #1 {
  %1 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %2 = icmp eq %struct.VExp* %1, null
  br i1 %2, label %3, label %allocateVExp.exit

; <label>:3                                       ; preds = %0
  %4 = tail call noalias i8* @malloc(i64 56000) #7
  %5 = bitcast i8* %4 to %struct.VExp*
  br label %6

; <label>:6                                       ; preds = %6, %3
  %indvars.iv.i = phi i64 [ 0, %3 ], [ %indvars.iv.next.i, %6 ]
  %7 = phi %struct.VExp* [ null, %3 ], [ %8, %6 ]
  %8 = getelementptr inbounds %struct.VExp* %5, i64 %indvars.iv.i
  %9 = getelementptr inbounds %struct.VExp* %5, i64 %indvars.iv.i, i32 3
  %10 = bitcast %union.anon.1* %9 to %struct.VExp**
  store %struct.VExp* %7, %struct.VExp** %10, align 8, !tbaa !1
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 1000
  br i1 %exitcond.i, label %.loopexit.i, label %6

.loopexit.i:                                      ; preds = %6
  %scevgep.i = getelementptr i8* %4, i64 55944
  %scevgep3.i = bitcast i8* %scevgep.i to %struct.VExp*
  store %struct.VExp* %scevgep3.i, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %allocateVExp.exit

allocateVExp.exit:                                ; preds = %0, %.loopexit.i
  %11 = phi %struct.VExp* [ %scevgep3.i, %.loopexit.i ], [ %1, %0 ]
  %12 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 4
  store i32 1, i32* %12, align 4, !tbaa !17
  %13 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3
  %14 = bitcast %union.anon.1* %13 to %struct.VExp**
  %15 = load %struct.VExp** %14, align 8, !tbaa !1
  store %struct.VExp* %15, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %16 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 0
  store i32 0, i32* %16, align 4, !tbaa !15
  %17 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3, i32 0, i32 0
  store i32 %num_val.coerce0, i32* %17, align 8
  %18 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3, i32 0, i32 2, i32 0
  %num_val.coerce1.c = inttoptr i64 %num_val.coerce1 to %struct.IntList*
  store %struct.IntList* %num_val.coerce1.c, %struct.IntList** %18, align 8
  ret %struct.VExp* %11
}

; Function Attrs: nounwind uwtable
define %struct.VExp* @newVExpAbs(%struct.VExp* %abs_val) #1 {
  %1 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %2 = icmp eq %struct.VExp* %1, null
  br i1 %2, label %3, label %allocateVExp.exit

; <label>:3                                       ; preds = %0
  %4 = tail call noalias i8* @malloc(i64 56000) #7
  %5 = bitcast i8* %4 to %struct.VExp*
  br label %6

; <label>:6                                       ; preds = %6, %3
  %indvars.iv.i = phi i64 [ 0, %3 ], [ %indvars.iv.next.i, %6 ]
  %7 = phi %struct.VExp* [ null, %3 ], [ %8, %6 ]
  %8 = getelementptr inbounds %struct.VExp* %5, i64 %indvars.iv.i
  %9 = getelementptr inbounds %struct.VExp* %5, i64 %indvars.iv.i, i32 3
  %10 = bitcast %union.anon.1* %9 to %struct.VExp**
  store %struct.VExp* %7, %struct.VExp** %10, align 8, !tbaa !1
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 1000
  br i1 %exitcond.i, label %.loopexit.i, label %6

.loopexit.i:                                      ; preds = %6
  %scevgep.i = getelementptr i8* %4, i64 55944
  %scevgep3.i = bitcast i8* %scevgep.i to %struct.VExp*
  store %struct.VExp* %scevgep3.i, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %allocateVExp.exit

allocateVExp.exit:                                ; preds = %0, %.loopexit.i
  %11 = phi %struct.VExp* [ %scevgep3.i, %.loopexit.i ], [ %1, %0 ]
  %12 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 4
  store i32 1, i32* %12, align 4, !tbaa !17
  %13 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3
  %14 = bitcast %union.anon.1* %13 to %struct.VExp**
  %15 = load %struct.VExp** %14, align 8, !tbaa !1
  store %struct.VExp* %15, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %16 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 0
  store i32 1, i32* %16, align 4, !tbaa !15
  store %struct.VExp* %abs_val, %struct.VExp** %14, align 8, !tbaa !1
  ret %struct.VExp* %11
}

; Function Attrs: nounwind uwtable
define %struct.VExp* @newVExpRef(i32 %ref_val) #1 {
  %1 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %2 = icmp eq %struct.VExp* %1, null
  br i1 %2, label %3, label %allocateVExp.exit

; <label>:3                                       ; preds = %0
  %4 = tail call noalias i8* @malloc(i64 56000) #7
  %5 = bitcast i8* %4 to %struct.VExp*
  br label %6

; <label>:6                                       ; preds = %6, %3
  %indvars.iv.i = phi i64 [ 0, %3 ], [ %indvars.iv.next.i, %6 ]
  %7 = phi %struct.VExp* [ null, %3 ], [ %8, %6 ]
  %8 = getelementptr inbounds %struct.VExp* %5, i64 %indvars.iv.i
  %9 = getelementptr inbounds %struct.VExp* %5, i64 %indvars.iv.i, i32 3
  %10 = bitcast %union.anon.1* %9 to %struct.VExp**
  store %struct.VExp* %7, %struct.VExp** %10, align 8, !tbaa !1
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 1000
  br i1 %exitcond.i, label %.loopexit.i, label %6

.loopexit.i:                                      ; preds = %6
  %scevgep.i = getelementptr i8* %4, i64 55944
  %scevgep3.i = bitcast i8* %scevgep.i to %struct.VExp*
  store %struct.VExp* %scevgep3.i, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %allocateVExp.exit

allocateVExp.exit:                                ; preds = %0, %.loopexit.i
  %11 = phi %struct.VExp* [ %scevgep3.i, %.loopexit.i ], [ %1, %0 ]
  %12 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 4
  store i32 1, i32* %12, align 4, !tbaa !17
  %13 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3
  %14 = bitcast %union.anon.1* %13 to %struct.VExp**
  %15 = load %struct.VExp** %14, align 8, !tbaa !1
  store %struct.VExp* %15, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %16 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 0
  store i32 7, i32* %16, align 4, !tbaa !15
  %17 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3, i32 0, i32 0
  store i32 %ref_val, i32* %17, align 4, !tbaa !26
  ret %struct.VExp* %11
}

; Function Attrs: nounwind uwtable
define %struct.VExp* @newVExpApply(%struct.VExp* %ap_f, %struct.VExp* %ap_x) #1 {
  %1 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %2 = icmp eq %struct.VExp* %1, null
  br i1 %2, label %3, label %allocateVExp.exit

; <label>:3                                       ; preds = %0
  %4 = tail call noalias i8* @malloc(i64 56000) #7
  %5 = bitcast i8* %4 to %struct.VExp*
  br label %6

; <label>:6                                       ; preds = %6, %3
  %indvars.iv.i = phi i64 [ 0, %3 ], [ %indvars.iv.next.i, %6 ]
  %7 = phi %struct.VExp* [ null, %3 ], [ %8, %6 ]
  %8 = getelementptr inbounds %struct.VExp* %5, i64 %indvars.iv.i
  %9 = getelementptr inbounds %struct.VExp* %5, i64 %indvars.iv.i, i32 3
  %10 = bitcast %union.anon.1* %9 to %struct.VExp**
  store %struct.VExp* %7, %struct.VExp** %10, align 8, !tbaa !1
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 1000
  br i1 %exitcond.i, label %.loopexit.i, label %6

.loopexit.i:                                      ; preds = %6
  %scevgep.i = getelementptr i8* %4, i64 55944
  %scevgep3.i = bitcast i8* %scevgep.i to %struct.VExp*
  store %struct.VExp* %scevgep3.i, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %allocateVExp.exit

allocateVExp.exit:                                ; preds = %0, %.loopexit.i
  %11 = phi %struct.VExp* [ %scevgep3.i, %.loopexit.i ], [ %1, %0 ]
  %12 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 4
  store i32 1, i32* %12, align 4, !tbaa !17
  %13 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3
  %14 = bitcast %union.anon.1* %13 to %struct.VExp**
  %15 = load %struct.VExp** %14, align 8, !tbaa !1
  store %struct.VExp* %15, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %16 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 0
  store i32 8, i32* %16, align 4, !tbaa !15
  store %struct.VExp* %ap_f, %struct.VExp** %14, align 8, !tbaa !18
  %17 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3, i32 0, i32 2, i32 0
  %ap_x.c = bitcast %struct.VExp* %ap_x to %struct.IntList*
  store %struct.IntList* %ap_x.c, %struct.IntList** %17, align 8, !tbaa !20
  ret %struct.VExp* %11
}

; Function Attrs: nounwind uwtable
define %struct.VExp* @newVExpNumfunc(i32 %func_type) #1 {
  %1 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %2 = icmp eq %struct.VExp* %1, null
  br i1 %2, label %3, label %allocateVExp.exit

; <label>:3                                       ; preds = %0
  %4 = tail call noalias i8* @malloc(i64 56000) #7
  %5 = bitcast i8* %4 to %struct.VExp*
  br label %6

; <label>:6                                       ; preds = %6, %3
  %indvars.iv.i = phi i64 [ 0, %3 ], [ %indvars.iv.next.i, %6 ]
  %7 = phi %struct.VExp* [ null, %3 ], [ %8, %6 ]
  %8 = getelementptr inbounds %struct.VExp* %5, i64 %indvars.iv.i
  %9 = getelementptr inbounds %struct.VExp* %5, i64 %indvars.iv.i, i32 3
  %10 = bitcast %union.anon.1* %9 to %struct.VExp**
  store %struct.VExp* %7, %struct.VExp** %10, align 8, !tbaa !1
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 1000
  br i1 %exitcond.i, label %.loopexit.i, label %6

.loopexit.i:                                      ; preds = %6
  %scevgep.i = getelementptr i8* %4, i64 55944
  %scevgep3.i = bitcast i8* %scevgep.i to %struct.VExp*
  store %struct.VExp* %scevgep3.i, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %allocateVExp.exit

allocateVExp.exit:                                ; preds = %0, %.loopexit.i
  %11 = phi %struct.VExp* [ %scevgep3.i, %.loopexit.i ], [ %1, %0 ]
  %12 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 4
  store i32 1, i32* %12, align 4, !tbaa !17
  %13 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3
  %14 = bitcast %union.anon.1* %13 to %struct.VExp**
  %15 = load %struct.VExp** %14, align 8, !tbaa !1
  store %struct.VExp* %15, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %16 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 0
  store i32 2, i32* %16, align 4, !tbaa !15
  %17 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3, i32 0, i32 0
  store i32 %func_type, i32* %17, align 4, !tbaa !35
  ret %struct.VExp* %11
}

; Function Attrs: nounwind uwtable
define %struct.VExp* @newVExpNumfunc1(i32 %func1_type, i32 %func1_opa.coerce0, i64 %func1_opa.coerce1) #1 {
  %1 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %2 = icmp eq %struct.VExp* %1, null
  br i1 %2, label %3, label %allocateVExp.exit

; <label>:3                                       ; preds = %0
  %4 = tail call noalias i8* @malloc(i64 56000) #7
  %5 = bitcast i8* %4 to %struct.VExp*
  br label %6

; <label>:6                                       ; preds = %6, %3
  %indvars.iv.i = phi i64 [ 0, %3 ], [ %indvars.iv.next.i, %6 ]
  %7 = phi %struct.VExp* [ null, %3 ], [ %8, %6 ]
  %8 = getelementptr inbounds %struct.VExp* %5, i64 %indvars.iv.i
  %9 = getelementptr inbounds %struct.VExp* %5, i64 %indvars.iv.i, i32 3
  %10 = bitcast %union.anon.1* %9 to %struct.VExp**
  store %struct.VExp* %7, %struct.VExp** %10, align 8, !tbaa !1
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 1000
  br i1 %exitcond.i, label %.loopexit.i, label %6

.loopexit.i:                                      ; preds = %6
  %scevgep.i = getelementptr i8* %4, i64 55944
  %scevgep3.i = bitcast i8* %scevgep.i to %struct.VExp*
  store %struct.VExp* %scevgep3.i, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %allocateVExp.exit

allocateVExp.exit:                                ; preds = %0, %.loopexit.i
  %11 = phi %struct.VExp* [ %scevgep3.i, %.loopexit.i ], [ %1, %0 ]
  %12 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 4
  store i32 1, i32* %12, align 4, !tbaa !17
  %13 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3
  %14 = bitcast %union.anon.1* %13 to %struct.VExp**
  %15 = load %struct.VExp** %14, align 8, !tbaa !1
  store %struct.VExp* %15, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %16 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 0
  store i32 3, i32* %16, align 4, !tbaa !15
  %17 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3, i32 0, i32 0
  store i32 %func1_type, i32* %17, align 4, !tbaa !37
  %18 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3, i32 0, i32 2
  %19 = bitcast %union.SyscallArg* %18 to i32*
  store i32 %func1_opa.coerce0, i32* %19, align 8
  %20 = getelementptr inbounds %union.SyscallArg* %18, i64 1, i32 0
  %func1_opa.coerce1.c = inttoptr i64 %func1_opa.coerce1 to %struct.IntList*
  store %struct.IntList* %func1_opa.coerce1.c, %struct.IntList** %20, align 8
  ret %struct.VExp* %11
}

; Function Attrs: nounwind uwtable
define %struct.VExp* @newVExpIntList(%struct.IntList* %intlist_val) #1 {
  %1 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %2 = icmp eq %struct.VExp* %1, null
  br i1 %2, label %3, label %allocateVExp.exit

; <label>:3                                       ; preds = %0
  %4 = tail call noalias i8* @malloc(i64 56000) #7
  %5 = bitcast i8* %4 to %struct.VExp*
  br label %6

; <label>:6                                       ; preds = %6, %3
  %indvars.iv.i = phi i64 [ 0, %3 ], [ %indvars.iv.next.i, %6 ]
  %7 = phi %struct.VExp* [ null, %3 ], [ %8, %6 ]
  %8 = getelementptr inbounds %struct.VExp* %5, i64 %indvars.iv.i
  %9 = getelementptr inbounds %struct.VExp* %5, i64 %indvars.iv.i, i32 3
  %10 = bitcast %union.anon.1* %9 to %struct.VExp**
  store %struct.VExp* %7, %struct.VExp** %10, align 8, !tbaa !1
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 1000
  br i1 %exitcond.i, label %.loopexit.i, label %6

.loopexit.i:                                      ; preds = %6
  %scevgep.i = getelementptr i8* %4, i64 55944
  %scevgep3.i = bitcast i8* %scevgep.i to %struct.VExp*
  store %struct.VExp* %scevgep3.i, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %allocateVExp.exit

allocateVExp.exit:                                ; preds = %0, %.loopexit.i
  %11 = phi %struct.VExp* [ %scevgep3.i, %.loopexit.i ], [ %1, %0 ]
  %12 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 4
  store i32 1, i32* %12, align 4, !tbaa !17
  %13 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3
  %14 = bitcast %union.anon.1* %13 to %struct.VExp**
  %15 = load %struct.VExp** %14, align 8, !tbaa !1
  store %struct.VExp* %15, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %16 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 0
  store i32 4, i32* %16, align 4, !tbaa !15
  %17 = bitcast %union.anon.1* %13 to %struct.IntList**
  store %struct.IntList* %intlist_val, %struct.IntList** %17, align 8, !tbaa !21
  ret %struct.VExp* %11
}

; Function Attrs: nounwind uwtable
define %struct.VExp* @newVExpSyscall0(i32 %sys_type) #1 {
  %1 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %2 = icmp eq %struct.VExp* %1, null
  br i1 %2, label %3, label %allocateVExp.exit

; <label>:3                                       ; preds = %0
  %4 = tail call noalias i8* @malloc(i64 56000) #7
  %5 = bitcast i8* %4 to %struct.VExp*
  br label %6

; <label>:6                                       ; preds = %6, %3
  %indvars.iv.i = phi i64 [ 0, %3 ], [ %indvars.iv.next.i, %6 ]
  %7 = phi %struct.VExp* [ null, %3 ], [ %8, %6 ]
  %8 = getelementptr inbounds %struct.VExp* %5, i64 %indvars.iv.i
  %9 = getelementptr inbounds %struct.VExp* %5, i64 %indvars.iv.i, i32 3
  %10 = bitcast %union.anon.1* %9 to %struct.VExp**
  store %struct.VExp* %7, %struct.VExp** %10, align 8, !tbaa !1
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 1000
  br i1 %exitcond.i, label %.loopexit.i, label %6

.loopexit.i:                                      ; preds = %6
  %scevgep.i = getelementptr i8* %4, i64 55944
  %scevgep3.i = bitcast i8* %scevgep.i to %struct.VExp*
  store %struct.VExp* %scevgep3.i, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %allocateVExp.exit

allocateVExp.exit:                                ; preds = %0, %.loopexit.i
  %11 = phi %struct.VExp* [ %scevgep3.i, %.loopexit.i ], [ %1, %0 ]
  %12 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 4
  store i32 1, i32* %12, align 4, !tbaa !17
  %13 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3
  %14 = bitcast %union.anon.1* %13 to %struct.VExp**
  %15 = load %struct.VExp** %14, align 8, !tbaa !1
  store %struct.VExp* %15, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %16 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 0
  store i32 5, i32* %16, align 4, !tbaa !15
  %17 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3, i32 0, i32 0
  store i32 %sys_type, i32* %17, align 4, !tbaa !25
  %18 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3, i32 0, i32 1
  store i32 0, i32* %18, align 4, !tbaa !23
  ret %struct.VExp* %11
}

; Function Attrs: nounwind uwtable
define %struct.VExp* @appendSyscallArg(%struct.VExp* nocapture readonly %exp, %struct.Value* %x, i8** nocapture %error_message, %struct.Value** nocapture %to_resolve) #1 {
  store i8* null, i8** %error_message, align 8, !tbaa !1
  store %struct.Value* null, %struct.Value** %to_resolve, align 8, !tbaa !1
  %1 = getelementptr inbounds %struct.VExp* %exp, i64 0, i32 3, i32 0, i32 0
  %2 = load i32* %1, align 4, !tbaa !25
  %3 = zext i32 %2 to i64
  %4 = getelementptr inbounds [8 x [4 x i32]]* @syscall_arginfo, i64 0, i64 %3, i64 0
  %5 = load i32* %4, align 16, !tbaa !26
  %6 = getelementptr inbounds %struct.VExp* %exp, i64 0, i32 3, i32 0, i32 1
  %7 = load i32* %6, align 4, !tbaa !23
  %8 = icmp sgt i32 %5, %7
  br i1 %8, label %10, label %9

; <label>:9                                       ; preds = %0
  store i8* getelementptr inbounds ([30 x i8]* @.str5, i64 0, i64 0), i8** %error_message, align 8, !tbaa !1
  br label %127

; <label>:10                                      ; preds = %0
  %11 = add nsw i32 %7, 1
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [8 x [4 x i32]]* @syscall_arginfo, i64 0, i64 %3, i64 %12
  %14 = load i32* %13, align 4, !tbaa !26
  %15 = icmp eq i32 %14, 2
  br i1 %15, label %.thread4, label %16

; <label>:16                                      ; preds = %10
  %17 = getelementptr inbounds %struct.Value* %x, i64 0, i32 0
  %18 = load i32* %17, align 4, !tbaa !30
  %switch = icmp ult i32 %18, 2
  br i1 %switch, label %20, label %19

; <label>:19                                      ; preds = %16
  store %struct.Value* %x, %struct.Value** %to_resolve, align 8, !tbaa !1
  br label %127

; <label>:20                                      ; preds = %16
  switch i32 %14, label %.thread4 [
    i32 0, label %21
    i32 1, label %32
  ]

; <label>:21                                      ; preds = %20
  %22 = getelementptr inbounds %struct.Value* %x, i64 0, i32 1, i32 0, i32 0
  %23 = load %struct.VExp** %22, align 8, !tbaa !18
  %24 = getelementptr inbounds %struct.VExp* %23, i64 0, i32 0
  %25 = load i32* %24, align 4, !tbaa !15
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %31

; <label>:27                                      ; preds = %21
  %28 = getelementptr inbounds %struct.VExp* %23, i64 0, i32 3, i32 0, i32 0
  %29 = load i32* %28, align 4, !tbaa !40
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %.thread4, label %31

; <label>:31                                      ; preds = %27, %21
  store i8* getelementptr inbounds ([42 x i8]* @.str6, i64 0, i64 0), i8** %error_message, align 8, !tbaa !1
  br label %127

; <label>:32                                      ; preds = %20
  %33 = getelementptr inbounds %struct.Value* %x, i64 0, i32 1, i32 0, i32 0
  %34 = load %struct.VExp** %33, align 8, !tbaa !18
  %35 = getelementptr inbounds %struct.VExp* %34, i64 0, i32 0
  %36 = load i32* %35, align 4, !tbaa !15
  %37 = icmp eq i32 %36, 4
  br i1 %37, label %.thread4, label %38

; <label>:38                                      ; preds = %32
  store i8* getelementptr inbounds ([42 x i8]* @.str7, i64 0, i64 0), i8** %error_message, align 8, !tbaa !1
  br label %127

.thread4:                                         ; preds = %20, %10, %27, %32
  %39 = phi i1 [ true, %27 ], [ false, %32 ], [ false, %10 ], [ false, %20 ]
  %40 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %41 = icmp eq %struct.VExp* %40, null
  br i1 %41, label %42, label %allocateVExp.exit

; <label>:42                                      ; preds = %.thread4
  %43 = tail call noalias i8* @malloc(i64 56000) #7
  %44 = bitcast i8* %43 to %struct.VExp*
  br label %45

; <label>:45                                      ; preds = %45, %42
  %indvars.iv.i = phi i64 [ 0, %42 ], [ %indvars.iv.next.i, %45 ]
  %46 = phi %struct.VExp* [ null, %42 ], [ %47, %45 ]
  %47 = getelementptr inbounds %struct.VExp* %44, i64 %indvars.iv.i
  %48 = getelementptr inbounds %struct.VExp* %44, i64 %indvars.iv.i, i32 3
  %49 = bitcast %union.anon.1* %48 to %struct.VExp**
  store %struct.VExp* %46, %struct.VExp** %49, align 8, !tbaa !1
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 1000
  br i1 %exitcond.i, label %.loopexit.i, label %45

.loopexit.i:                                      ; preds = %45
  %scevgep.i = getelementptr i8* %43, i64 55944
  %scevgep3.i = bitcast i8* %scevgep.i to %struct.VExp*
  store %struct.VExp* %scevgep3.i, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %allocateVExp.exit

allocateVExp.exit:                                ; preds = %.thread4, %.loopexit.i
  %50 = phi %struct.VExp* [ %scevgep3.i, %.loopexit.i ], [ %40, %.thread4 ]
  %51 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 4
  store i32 1, i32* %51, align 4, !tbaa !17
  %52 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3
  %53 = bitcast %union.anon.1* %52 to %struct.VExp**
  %54 = load %struct.VExp** %53, align 8, !tbaa !1
  store %struct.VExp* %54, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %55 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 0
  store i32 5, i32* %55, align 4, !tbaa !15
  %56 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 0
  store i32 %2, i32* %56, align 4, !tbaa !25
  %57 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 1
  store i32 %11, i32* %57, align 4, !tbaa !23
  %58 = load i32* %6, align 4, !tbaa !23
  %59 = icmp sgt i32 %58, 0
  br i1 %59, label %60, label %.thread5

; <label>:60                                      ; preds = %allocateVExp.exit
  %61 = load i32* %1, align 4, !tbaa !25
  %62 = zext i32 %61 to i64
  %63 = lshr i64 61, %62
  %64 = and i64 %63, 1
  %65 = icmp eq i64 %64, 0
  br i1 %65, label %72, label %66

; <label>:66                                      ; preds = %60
  %67 = getelementptr inbounds %struct.VExp* %exp, i64 0, i32 3, i32 0, i32 2
  %68 = bitcast %union.SyscallArg* %67 to i32*
  %69 = load i32* %68, align 4, !tbaa !26
  %70 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 2
  %71 = bitcast %union.SyscallArg* %70 to i32*
  store i32 %69, i32* %71, align 4, !tbaa !26
  %.pr.pre = load i32* %6, align 4, !tbaa !23
  br label %82

; <label>:72                                      ; preds = %60
  switch i32 %61, label %82 [
    i32 7, label %73
    i32 1, label %73
  ]

; <label>:73                                      ; preds = %72, %72
  %74 = getelementptr inbounds %struct.VExp* %exp, i64 0, i32 3, i32 0, i32 2, i32 0
  %75 = load %struct.IntList** %74, align 8, !tbaa !1
  %76 = icmp eq %struct.IntList* %75, null
  br i1 %76, label %retainIntList.exit, label %77

; <label>:77                                      ; preds = %73
  %78 = getelementptr inbounds %struct.IntList* %75, i64 0, i32 2
  %79 = load i32* %78, align 4, !tbaa !8
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %78, align 4, !tbaa !8
  br label %retainIntList.exit

retainIntList.exit:                               ; preds = %73, %77
  %81 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 2, i32 0
  store %struct.IntList* %75, %struct.IntList** %81, align 8, !tbaa !1
  br label %82

; <label>:82                                      ; preds = %72, %66, %retainIntList.exit
  %.pr = phi i32 [ %58, %72 ], [ %.pr.pre, %66 ], [ %58, %retainIntList.exit ]
  %83 = icmp sgt i32 %.pr, 1
  br i1 %83, label %84, label %.thread5

; <label>:84                                      ; preds = %82
  switch i32 %61, label %.thread5 [
    i32 4, label %85
    i32 1, label %85
  ]

; <label>:85                                      ; preds = %84, %84
  %86 = getelementptr inbounds %struct.VExp* %exp, i64 0, i32 3, i32 0, i32 3
  %87 = load i32* %86, align 4, !tbaa !41
  %88 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 3
  store i32 %87, i32* %88, align 4, !tbaa !41
  br label %.thread5

.thread5:                                         ; preds = %allocateVExp.exit, %84, %85, %82
  %89 = phi i32 [ %58, %allocateVExp.exit ], [ %.pr, %84 ], [ %.pr, %85 ], [ %.pr, %82 ]
  br i1 %15, label %90, label %97

; <label>:90                                      ; preds = %.thread5
  %91 = icmp eq %struct.Value* %x, null
  br i1 %91, label %retainValue.exit, label %92

; <label>:92                                      ; preds = %90
  %93 = getelementptr inbounds %struct.Value* %x, i64 0, i32 2
  %94 = load i32* %93, align 4, !tbaa !28
  %95 = add nsw i32 %94, 1
  store i32 %95, i32* %93, align 4, !tbaa !28
  br label %retainValue.exit

retainValue.exit:                                 ; preds = %90, %92
  %96 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 4
  store %struct.Value* %x, %struct.Value** %96, align 8, !tbaa !27
  br label %127

; <label>:97                                      ; preds = %.thread5
  %98 = icmp eq i32 %89, 0
  br i1 %98, label %99, label %118

; <label>:99                                      ; preds = %97
  %100 = getelementptr inbounds %struct.Value* %x, i64 0, i32 1, i32 0, i32 0
  %101 = load %struct.VExp** %100, align 8, !tbaa !18
  br i1 %39, label %102, label %108

; <label>:102                                     ; preds = %99
  %103 = getelementptr inbounds %struct.VExp* %101, i64 0, i32 3, i32 0, i32 2
  %104 = bitcast %union.SyscallArg* %103 to i32*
  %105 = load i32* %104, align 4, !tbaa !26
  %106 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 2
  %107 = bitcast %union.SyscallArg* %106 to i32*
  store i32 %105, i32* %107, align 4, !tbaa !26
  br label %127

; <label>:108                                     ; preds = %99
  %109 = getelementptr inbounds %struct.VExp* %101, i64 0, i32 3
  %110 = bitcast %union.anon.1* %109 to %struct.IntList**
  %111 = load %struct.IntList** %110, align 8, !tbaa !21
  %112 = icmp eq %struct.IntList* %111, null
  br i1 %112, label %retainIntList.exit3, label %113

; <label>:113                                     ; preds = %108
  %114 = getelementptr inbounds %struct.IntList* %111, i64 0, i32 2
  %115 = load i32* %114, align 4, !tbaa !8
  %116 = add nsw i32 %115, 1
  store i32 %116, i32* %114, align 4, !tbaa !8
  br label %retainIntList.exit3

retainIntList.exit3:                              ; preds = %108, %113
  %117 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 2, i32 0
  store %struct.IntList* %111, %struct.IntList** %117, align 8, !tbaa !1
  br label %127

; <label>:118                                     ; preds = %97
  %119 = icmp eq i32 %89, 1
  %or.cond = and i1 %119, %39
  br i1 %or.cond, label %120, label %127

; <label>:120                                     ; preds = %118
  %121 = getelementptr inbounds %struct.Value* %x, i64 0, i32 1, i32 0, i32 0
  %122 = load %struct.VExp** %121, align 8, !tbaa !18
  %123 = getelementptr inbounds %struct.VExp* %122, i64 0, i32 3, i32 0, i32 2
  %124 = bitcast %union.SyscallArg* %123 to i32*
  %125 = load i32* %124, align 4, !tbaa !26
  %126 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 3
  store i32 %125, i32* %126, align 4, !tbaa !41
  br label %127

; <label>:127                                     ; preds = %retainValue.exit, %118, %120, %102, %retainIntList.exit3, %38, %31, %19, %9
  %.0 = phi %struct.VExp* [ null, %9 ], [ null, %19 ], [ null, %31 ], [ null, %38 ], [ %50, %retainIntList.exit3 ], [ %50, %102 ], [ %50, %120 ], [ %50, %118 ], [ %50, %retainValue.exit ]
  ret %struct.VExp* %.0
}

; Function Attrs: nounwind uwtable
define %struct.Value* @resolveValue(%struct.Value* %v) #1 {
  %to_resolve = alloca %struct.Value*, align 8
  %error_message = alloca i8*, align 8
  %1 = getelementptr inbounds %struct.Value* %v, i64 0, i32 1
  %2 = getelementptr inbounds %struct.Value* %v, i64 0, i32 1, i32 0, i32 2
  %3 = load %struct.Continuation** %2, align 8, !tbaa !34
  %4 = icmp eq %struct.Continuation* %3, null
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.Value* %v, i64 0, i32 0
  store i32 0, i32* %6, align 4, !tbaa !30
  br label %830

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds %struct.Continuation* %3, i64 0, i32 0
  %9 = load i32* %8, align 4, !tbaa !42
  switch i32 %9, label %830 [
    i32 0, label %10
    i32 1, label %124
  ]

; <label>:10                                      ; preds = %7
  %11 = getelementptr inbounds %struct.Continuation* %3, i64 0, i32 1, i32 0, i32 0
  %12 = load %struct.VExp** %11, align 8, !tbaa !18
  %13 = getelementptr inbounds %struct.Continuation* %3, i64 0, i32 1, i32 0, i32 1
  %14 = load %struct.VContext** %13, align 8, !tbaa !20
  %15 = getelementptr inbounds %struct.VExp* %12, i64 0, i32 0
  %16 = load i32* %15, align 4, !tbaa !15
  %17 = icmp ult i32 %16, 6
  br i1 %17, label %18, label %34

; <label>:18                                      ; preds = %10
  %19 = getelementptr inbounds %struct.Continuation* %3, i64 0, i32 2
  %20 = load %struct.Continuation** %19, align 8, !tbaa !44
  %21 = getelementptr inbounds %struct.Value* %v, i64 0, i32 0
  store i32 2, i32* %21, align 4, !tbaa !30
  %22 = icmp eq %struct.VExp* %12, null
  br i1 %22, label %retainVExp.exit, label %23

; <label>:23                                      ; preds = %18
  %24 = getelementptr inbounds %struct.VExp* %12, i64 0, i32 4
  %25 = load i32* %24, align 4, !tbaa !17
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %24, align 4, !tbaa !17
  br label %retainVExp.exit

retainVExp.exit:                                  ; preds = %18, %23
  %27 = getelementptr inbounds %union.anon.0* %1, i64 0, i32 0, i32 0
  store %struct.VExp* %12, %struct.VExp** %27, align 8, !tbaa !31
  %28 = icmp eq %struct.VContext* %14, null
  br i1 %28, label %retainVContext.exit, label %29

; <label>:29                                      ; preds = %retainVExp.exit
  %30 = getelementptr inbounds %struct.VContext* %14, i64 0, i32 2
  %31 = load i32* %30, align 4, !tbaa !13
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %30, align 4, !tbaa !13
  br label %retainVContext.exit

retainVContext.exit:                              ; preds = %retainVExp.exit, %29
  %33 = getelementptr inbounds %struct.Value* %v, i64 0, i32 1, i32 0, i32 1
  store %struct.VContext* %14, %struct.VContext** %33, align 8, !tbaa !33
  store %struct.Continuation* %20, %struct.Continuation** %2, align 8, !tbaa !34
  br label %34

; <label>:34                                      ; preds = %retainVContext.exit, %10
  switch i32 %16, label %830 [
    i32 7, label %35
    i32 8, label %71
  ]

; <label>:35                                      ; preds = %34
  %36 = getelementptr inbounds %struct.VExp* %12, i64 0, i32 3, i32 0, i32 0
  %37 = load i32* %36, align 4, !tbaa !26
  %38 = icmp sgt i32 %37, 0
  br i1 %38, label %.lr.ph.i, label %lookUpRef.exit

.lr.ph.i:                                         ; preds = %35, %.lr.ph.i
  %i.02.i = phi i32 [ %41, %.lr.ph.i ], [ 0, %35 ]
  %.01.i = phi %struct.VContext* [ %40, %.lr.ph.i ], [ %14, %35 ]
  %39 = getelementptr inbounds %struct.VContext* %.01.i, i64 0, i32 1
  %40 = load %struct.VContext** %39, align 8, !tbaa !11
  %41 = add nsw i32 %i.02.i, 1
  %exitcond.i = icmp eq i32 %41, %37
  br i1 %exitcond.i, label %lookUpRef.exit, label %.lr.ph.i

lookUpRef.exit:                                   ; preds = %.lr.ph.i, %35
  %.0.lcssa.i = phi %struct.VContext* [ %14, %35 ], [ %40, %.lr.ph.i ]
  %42 = getelementptr inbounds %struct.VContext* %.0.lcssa.i, i64 0, i32 0
  %43 = load %struct.Value** %42, align 8, !tbaa !14
  %44 = getelementptr inbounds %struct.Value* %43, i64 0, i32 0
  %45 = load i32* %44, align 4, !tbaa !30
  switch i32 %45, label %831 [
    i32 0, label %46
    i32 1, label %65
  ]

; <label>:46                                      ; preds = %lookUpRef.exit
  %47 = getelementptr inbounds %struct.Value* %43, i64 0, i32 1, i32 0, i32 0
  %48 = load %struct.VExp** %47, align 8, !tbaa !18
  %49 = icmp eq %struct.VExp* %48, null
  br i1 %49, label %retainVExp.exit48, label %50

; <label>:50                                      ; preds = %46
  %51 = getelementptr inbounds %struct.VExp* %48, i64 0, i32 4
  %52 = load i32* %51, align 4, !tbaa !17
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %51, align 4, !tbaa !17
  br label %retainVExp.exit48

retainVExp.exit48:                                ; preds = %46, %50
  %54 = getelementptr inbounds %union.anon.0* %1, i64 0, i32 0, i32 0
  store %struct.VExp* %48, %struct.VExp** %54, align 8, !tbaa !31
  %55 = getelementptr inbounds %struct.Value* %43, i64 0, i32 1, i32 0, i32 1
  %56 = load %struct.VContext** %55, align 8, !tbaa !20
  %57 = icmp eq %struct.VContext* %56, null
  br i1 %57, label %retainVContext.exit55, label %58

; <label>:58                                      ; preds = %retainVExp.exit48
  %59 = getelementptr inbounds %struct.VContext* %56, i64 0, i32 2
  %60 = load i32* %59, align 4, !tbaa !13
  %61 = add nsw i32 %60, 1
  store i32 %61, i32* %59, align 4, !tbaa !13
  br label %retainVContext.exit55

retainVContext.exit55:                            ; preds = %retainVExp.exit48, %58
  %62 = getelementptr inbounds %struct.Value* %v, i64 0, i32 1, i32 0, i32 1
  store %struct.VContext* %56, %struct.VContext** %62, align 8, !tbaa !33
  %63 = getelementptr inbounds %struct.Continuation* %3, i64 0, i32 2
  %64 = load %struct.Continuation** %63, align 8, !tbaa !44
  store %struct.Continuation* %64, %struct.Continuation** %2, align 8, !tbaa !34
  br label %830

; <label>:65                                      ; preds = %lookUpRef.exit
  %66 = getelementptr inbounds %struct.Value* %v, i64 0, i32 0
  store i32 1, i32* %66, align 4, !tbaa !30
  %67 = getelementptr inbounds %struct.Value* %43, i64 0, i32 1
  %68 = bitcast %union.anon.0* %67 to i8**
  %69 = load i8** %68, align 8, !tbaa !1
  %70 = getelementptr inbounds %union.anon.0* %1, i64 0, i32 0, i32 0
  %.c39 = bitcast i8* %69 to %struct.VExp*
  store %struct.VExp* %.c39, %struct.VExp** %70, align 8, !tbaa !1
  br label %830

; <label>:71                                      ; preds = %34
  %72 = getelementptr inbounds %struct.VExp* %12, i64 0, i32 3
  %73 = bitcast %union.anon.1* %72 to %struct.VExp**
  %74 = load %struct.VExp** %73, align 8, !tbaa !18
  %75 = getelementptr inbounds %struct.VExp* %12, i64 0, i32 3, i32 0, i32 2
  %76 = bitcast %union.SyscallArg* %75 to %struct.VExp**
  %77 = load %struct.VExp** %76, align 8, !tbaa !20
  %78 = load %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %79 = icmp eq %struct.Value* %78, null
  br i1 %79, label %80, label %newValue.exit

; <label>:80                                      ; preds = %71
  %81 = tail call noalias i8* @malloc(i64 40000) #7
  %82 = bitcast i8* %81 to %struct.Value*
  br label %83

; <label>:83                                      ; preds = %83, %80
  %indvars.iv.i.i62 = phi i64 [ 0, %80 ], [ %indvars.iv.next.i.i63, %83 ]
  %84 = phi %struct.Value* [ null, %80 ], [ %85, %83 ]
  %85 = getelementptr inbounds %struct.Value* %82, i64 %indvars.iv.i.i62
  %86 = getelementptr inbounds %struct.Value* %82, i64 %indvars.iv.i.i62, i32 1, i32 0, i32 0
  %.c.i.i = bitcast %struct.Value* %84 to %struct.VExp*
  store %struct.VExp* %.c.i.i, %struct.VExp** %86, align 8, !tbaa !1
  %indvars.iv.next.i.i63 = add nuw nsw i64 %indvars.iv.i.i62, 1
  %exitcond.i.i64 = icmp eq i64 %indvars.iv.next.i.i63, 1000
  br i1 %exitcond.i.i64, label %.loopexit.i.i66, label %83

.loopexit.i.i66:                                  ; preds = %83
  %scevgep.i.i65 = getelementptr i8* %81, i64 39960
  %scevgep4.i.i = bitcast i8* %scevgep.i.i65 to %struct.Value*
  store %struct.Value* %scevgep4.i.i, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  br label %newValue.exit

newValue.exit:                                    ; preds = %71, %.loopexit.i.i66
  %87 = phi %struct.Value* [ %scevgep4.i.i, %.loopexit.i.i66 ], [ %78, %71 ]
  %88 = getelementptr inbounds %struct.Value* %87, i64 0, i32 2
  store i32 1, i32* %88, align 4, !tbaa !28
  %89 = getelementptr inbounds %struct.Value* %87, i64 0, i32 1
  %90 = bitcast %union.anon.0* %89 to %struct.Value**
  %91 = load %struct.Value** %90, align 8, !tbaa !1
  store %struct.Value* %91, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %92 = getelementptr inbounds %struct.Value* %87, i64 0, i32 0
  store i32 2, i32* %92, align 4, !tbaa !30
  %93 = getelementptr inbounds %struct.Value* %87, i64 0, i32 1, i32 0, i32 0
  %94 = bitcast %struct.VExp** %93 to i8*
  call void @llvm.memset.p0i8.i64(i8* %94, i8 0, i64 16, i32 8, i1 false)
  %95 = tail call noalias i8* @malloc(i64 32) #7
  %96 = bitcast i8* %95 to %struct.Continuation*
  %97 = getelementptr inbounds %struct.Value* %87, i64 0, i32 1, i32 0, i32 2
  store %struct.Continuation* %96, %struct.Continuation** %97, align 8, !tbaa !34
  %98 = bitcast i8* %95 to i32*
  store i32 0, i32* %98, align 4, !tbaa !42
  %99 = getelementptr inbounds i8* %95, i64 8
  %100 = bitcast i8* %99 to %struct.VExp**
  store %struct.VExp* %77, %struct.VExp** %100, align 8, !tbaa !18
  %101 = getelementptr inbounds i8* %95, i64 16
  %102 = bitcast i8* %101 to %struct.VContext**
  store %struct.VContext* %14, %struct.VContext** %102, align 8, !tbaa !20
  %103 = getelementptr inbounds i8* %95, i64 24
  %104 = bitcast i8* %103 to %struct.Continuation**
  store %struct.Continuation* null, %struct.Continuation** %104, align 8, !tbaa !44
  %105 = tail call noalias i8* @malloc(i64 32) #7
  %106 = bitcast i8* %105 to %struct.Continuation*
  %107 = bitcast i8* %105 to i32*
  store i32 1, i32* %107, align 4, !tbaa !42
  %108 = getelementptr inbounds %struct.Continuation* %3, i64 0, i32 2
  %109 = load %struct.Continuation** %108, align 8, !tbaa !44
  %110 = getelementptr inbounds i8* %105, i64 24
  %111 = bitcast i8* %110 to %struct.Continuation**
  store %struct.Continuation* %109, %struct.Continuation** %111, align 8, !tbaa !44
  %112 = getelementptr inbounds i8* %105, i64 8
  %113 = bitcast i8* %112 to %struct.VExp**
  %.c38 = bitcast %struct.Value* %87 to %struct.VExp*
  store %struct.VExp* %.c38, %struct.VExp** %113, align 8, !tbaa !21
  %114 = tail call noalias i8* @malloc(i64 32) #7
  %115 = bitcast i8* %114 to %struct.Continuation*
  %116 = bitcast i8* %114 to i32*
  store i32 0, i32* %116, align 4, !tbaa !42
  %117 = getelementptr inbounds i8* %114, i64 8
  %118 = bitcast i8* %117 to %struct.VExp**
  store %struct.VExp* %74, %struct.VExp** %118, align 8, !tbaa !18
  %119 = getelementptr inbounds i8* %114, i64 16
  %120 = bitcast i8* %119 to %struct.VContext**
  store %struct.VContext* %14, %struct.VContext** %120, align 8, !tbaa !20
  %121 = getelementptr inbounds i8* %114, i64 24
  %122 = bitcast i8* %121 to %struct.Continuation**
  store %struct.Continuation* %106, %struct.Continuation** %122, align 8, !tbaa !44
  %123 = bitcast %union.anon.0* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %123, i8 0, i64 16, i32 8, i1 false)
  store %struct.Continuation* %115, %struct.Continuation** %2, align 8, !tbaa !34
  br label %830

; <label>:124                                     ; preds = %7
  %125 = getelementptr inbounds %union.anon.0* %1, i64 0, i32 0, i32 0
  %126 = load %struct.VExp** %125, align 8, !tbaa !31
  %127 = getelementptr inbounds %struct.Value* %v, i64 0, i32 1, i32 0, i32 1
  %128 = load %struct.VContext** %127, align 8, !tbaa !33
  %129 = getelementptr inbounds %struct.Continuation* %3, i64 0, i32 1
  %130 = bitcast %union.anon.8* %129 to %struct.Value**
  %131 = load %struct.Value** %130, align 8, !tbaa !21
  %132 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 0
  %133 = load i32* %132, align 4, !tbaa !15
  switch i32 %133, label %830 [
    i32 0, label %134
    i32 1, label %136
    i32 2, label %164
    i32 3, label %281
    i32 4, label %748
    i32 5, label %816
  ]

; <label>:134                                     ; preds = %124
  %135 = getelementptr inbounds %struct.Value* %v, i64 0, i32 0
  store i32 1, i32* %135, align 4, !tbaa !30
  store %struct.VExp* bitcast ([37 x i8]* @.str8 to %struct.VExp*), %struct.VExp** %125, align 8, !tbaa !1
  br label %830

; <label>:136                                     ; preds = %124
  %137 = load %struct.VContext** @allocateVContext.pool, align 8, !tbaa !1
  %138 = icmp eq %struct.VContext* %137, null
  br i1 %138, label %139, label %newVContext.exit.i

; <label>:139                                     ; preds = %136
  %140 = tail call noalias i8* @malloc(i64 24000) #7
  %141 = bitcast i8* %140 to %struct.VContext*
  br label %142

; <label>:142                                     ; preds = %142, %139
  %indvars.iv.i.i.i = phi i64 [ 0, %139 ], [ %indvars.iv.next.i.i.i, %142 ]
  %143 = phi %struct.VContext* [ null, %139 ], [ %144, %142 ]
  %144 = getelementptr inbounds %struct.VContext* %141, i64 %indvars.iv.i.i.i
  %145 = getelementptr inbounds %struct.VContext* %141, i64 %indvars.iv.i.i.i, i32 1
  store %struct.VContext* %143, %struct.VContext** %145, align 8, !tbaa !11
  %indvars.iv.next.i.i.i = add nuw nsw i64 %indvars.iv.i.i.i, 1
  %exitcond.i.i.i = icmp eq i64 %indvars.iv.next.i.i.i, 1000
  br i1 %exitcond.i.i.i, label %.loopexit.i.i.i, label %142

.loopexit.i.i.i:                                  ; preds = %142
  %scevgep.i.i.i = getelementptr i8* %140, i64 23976
  %scevgep3.i.i.i = bitcast i8* %scevgep.i.i.i to %struct.VContext*
  store %struct.VContext* %scevgep3.i.i.i, %struct.VContext** @allocateVContext.pool, align 8, !tbaa !1
  br label %newVContext.exit.i

newVContext.exit.i:                               ; preds = %.loopexit.i.i.i, %136
  %146 = phi %struct.VContext* [ %scevgep3.i.i.i, %.loopexit.i.i.i ], [ %137, %136 ]
  %147 = getelementptr inbounds %struct.VContext* %146, i64 0, i32 2
  store i32 1, i32* %147, align 4, !tbaa !13
  %148 = getelementptr inbounds %struct.VContext* %146, i64 0, i32 1
  %149 = load %struct.VContext** %148, align 8, !tbaa !11
  store %struct.VContext* %149, %struct.VContext** @allocateVContext.pool, align 8, !tbaa !1
  %150 = getelementptr inbounds %struct.VContext* %146, i64 0, i32 0
  store %struct.Value* %131, %struct.Value** %150, align 8, !tbaa !14
  store %struct.VContext* %128, %struct.VContext** %148, align 8, !tbaa !11
  %151 = icmp eq %struct.VContext* %128, null
  br i1 %151, label %insertRef.exit, label %retainVContext.exit.i

retainVContext.exit.i:                            ; preds = %newVContext.exit.i, %retainVContext.exit.i
  %p.01.i = phi %struct.VContext* [ %156, %retainVContext.exit.i ], [ %128, %newVContext.exit.i ]
  %152 = getelementptr inbounds %struct.VContext* %p.01.i, i64 0, i32 2
  %153 = load i32* %152, align 4, !tbaa !13
  %154 = add nsw i32 %153, 1
  store i32 %154, i32* %152, align 4, !tbaa !13
  %155 = getelementptr inbounds %struct.VContext* %p.01.i, i64 0, i32 1
  %156 = load %struct.VContext** %155, align 8, !tbaa !11
  %157 = icmp eq %struct.VContext* %156, null
  br i1 %157, label %insertRef.exit, label %retainVContext.exit.i

insertRef.exit:                                   ; preds = %retainVContext.exit.i, %newVContext.exit.i
  store i32 0, i32* %8, align 4, !tbaa !42
  %158 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 3
  %159 = bitcast %union.anon.1* %158 to %struct.VExp**
  %160 = load %struct.VExp** %159, align 8, !tbaa !1
  %161 = getelementptr inbounds %union.anon.8* %129, i64 0, i32 0, i32 0
  store %struct.VExp* %160, %struct.VExp** %161, align 8, !tbaa !18
  %162 = getelementptr inbounds %struct.Continuation* %3, i64 0, i32 1, i32 0, i32 1
  store %struct.VContext* %146, %struct.VContext** %162, align 8, !tbaa !20
  %163 = bitcast %union.anon.0* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %163, i8 0, i64 16, i32 8, i1 false)
  br label %830

; <label>:164                                     ; preds = %124
  %165 = getelementptr inbounds %struct.Value* %131, i64 0, i32 0
  %166 = load i32* %165, align 4, !tbaa !30
  %switch = icmp ult i32 %166, 2
  br i1 %switch, label %167, label %831

; <label>:167                                     ; preds = %164
  %168 = icmp eq i32 %166, 1
  %169 = getelementptr inbounds %struct.Value* %131, i64 0, i32 1
  br i1 %168, label %170, label %174

; <label>:170                                     ; preds = %167
  %171 = bitcast %union.anon.0* %169 to i8**
  %172 = load i8** %171, align 8, !tbaa !1
  %173 = getelementptr inbounds %struct.Value* %v, i64 0, i32 0
  store i32 1, i32* %173, align 4, !tbaa !30
  %.c37 = bitcast i8* %172 to %struct.VExp*
  store %struct.VExp* %.c37, %struct.VExp** %125, align 8, !tbaa !1
  br label %830

; <label>:174                                     ; preds = %167
  %175 = getelementptr inbounds %union.anon.0* %169, i64 0, i32 0, i32 0
  %176 = load %struct.VExp** %175, align 8, !tbaa !18
  %177 = getelementptr inbounds %struct.VExp* %176, i64 0, i32 0
  %178 = load i32* %177, align 4, !tbaa !15
  %179 = icmp eq i32 %178, 0
  br i1 %179, label %182, label %180

; <label>:180                                     ; preds = %174
  %181 = getelementptr inbounds %struct.Value* %v, i64 0, i32 0
  store i32 1, i32* %181, align 4, !tbaa !30
  store %struct.VExp* bitcast ([52 x i8]* @.str9 to %struct.VExp*), %struct.VExp** %125, align 8, !tbaa !1
  br label %830

; <label>:182                                     ; preds = %174
  %183 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 3, i32 0, i32 0
  %184 = load i32* %183, align 4, !tbaa !35
  %185 = icmp ult i32 %184, 11
  br i1 %185, label %186, label %212

; <label>:186                                     ; preds = %182
  %187 = getelementptr inbounds %struct.VExp* %176, i64 0, i32 3, i32 0, i32 0
  %188 = load i32* %187, align 1
  %189 = getelementptr %struct.VExp* %176, i64 0, i32 3, i32 0, i32 2
  %190 = bitcast %union.SyscallArg* %189 to i64*
  %191 = load i64* %190, align 1
  %192 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %193 = icmp eq %struct.VExp* %192, null
  br i1 %193, label %194, label %newVExpNumfunc1.exit

; <label>:194                                     ; preds = %186
  %195 = tail call noalias i8* @malloc(i64 56000) #7
  %196 = bitcast i8* %195 to %struct.VExp*
  br label %197

; <label>:197                                     ; preds = %197, %194
  %indvars.iv.i.i67 = phi i64 [ 0, %194 ], [ %indvars.iv.next.i.i68, %197 ]
  %198 = phi %struct.VExp* [ null, %194 ], [ %199, %197 ]
  %199 = getelementptr inbounds %struct.VExp* %196, i64 %indvars.iv.i.i67
  %200 = getelementptr inbounds %struct.VExp* %196, i64 %indvars.iv.i.i67, i32 3
  %201 = bitcast %union.anon.1* %200 to %struct.VExp**
  store %struct.VExp* %198, %struct.VExp** %201, align 8, !tbaa !1
  %indvars.iv.next.i.i68 = add nuw nsw i64 %indvars.iv.i.i67, 1
  %exitcond.i.i69 = icmp eq i64 %indvars.iv.next.i.i68, 1000
  br i1 %exitcond.i.i69, label %.loopexit.i.i72, label %197

.loopexit.i.i72:                                  ; preds = %197
  %scevgep.i.i70 = getelementptr i8* %195, i64 55944
  %scevgep3.i.i71 = bitcast i8* %scevgep.i.i70 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i71, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNumfunc1.exit

newVExpNumfunc1.exit:                             ; preds = %186, %.loopexit.i.i72
  %202 = phi %struct.VExp* [ %scevgep3.i.i71, %.loopexit.i.i72 ], [ %192, %186 ]
  %203 = getelementptr inbounds %struct.VExp* %202, i64 0, i32 4
  store i32 1, i32* %203, align 4, !tbaa !17
  %204 = getelementptr inbounds %struct.VExp* %202, i64 0, i32 3
  %205 = bitcast %union.anon.1* %204 to %struct.VExp**
  %206 = load %struct.VExp** %205, align 8, !tbaa !1
  store %struct.VExp* %206, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %207 = getelementptr inbounds %struct.VExp* %202, i64 0, i32 0
  store i32 3, i32* %207, align 4, !tbaa !15
  %208 = getelementptr inbounds %struct.VExp* %202, i64 0, i32 3, i32 0, i32 0
  store i32 %184, i32* %208, align 4, !tbaa !37
  %209 = getelementptr inbounds %struct.VExp* %202, i64 0, i32 3, i32 0, i32 2
  %210 = bitcast %union.SyscallArg* %209 to i32*
  store i32 %188, i32* %210, align 8
  %211 = getelementptr inbounds %union.SyscallArg* %209, i64 1, i32 0
  %func1_opa.coerce1.c.i = inttoptr i64 %191 to %struct.IntList*
  store %struct.IntList* %func1_opa.coerce1.c.i, %struct.IntList** %211, align 8
  br label %retainVExp.exit73

; <label>:212                                     ; preds = %182
  switch i32 %184, label %retainVExp.exit73 [
    i32 13, label %213
    i32 12, label %248
  ]

; <label>:213                                     ; preds = %212
  %214 = getelementptr inbounds %struct.VExp* %176, i64 0, i32 3, i32 0, i32 0
  %215 = load i32* %214, align 4, !tbaa !40
  %216 = icmp eq i32 %215, 0
  br i1 %216, label %217, label %223

; <label>:217                                     ; preds = %213
  %218 = icmp eq %struct.VExp* %176, null
  br i1 %218, label %retainVExp.exit73, label %219

; <label>:219                                     ; preds = %217
  %220 = getelementptr inbounds %struct.VExp* %176, i64 0, i32 4
  %221 = load i32* %220, align 4, !tbaa !17
  %222 = add nsw i32 %221, 1
  store i32 %222, i32* %220, align 4, !tbaa !17
  br label %retainVExp.exit73

; <label>:223                                     ; preds = %213
  %224 = getelementptr inbounds %struct.VExp* %176, i64 0, i32 3, i32 0, i32 2
  %225 = bitcast %union.SyscallArg* %224 to double*
  %226 = load double* %225, align 8, !tbaa !45
  %227 = tail call double @floor(double %226) #8
  %228 = fptosi double %227 to i32
  %229 = zext i32 %228 to i64
  %230 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %231 = icmp eq %struct.VExp* %230, null
  br i1 %231, label %232, label %newVExpNum.exit94

; <label>:232                                     ; preds = %223
  %233 = tail call noalias i8* @malloc(i64 56000) #7
  %234 = bitcast i8* %233 to %struct.VExp*
  br label %235

; <label>:235                                     ; preds = %235, %232
  %indvars.iv.i.i87 = phi i64 [ 0, %232 ], [ %indvars.iv.next.i.i88, %235 ]
  %236 = phi %struct.VExp* [ null, %232 ], [ %237, %235 ]
  %237 = getelementptr inbounds %struct.VExp* %234, i64 %indvars.iv.i.i87
  %238 = getelementptr inbounds %struct.VExp* %234, i64 %indvars.iv.i.i87, i32 3
  %239 = bitcast %union.anon.1* %238 to %struct.VExp**
  store %struct.VExp* %236, %struct.VExp** %239, align 8, !tbaa !1
  %indvars.iv.next.i.i88 = add nuw nsw i64 %indvars.iv.i.i87, 1
  %exitcond.i.i89 = icmp eq i64 %indvars.iv.next.i.i88, 1000
  br i1 %exitcond.i.i89, label %.loopexit.i.i92, label %235

.loopexit.i.i92:                                  ; preds = %235
  %scevgep.i.i90 = getelementptr i8* %233, i64 55944
  %scevgep3.i.i91 = bitcast i8* %scevgep.i.i90 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i91, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNum.exit94

newVExpNum.exit94:                                ; preds = %223, %.loopexit.i.i92
  %240 = phi %struct.VExp* [ %scevgep3.i.i91, %.loopexit.i.i92 ], [ %230, %223 ]
  %241 = getelementptr inbounds %struct.VExp* %240, i64 0, i32 4
  store i32 1, i32* %241, align 4, !tbaa !17
  %242 = getelementptr inbounds %struct.VExp* %240, i64 0, i32 3
  %243 = bitcast %union.anon.1* %242 to %struct.VExp**
  %244 = load %struct.VExp** %243, align 8, !tbaa !1
  store %struct.VExp* %244, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %245 = getelementptr inbounds %struct.VExp* %240, i64 0, i32 0
  store i32 0, i32* %245, align 4, !tbaa !15
  %246 = getelementptr inbounds %struct.VExp* %240, i64 0, i32 3, i32 0, i32 0
  store i32 0, i32* %246, align 8
  %247 = getelementptr inbounds %struct.VExp* %240, i64 0, i32 3, i32 0, i32 2, i32 0
  %num_val.coerce1.c.i93 = inttoptr i64 %229 to %struct.IntList*
  store %struct.IntList* %num_val.coerce1.c.i93, %struct.IntList** %247, align 8
  br label %retainVExp.exit73

; <label>:248                                     ; preds = %212
  %249 = getelementptr inbounds %struct.VExp* %176, i64 0, i32 3, i32 0, i32 0
  %250 = load i32* %249, align 4, !tbaa !40
  %251 = icmp eq i32 %250, 1
  br i1 %251, label %retainVExp.exit95, label %255

retainVExp.exit95:                                ; preds = %248
  %252 = getelementptr inbounds %struct.VExp* %176, i64 0, i32 4
  %253 = load i32* %252, align 4, !tbaa !17
  %254 = add nsw i32 %253, 1
  store i32 %254, i32* %252, align 4, !tbaa !17
  br label %retainVExp.exit73

; <label>:255                                     ; preds = %248
  %256 = getelementptr inbounds %struct.VExp* %176, i64 0, i32 3, i32 0, i32 2
  %257 = bitcast %union.SyscallArg* %256 to i32*
  %258 = load i32* %257, align 4, !tbaa !26
  %259 = sitofp i32 %258 to double
  %260 = bitcast double %259 to i64
  %261 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %262 = icmp eq %struct.VExp* %261, null
  br i1 %262, label %263, label %newVExpNum.exit115

; <label>:263                                     ; preds = %255
  %264 = tail call noalias i8* @malloc(i64 56000) #7
  %265 = bitcast i8* %264 to %struct.VExp*
  br label %266

; <label>:266                                     ; preds = %266, %263
  %indvars.iv.i.i108 = phi i64 [ 0, %263 ], [ %indvars.iv.next.i.i109, %266 ]
  %267 = phi %struct.VExp* [ null, %263 ], [ %268, %266 ]
  %268 = getelementptr inbounds %struct.VExp* %265, i64 %indvars.iv.i.i108
  %269 = getelementptr inbounds %struct.VExp* %265, i64 %indvars.iv.i.i108, i32 3
  %270 = bitcast %union.anon.1* %269 to %struct.VExp**
  store %struct.VExp* %267, %struct.VExp** %270, align 8, !tbaa !1
  %indvars.iv.next.i.i109 = add nuw nsw i64 %indvars.iv.i.i108, 1
  %exitcond.i.i110 = icmp eq i64 %indvars.iv.next.i.i109, 1000
  br i1 %exitcond.i.i110, label %.loopexit.i.i113, label %266

.loopexit.i.i113:                                 ; preds = %266
  %scevgep.i.i111 = getelementptr i8* %264, i64 55944
  %scevgep3.i.i112 = bitcast i8* %scevgep.i.i111 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i112, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNum.exit115

newVExpNum.exit115:                               ; preds = %255, %.loopexit.i.i113
  %271 = phi %struct.VExp* [ %scevgep3.i.i112, %.loopexit.i.i113 ], [ %261, %255 ]
  %272 = getelementptr inbounds %struct.VExp* %271, i64 0, i32 4
  store i32 1, i32* %272, align 4, !tbaa !17
  %273 = getelementptr inbounds %struct.VExp* %271, i64 0, i32 3
  %274 = bitcast %union.anon.1* %273 to %struct.VExp**
  %275 = load %struct.VExp** %274, align 8, !tbaa !1
  store %struct.VExp* %275, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %276 = getelementptr inbounds %struct.VExp* %271, i64 0, i32 0
  store i32 0, i32* %276, align 4, !tbaa !15
  %277 = getelementptr inbounds %struct.VExp* %271, i64 0, i32 3, i32 0, i32 0
  store i32 1, i32* %277, align 8
  %278 = getelementptr inbounds %struct.VExp* %271, i64 0, i32 3, i32 0, i32 2, i32 0
  %num_val.coerce1.c.i114 = inttoptr i64 %260 to %struct.IntList*
  store %struct.IntList* %num_val.coerce1.c.i114, %struct.IntList** %278, align 8
  br label %retainVExp.exit73

retainVExp.exit73:                                ; preds = %219, %217, %212, %newVExpNum.exit94, %retainVExp.exit95, %newVExpNum.exit115, %newVExpNumfunc1.exit
  %nexp.0 = phi %struct.VExp* [ %202, %newVExpNumfunc1.exit ], [ %240, %newVExpNum.exit94 ], [ %176, %retainVExp.exit95 ], [ %271, %newVExpNum.exit115 ], [ null, %212 ], [ null, %217 ], [ %176, %219 ]
  %279 = getelementptr inbounds %struct.Continuation* %3, i64 0, i32 2
  %280 = load %struct.Continuation** %279, align 8, !tbaa !44
  store %struct.VExp* %nexp.0, %struct.VExp** %125, align 8, !tbaa !31
  store %struct.VContext* null, %struct.VContext** %127, align 8, !tbaa !33
  store %struct.Continuation* %280, %struct.Continuation** %2, align 8, !tbaa !34
  br label %830

; <label>:281                                     ; preds = %124
  %282 = getelementptr inbounds %struct.Value* %131, i64 0, i32 0
  %283 = load i32* %282, align 4, !tbaa !30
  %switch40 = icmp ult i32 %283, 2
  br i1 %switch40, label %284, label %831

; <label>:284                                     ; preds = %281
  %285 = icmp eq i32 %283, 1
  %286 = getelementptr inbounds %struct.Value* %131, i64 0, i32 1
  br i1 %285, label %287, label %291

; <label>:287                                     ; preds = %284
  %288 = bitcast %union.anon.0* %286 to i8**
  %289 = load i8** %288, align 8, !tbaa !1
  %290 = getelementptr inbounds %struct.Value* %v, i64 0, i32 0
  store i32 1, i32* %290, align 4, !tbaa !30
  %.c36 = bitcast i8* %289 to %struct.VExp*
  store %struct.VExp* %.c36, %struct.VExp** %125, align 8, !tbaa !1
  br label %830

; <label>:291                                     ; preds = %284
  %292 = getelementptr inbounds %union.anon.0* %286, i64 0, i32 0, i32 0
  %293 = load %struct.VExp** %292, align 8, !tbaa !18
  %294 = getelementptr inbounds %struct.VExp* %293, i64 0, i32 0
  %295 = load i32* %294, align 4, !tbaa !15
  %296 = icmp eq i32 %295, 0
  br i1 %296, label %299, label %297

; <label>:297                                     ; preds = %291
  %298 = getelementptr inbounds %struct.Value* %v, i64 0, i32 0
  store i32 1, i32* %298, align 4, !tbaa !30
  store %struct.VExp* bitcast ([52 x i8]* @.str9 to %struct.VExp*), %struct.VExp** %125, align 8, !tbaa !1
  br label %830

; <label>:299                                     ; preds = %291
  %300 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 3, i32 0, i32 0
  %301 = load i32* %300, align 4, !tbaa !37
  switch i32 %301, label %678 [
    i32 0, label %302
    i32 1, label %338
    i32 2, label %374
    i32 3, label %410
    i32 4, label %454
    i32 6, label %474
    i32 5, label %507
    i32 8, label %540
    i32 7, label %573
    i32 9, label %606
    i32 10, label %639
  ]

; <label>:302                                     ; preds = %299
  %303 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 3, i32 0, i32 2
  %304 = bitcast %union.SyscallArg* %303 to i32*
  %305 = load i32* %304, align 1
  %306 = getelementptr %union.SyscallArg* %303, i64 1
  %307 = bitcast %union.SyscallArg* %306 to i64*
  %308 = load i64* %307, align 1
  %309 = getelementptr inbounds %struct.VExp* %293, i64 0, i32 3, i32 0, i32 0
  %310 = load i32* %309, align 1
  %311 = getelementptr %struct.VExp* %293, i64 0, i32 3, i32 0, i32 2
  %312 = bitcast %union.SyscallArg* %311 to i64*
  %313 = load i64* %312, align 1
  %314 = icmp eq i32 %305, 0
  %315 = icmp eq i32 %310, 0
  br i1 %314, label %316, label %326

; <label>:316                                     ; preds = %302
  br i1 %315, label %317, label %320

; <label>:317                                     ; preds = %316
  %318 = add i64 %313, %308
  %319 = and i64 %318, 4294967295
  br label %.thread120

; <label>:320                                     ; preds = %316
  %321 = trunc i64 %308 to i32
  %322 = sitofp i32 %321 to double
  %323 = bitcast i64 %313 to double
  %324 = fadd double %322, %323
  %325 = bitcast double %324 to i64
  br label %.thread120

; <label>:326                                     ; preds = %302
  %327 = bitcast i64 %308 to double
  br i1 %315, label %328, label %334

; <label>:328                                     ; preds = %326
  %329 = trunc i64 %313 to i32
  %330 = sitofp i32 %329 to double
  %331 = fadd double %327, %330
  %332 = fptosi double %331 to i32
  %333 = zext i32 %332 to i64
  br label %.thread120

; <label>:334                                     ; preds = %326
  %335 = bitcast i64 %313 to double
  %336 = fadd double %327, %335
  %337 = bitcast double %336 to i64
  br label %.thread120

; <label>:338                                     ; preds = %299
  %339 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 3, i32 0, i32 2
  %340 = bitcast %union.SyscallArg* %339 to i32*
  %341 = load i32* %340, align 1
  %342 = getelementptr %union.SyscallArg* %339, i64 1
  %343 = bitcast %union.SyscallArg* %342 to i64*
  %344 = load i64* %343, align 1
  %345 = getelementptr inbounds %struct.VExp* %293, i64 0, i32 3, i32 0, i32 0
  %346 = load i32* %345, align 1
  %347 = getelementptr %struct.VExp* %293, i64 0, i32 3, i32 0, i32 2
  %348 = bitcast %union.SyscallArg* %347 to i64*
  %349 = load i64* %348, align 1
  %350 = icmp eq i32 %341, 0
  %351 = icmp eq i32 %346, 0
  br i1 %350, label %352, label %362

; <label>:352                                     ; preds = %338
  br i1 %351, label %353, label %356

; <label>:353                                     ; preds = %352
  %354 = sub i64 %344, %349
  %355 = and i64 %354, 4294967295
  br label %.thread120

; <label>:356                                     ; preds = %352
  %357 = trunc i64 %344 to i32
  %358 = sitofp i32 %357 to double
  %359 = bitcast i64 %349 to double
  %360 = fsub double %358, %359
  %361 = bitcast double %360 to i64
  br label %.thread120

; <label>:362                                     ; preds = %338
  %363 = bitcast i64 %344 to double
  br i1 %351, label %364, label %370

; <label>:364                                     ; preds = %362
  %365 = trunc i64 %349 to i32
  %366 = sitofp i32 %365 to double
  %367 = fsub double %363, %366
  %368 = fptosi double %367 to i32
  %369 = zext i32 %368 to i64
  br label %.thread120

; <label>:370                                     ; preds = %362
  %371 = bitcast i64 %349 to double
  %372 = fsub double %363, %371
  %373 = bitcast double %372 to i64
  br label %.thread120

; <label>:374                                     ; preds = %299
  %375 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 3, i32 0, i32 2
  %376 = bitcast %union.SyscallArg* %375 to i32*
  %377 = load i32* %376, align 1
  %378 = getelementptr %union.SyscallArg* %375, i64 1
  %379 = bitcast %union.SyscallArg* %378 to i64*
  %380 = load i64* %379, align 1
  %381 = getelementptr inbounds %struct.VExp* %293, i64 0, i32 3, i32 0, i32 0
  %382 = load i32* %381, align 1
  %383 = getelementptr %struct.VExp* %293, i64 0, i32 3, i32 0, i32 2
  %384 = bitcast %union.SyscallArg* %383 to i64*
  %385 = load i64* %384, align 1
  %386 = icmp eq i32 %377, 0
  %387 = icmp eq i32 %382, 0
  br i1 %386, label %388, label %398

; <label>:388                                     ; preds = %374
  br i1 %387, label %389, label %392

; <label>:389                                     ; preds = %388
  %390 = mul i64 %385, %380
  %391 = and i64 %390, 4294967295
  br label %.thread120

; <label>:392                                     ; preds = %388
  %393 = trunc i64 %380 to i32
  %394 = sitofp i32 %393 to double
  %395 = bitcast i64 %385 to double
  %396 = fmul double %394, %395
  %397 = bitcast double %396 to i64
  br label %.thread120

; <label>:398                                     ; preds = %374
  %399 = bitcast i64 %380 to double
  br i1 %387, label %400, label %406

; <label>:400                                     ; preds = %398
  %401 = trunc i64 %385 to i32
  %402 = sitofp i32 %401 to double
  %403 = fmul double %399, %402
  %404 = fptosi double %403 to i32
  %405 = zext i32 %404 to i64
  br label %.thread120

; <label>:406                                     ; preds = %398
  %407 = bitcast i64 %385 to double
  %408 = fmul double %399, %407
  %409 = bitcast double %408 to i64
  br label %.thread120

; <label>:410                                     ; preds = %299
  %411 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 3, i32 0, i32 2
  %412 = bitcast %union.SyscallArg* %411 to i32*
  %413 = load i32* %412, align 1
  %414 = getelementptr %union.SyscallArg* %411, i64 1
  %415 = bitcast %union.SyscallArg* %414 to i64*
  %416 = load i64* %415, align 1
  %417 = getelementptr inbounds %struct.VExp* %293, i64 0, i32 3, i32 0, i32 0
  %418 = load i32* %417, align 1
  %419 = getelementptr %struct.VExp* %293, i64 0, i32 3, i32 0, i32 2
  %420 = bitcast %union.SyscallArg* %419 to i64*
  %421 = load i64* %420, align 1
  %422 = icmp eq i32 %413, 0
  %423 = icmp eq i32 %418, 0
  br i1 %422, label %424, label %437

; <label>:424                                     ; preds = %410
  br i1 %423, label %425, label %431

; <label>:425                                     ; preds = %424
  %426 = trunc i64 %421 to i32
  %427 = icmp eq i32 %426, 0
  br i1 %427, label %divNumber.exit, label %428

; <label>:428                                     ; preds = %425
  %429 = trunc i64 %416 to i32
  %430 = sdiv i32 %429, %426
  %phitmp8.i = zext i32 %430 to i64
  br label %divNumber.exit

; <label>:431                                     ; preds = %424
  %432 = trunc i64 %416 to i32
  %433 = sitofp i32 %432 to double
  %434 = bitcast i64 %421 to double
  %435 = fdiv double %433, %434
  %436 = bitcast double %435 to i64
  br label %divNumber.exit

; <label>:437                                     ; preds = %410
  br i1 %423, label %438, label %446

; <label>:438                                     ; preds = %437
  %439 = trunc i64 %421 to i32
  %440 = icmp eq i32 %439, 0
  br i1 %440, label %divNumber.exit, label %441

; <label>:441                                     ; preds = %438
  %442 = bitcast i64 %416 to double
  %443 = sitofp i32 %439 to double
  %444 = fdiv double %442, %443
  %445 = fptosi double %444 to i32
  %phitmp.i101 = zext i32 %445 to i64
  br label %divNumber.exit

; <label>:446                                     ; preds = %437
  %447 = bitcast i64 %416 to double
  %448 = bitcast i64 %421 to double
  %449 = fdiv double %447, %448
  %450 = bitcast double %449 to i64
  br label %divNumber.exit

divNumber.exit:                                   ; preds = %438, %425, %428, %431, %441, %446
  %451 = phi i8* [ null, %431 ], [ null, %446 ], [ null, %428 ], [ null, %441 ], [ getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), %425 ], [ getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), %438 ]
  %.sroa.0.0.i = phi i32 [ 1, %431 ], [ 1, %446 ], [ 0, %428 ], [ 1, %441 ], [ 0, %425 ], [ 1, %438 ]
  %.sroa.9.0.i = phi i64 [ %436, %431 ], [ %450, %446 ], [ %phitmp8.i, %428 ], [ %phitmp.i101, %441 ], [ 0, %425 ], [ 0, %438 ]
  %452 = insertvalue { i32, i64 } undef, i32 %.sroa.0.0.i, 0
  %453 = insertvalue { i32, i64 } %452, i64 %.sroa.9.0.i, 1
  br label %672

; <label>:454                                     ; preds = %299
  %455 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 3, i32 0, i32 2
  %456 = bitcast %union.SyscallArg* %455 to i32*
  %457 = load i32* %456, align 1
  %458 = getelementptr inbounds %struct.VExp* %293, i64 0, i32 3, i32 0, i32 0
  %459 = load i32* %458, align 1
  %460 = or i32 %459, %457
  %461 = icmp eq i32 %460, 0
  br i1 %461, label %462, label %modNumber.exit

; <label>:462                                     ; preds = %454
  %463 = getelementptr %struct.VExp* %293, i64 0, i32 3, i32 0, i32 2
  %464 = getelementptr %union.SyscallArg* %455, i64 1
  %465 = bitcast %union.SyscallArg* %463 to i64*
  %466 = bitcast %union.SyscallArg* %464 to i64*
  %467 = load i64* %465, align 1
  %468 = load i64* %466, align 1
  %469 = trunc i64 %468 to i32
  %470 = trunc i64 %467 to i32
  %471 = srem i32 %469, %470
  %phitmp.i = zext i32 %471 to i64
  br label %modNumber.exit

modNumber.exit:                                   ; preds = %454, %462
  %472 = phi i8* [ null, %462 ], [ getelementptr inbounds ([36 x i8]* @.str1, i64 0, i64 0), %454 ]
  %c.sroa.21.0.i = phi i64 [ %phitmp.i, %462 ], [ 0, %454 ]
  %473 = insertvalue { i32, i64 } { i32 0, i64 undef }, i64 %c.sroa.21.0.i, 1
  br label %672

; <label>:474                                     ; preds = %299
  %475 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 3, i32 0, i32 2
  %476 = bitcast %union.SyscallArg* %475 to i32*
  %477 = load i32* %476, align 1
  %478 = getelementptr %union.SyscallArg* %475, i64 1
  %479 = bitcast %union.SyscallArg* %478 to i64*
  %480 = load i64* %479, align 1
  %481 = getelementptr inbounds %struct.VExp* %293, i64 0, i32 3, i32 0, i32 0
  %482 = load i32* %481, align 1
  %483 = getelementptr %struct.VExp* %293, i64 0, i32 3, i32 0, i32 2
  %484 = bitcast %union.SyscallArg* %483 to i64*
  %485 = load i64* %484, align 1
  %486 = icmp eq i32 %477, 0
  %487 = icmp eq i32 %482, 0
  br i1 %486, label %488, label %497

; <label>:488                                     ; preds = %474
  %489 = trunc i64 %480 to i32
  br i1 %487, label %490, label %493

; <label>:490                                     ; preds = %488
  %491 = trunc i64 %485 to i32
  %492 = icmp slt i32 %489, %491
  br label %leNumber.exit

; <label>:493                                     ; preds = %488
  %494 = sitofp i32 %489 to double
  %495 = bitcast i64 %485 to double
  %496 = fcmp olt double %494, %495
  br label %leNumber.exit

; <label>:497                                     ; preds = %474
  %498 = bitcast i64 %480 to double
  br i1 %487, label %499, label %503

; <label>:499                                     ; preds = %497
  %500 = trunc i64 %485 to i32
  %501 = sitofp i32 %500 to double
  %502 = fcmp olt double %498, %501
  br label %leNumber.exit

; <label>:503                                     ; preds = %497
  %504 = bitcast i64 %485 to double
  %505 = fcmp olt double %498, %504
  br label %leNumber.exit

leNumber.exit:                                    ; preds = %490, %493, %499, %503
  %.0.i100 = phi i1 [ %492, %490 ], [ %496, %493 ], [ %502, %499 ], [ %505, %503 ]
  %506 = zext i1 %.0.i100 to i32
  br label %678

; <label>:507                                     ; preds = %299
  %508 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 3, i32 0, i32 2
  %509 = bitcast %union.SyscallArg* %508 to i32*
  %510 = load i32* %509, align 1
  %511 = getelementptr %union.SyscallArg* %508, i64 1
  %512 = bitcast %union.SyscallArg* %511 to i64*
  %513 = load i64* %512, align 1
  %514 = getelementptr inbounds %struct.VExp* %293, i64 0, i32 3, i32 0, i32 0
  %515 = load i32* %514, align 1
  %516 = getelementptr %struct.VExp* %293, i64 0, i32 3, i32 0, i32 2
  %517 = bitcast %union.SyscallArg* %516 to i64*
  %518 = load i64* %517, align 1
  %519 = icmp eq i32 %510, 0
  %520 = icmp eq i32 %515, 0
  br i1 %519, label %521, label %530

; <label>:521                                     ; preds = %507
  %522 = trunc i64 %513 to i32
  br i1 %520, label %523, label %526

; <label>:523                                     ; preds = %521
  %524 = trunc i64 %518 to i32
  %525 = icmp sgt i32 %522, %524
  br label %geNumber.exit

; <label>:526                                     ; preds = %521
  %527 = sitofp i32 %522 to double
  %528 = bitcast i64 %518 to double
  %529 = fcmp ogt double %527, %528
  br label %geNumber.exit

; <label>:530                                     ; preds = %507
  %531 = bitcast i64 %513 to double
  br i1 %520, label %532, label %536

; <label>:532                                     ; preds = %530
  %533 = trunc i64 %518 to i32
  %534 = sitofp i32 %533 to double
  %535 = fcmp ogt double %531, %534
  br label %geNumber.exit

; <label>:536                                     ; preds = %530
  %537 = bitcast i64 %518 to double
  %538 = fcmp ogt double %531, %537
  br label %geNumber.exit

geNumber.exit:                                    ; preds = %523, %526, %532, %536
  %.0.i99 = phi i1 [ %525, %523 ], [ %529, %526 ], [ %535, %532 ], [ %538, %536 ]
  %539 = zext i1 %.0.i99 to i32
  br label %678

; <label>:540                                     ; preds = %299
  %541 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 3, i32 0, i32 2
  %542 = bitcast %union.SyscallArg* %541 to i32*
  %543 = load i32* %542, align 1
  %544 = getelementptr %union.SyscallArg* %541, i64 1
  %545 = bitcast %union.SyscallArg* %544 to i64*
  %546 = load i64* %545, align 1
  %547 = getelementptr inbounds %struct.VExp* %293, i64 0, i32 3, i32 0, i32 0
  %548 = load i32* %547, align 1
  %549 = getelementptr %struct.VExp* %293, i64 0, i32 3, i32 0, i32 2
  %550 = bitcast %union.SyscallArg* %549 to i64*
  %551 = load i64* %550, align 1
  %552 = icmp eq i32 %543, 0
  %553 = icmp eq i32 %548, 0
  br i1 %552, label %554, label %563

; <label>:554                                     ; preds = %540
  %555 = trunc i64 %546 to i32
  br i1 %553, label %556, label %559

; <label>:556                                     ; preds = %554
  %557 = trunc i64 %551 to i32
  %558 = icmp sge i32 %555, %557
  br label %nleNumber.exit

; <label>:559                                     ; preds = %554
  %560 = sitofp i32 %555 to double
  %561 = bitcast i64 %551 to double
  %562 = fcmp oge double %560, %561
  br label %nleNumber.exit

; <label>:563                                     ; preds = %540
  %564 = bitcast i64 %546 to double
  br i1 %553, label %565, label %569

; <label>:565                                     ; preds = %563
  %566 = trunc i64 %551 to i32
  %567 = sitofp i32 %566 to double
  %568 = fcmp oge double %564, %567
  br label %nleNumber.exit

; <label>:569                                     ; preds = %563
  %570 = bitcast i64 %551 to double
  %571 = fcmp oge double %564, %570
  br label %nleNumber.exit

nleNumber.exit:                                   ; preds = %556, %559, %565, %569
  %.0.i98 = phi i1 [ %558, %556 ], [ %562, %559 ], [ %568, %565 ], [ %571, %569 ]
  %572 = zext i1 %.0.i98 to i32
  br label %678

; <label>:573                                     ; preds = %299
  %574 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 3, i32 0, i32 2
  %575 = bitcast %union.SyscallArg* %574 to i32*
  %576 = load i32* %575, align 1
  %577 = getelementptr %union.SyscallArg* %574, i64 1
  %578 = bitcast %union.SyscallArg* %577 to i64*
  %579 = load i64* %578, align 1
  %580 = getelementptr inbounds %struct.VExp* %293, i64 0, i32 3, i32 0, i32 0
  %581 = load i32* %580, align 1
  %582 = getelementptr %struct.VExp* %293, i64 0, i32 3, i32 0, i32 2
  %583 = bitcast %union.SyscallArg* %582 to i64*
  %584 = load i64* %583, align 1
  %585 = icmp eq i32 %576, 0
  %586 = icmp eq i32 %581, 0
  br i1 %585, label %587, label %596

; <label>:587                                     ; preds = %573
  %588 = trunc i64 %579 to i32
  br i1 %586, label %589, label %592

; <label>:589                                     ; preds = %587
  %590 = trunc i64 %584 to i32
  %591 = icmp sle i32 %588, %590
  br label %ngeNumber.exit

; <label>:592                                     ; preds = %587
  %593 = sitofp i32 %588 to double
  %594 = bitcast i64 %584 to double
  %595 = fcmp ole double %593, %594
  br label %ngeNumber.exit

; <label>:596                                     ; preds = %573
  %597 = bitcast i64 %579 to double
  br i1 %586, label %598, label %602

; <label>:598                                     ; preds = %596
  %599 = trunc i64 %584 to i32
  %600 = sitofp i32 %599 to double
  %601 = fcmp ole double %597, %600
  br label %ngeNumber.exit

; <label>:602                                     ; preds = %596
  %603 = bitcast i64 %584 to double
  %604 = fcmp ole double %597, %603
  br label %ngeNumber.exit

ngeNumber.exit:                                   ; preds = %589, %592, %598, %602
  %.0.i97 = phi i1 [ %591, %589 ], [ %595, %592 ], [ %601, %598 ], [ %604, %602 ]
  %605 = zext i1 %.0.i97 to i32
  br label %678

; <label>:606                                     ; preds = %299
  %607 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 3, i32 0, i32 2
  %608 = bitcast %union.SyscallArg* %607 to i32*
  %609 = load i32* %608, align 1
  %610 = getelementptr %union.SyscallArg* %607, i64 1
  %611 = bitcast %union.SyscallArg* %610 to i64*
  %612 = load i64* %611, align 1
  %613 = getelementptr inbounds %struct.VExp* %293, i64 0, i32 3, i32 0, i32 0
  %614 = load i32* %613, align 1
  %615 = getelementptr %struct.VExp* %293, i64 0, i32 3, i32 0, i32 2
  %616 = bitcast %union.SyscallArg* %615 to i64*
  %617 = load i64* %616, align 1
  %618 = icmp eq i32 %609, 0
  %619 = icmp eq i32 %614, 0
  br i1 %618, label %620, label %629

; <label>:620                                     ; preds = %606
  %621 = trunc i64 %612 to i32
  br i1 %619, label %622, label %625

; <label>:622                                     ; preds = %620
  %623 = trunc i64 %617 to i32
  %624 = icmp eq i32 %621, %623
  br label %eqNumber.exit

; <label>:625                                     ; preds = %620
  %626 = sitofp i32 %621 to double
  %627 = bitcast i64 %617 to double
  %628 = fcmp oeq double %626, %627
  br label %eqNumber.exit

; <label>:629                                     ; preds = %606
  %630 = bitcast i64 %612 to double
  br i1 %619, label %631, label %635

; <label>:631                                     ; preds = %629
  %632 = trunc i64 %617 to i32
  %633 = sitofp i32 %632 to double
  %634 = fcmp oeq double %630, %633
  br label %eqNumber.exit

; <label>:635                                     ; preds = %629
  %636 = bitcast i64 %617 to double
  %637 = fcmp oeq double %630, %636
  br label %eqNumber.exit

eqNumber.exit:                                    ; preds = %622, %625, %631, %635
  %.0.i96 = phi i1 [ %624, %622 ], [ %628, %625 ], [ %634, %631 ], [ %637, %635 ]
  %638 = zext i1 %.0.i96 to i32
  br label %678

; <label>:639                                     ; preds = %299
  %640 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 3, i32 0, i32 2
  %641 = bitcast %union.SyscallArg* %640 to i32*
  %642 = load i32* %641, align 1
  %643 = getelementptr %union.SyscallArg* %640, i64 1
  %644 = bitcast %union.SyscallArg* %643 to i64*
  %645 = load i64* %644, align 1
  %646 = getelementptr inbounds %struct.VExp* %293, i64 0, i32 3, i32 0, i32 0
  %647 = load i32* %646, align 1
  %648 = getelementptr %struct.VExp* %293, i64 0, i32 3, i32 0, i32 2
  %649 = bitcast %union.SyscallArg* %648 to i64*
  %650 = load i64* %649, align 1
  %651 = icmp eq i32 %642, 0
  %652 = icmp eq i32 %647, 0
  br i1 %651, label %653, label %662

; <label>:653                                     ; preds = %639
  %654 = trunc i64 %645 to i32
  br i1 %652, label %655, label %658

; <label>:655                                     ; preds = %653
  %656 = trunc i64 %650 to i32
  %657 = icmp ne i32 %654, %656
  br label %neqNumber.exit

; <label>:658                                     ; preds = %653
  %659 = sitofp i32 %654 to double
  %660 = bitcast i64 %650 to double
  %661 = fcmp une double %659, %660
  br label %neqNumber.exit

; <label>:662                                     ; preds = %639
  %663 = bitcast i64 %645 to double
  br i1 %652, label %664, label %668

; <label>:664                                     ; preds = %662
  %665 = trunc i64 %650 to i32
  %666 = sitofp i32 %665 to double
  %667 = fcmp une double %663, %666
  br label %neqNumber.exit

; <label>:668                                     ; preds = %662
  %669 = bitcast i64 %650 to double
  %670 = fcmp une double %663, %669
  br label %neqNumber.exit

neqNumber.exit:                                   ; preds = %655, %658, %664, %668
  %.0.i = phi i1 [ %657, %655 ], [ %661, %658 ], [ %667, %664 ], [ %670, %668 ]
  %671 = zext i1 %.0.i to i32
  br label %678

; <label>:672                                     ; preds = %divNumber.exit, %modNumber.exit
  %.sink = phi { i32, i64 } [ %453, %divNumber.exit ], [ %473, %modNumber.exit ]
  %673 = phi i8* [ %451, %divNumber.exit ], [ %472, %modNumber.exit ]
  %result.sroa.0.0 = phi i32 [ %.sroa.0.0.i, %divNumber.exit ], [ 0, %modNumber.exit ]
  %674 = extractvalue { i32, i64 } %.sink, 1
  %675 = icmp eq i8* %673, null
  br i1 %675, label %.thread120, label %676

; <label>:676                                     ; preds = %672
  %677 = getelementptr inbounds %struct.Value* %v, i64 0, i32 0
  store i32 1, i32* %677, align 4, !tbaa !30
  %.c35 = bitcast i8* %673 to %struct.VExp*
  store %struct.VExp* %.c35, %struct.VExp** %125, align 8, !tbaa !1
  br label %830

; <label>:678                                     ; preds = %leNumber.exit, %geNumber.exit, %nleNumber.exit, %ngeNumber.exit, %eqNumber.exit, %neqNumber.exit, %299
  %result_bool.0.ph.ph = phi i32 [ %506, %leNumber.exit ], [ %539, %geNumber.exit ], [ %572, %nleNumber.exit ], [ %605, %ngeNumber.exit ], [ %638, %eqNumber.exit ], [ %671, %neqNumber.exit ], [ 0, %299 ]
  %679 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %680 = icmp eq %struct.VExp* %679, null
  br i1 %680, label %681, label %newVExpRef.exit

; <label>:681                                     ; preds = %678
  %682 = tail call noalias i8* @malloc(i64 56000) #7
  %683 = bitcast i8* %682 to %struct.VExp*
  br label %684

; <label>:684                                     ; preds = %684, %681
  %indvars.iv.i.i81 = phi i64 [ 0, %681 ], [ %indvars.iv.next.i.i82, %684 ]
  %685 = phi %struct.VExp* [ null, %681 ], [ %686, %684 ]
  %686 = getelementptr inbounds %struct.VExp* %683, i64 %indvars.iv.i.i81
  %687 = getelementptr inbounds %struct.VExp* %683, i64 %indvars.iv.i.i81, i32 3
  %688 = bitcast %union.anon.1* %687 to %struct.VExp**
  store %struct.VExp* %685, %struct.VExp** %688, align 8, !tbaa !1
  %indvars.iv.next.i.i82 = add nuw nsw i64 %indvars.iv.i.i81, 1
  %exitcond.i.i83 = icmp eq i64 %indvars.iv.next.i.i82, 1000
  br i1 %exitcond.i.i83, label %.loopexit.i.i86, label %684

.loopexit.i.i86:                                  ; preds = %684
  %scevgep.i.i84 = getelementptr i8* %682, i64 55944
  %scevgep3.i.i85 = bitcast i8* %scevgep.i.i84 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i85, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpRef.exit

newVExpRef.exit:                                  ; preds = %678, %.loopexit.i.i86
  %689 = phi %struct.VExp* [ %scevgep3.i.i85, %.loopexit.i.i86 ], [ %679, %678 ]
  %690 = getelementptr inbounds %struct.VExp* %689, i64 0, i32 4
  store i32 1, i32* %690, align 4, !tbaa !17
  %691 = getelementptr inbounds %struct.VExp* %689, i64 0, i32 3
  %692 = bitcast %union.anon.1* %691 to %struct.VExp**
  %693 = load %struct.VExp** %692, align 8, !tbaa !1
  store %struct.VExp* %693, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %694 = getelementptr inbounds %struct.VExp* %689, i64 0, i32 0
  store i32 7, i32* %694, align 4, !tbaa !15
  %695 = getelementptr inbounds %struct.VExp* %689, i64 0, i32 3, i32 0, i32 0
  store i32 %result_bool.0.ph.ph, i32* %695, align 4, !tbaa !26
  %696 = icmp eq %struct.VExp* %693, null
  br i1 %696, label %697, label %newVExpAbs.exit80

; <label>:697                                     ; preds = %newVExpRef.exit
  %698 = tail call noalias i8* @malloc(i64 56000) #7
  %699 = bitcast i8* %698 to %struct.VExp*
  br label %700

; <label>:700                                     ; preds = %700, %697
  %indvars.iv.i.i74 = phi i64 [ 0, %697 ], [ %indvars.iv.next.i.i75, %700 ]
  %701 = phi %struct.VExp* [ null, %697 ], [ %702, %700 ]
  %702 = getelementptr inbounds %struct.VExp* %699, i64 %indvars.iv.i.i74
  %703 = getelementptr inbounds %struct.VExp* %699, i64 %indvars.iv.i.i74, i32 3
  %704 = bitcast %union.anon.1* %703 to %struct.VExp**
  store %struct.VExp* %701, %struct.VExp** %704, align 8, !tbaa !1
  %indvars.iv.next.i.i75 = add nuw nsw i64 %indvars.iv.i.i74, 1
  %exitcond.i.i76 = icmp eq i64 %indvars.iv.next.i.i75, 1000
  br i1 %exitcond.i.i76, label %.loopexit.i.i79, label %700

.loopexit.i.i79:                                  ; preds = %700
  %scevgep.i.i77 = getelementptr i8* %698, i64 55944
  %scevgep3.i.i78 = bitcast i8* %scevgep.i.i77 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i78, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpAbs.exit80

newVExpAbs.exit80:                                ; preds = %newVExpRef.exit, %.loopexit.i.i79
  %705 = phi %struct.VExp* [ %scevgep3.i.i78, %.loopexit.i.i79 ], [ %693, %newVExpRef.exit ]
  %706 = getelementptr inbounds %struct.VExp* %705, i64 0, i32 4
  store i32 1, i32* %706, align 4, !tbaa !17
  %707 = getelementptr inbounds %struct.VExp* %705, i64 0, i32 3
  %708 = bitcast %union.anon.1* %707 to %struct.VExp**
  %709 = load %struct.VExp** %708, align 8, !tbaa !1
  store %struct.VExp* %709, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %710 = getelementptr inbounds %struct.VExp* %705, i64 0, i32 0
  store i32 1, i32* %710, align 4, !tbaa !15
  store %struct.VExp* %689, %struct.VExp** %708, align 8, !tbaa !1
  %711 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %712 = icmp eq %struct.VExp* %711, null
  br i1 %712, label %713, label %newVExpAbs.exit

; <label>:713                                     ; preds = %newVExpAbs.exit80
  %714 = tail call noalias i8* @malloc(i64 56000) #7
  %715 = bitcast i8* %714 to %struct.VExp*
  br label %716

; <label>:716                                     ; preds = %716, %713
  %indvars.iv.i.i56 = phi i64 [ 0, %713 ], [ %indvars.iv.next.i.i57, %716 ]
  %717 = phi %struct.VExp* [ null, %713 ], [ %718, %716 ]
  %718 = getelementptr inbounds %struct.VExp* %715, i64 %indvars.iv.i.i56
  %719 = getelementptr inbounds %struct.VExp* %715, i64 %indvars.iv.i.i56, i32 3
  %720 = bitcast %union.anon.1* %719 to %struct.VExp**
  store %struct.VExp* %717, %struct.VExp** %720, align 8, !tbaa !1
  %indvars.iv.next.i.i57 = add nuw nsw i64 %indvars.iv.i.i56, 1
  %exitcond.i.i58 = icmp eq i64 %indvars.iv.next.i.i57, 1000
  br i1 %exitcond.i.i58, label %.loopexit.i.i61, label %716

.loopexit.i.i61:                                  ; preds = %716
  %scevgep.i.i59 = getelementptr i8* %714, i64 55944
  %scevgep3.i.i60 = bitcast i8* %scevgep.i.i59 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i60, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpAbs.exit

newVExpAbs.exit:                                  ; preds = %newVExpAbs.exit80, %.loopexit.i.i61
  %721 = phi %struct.VExp* [ %scevgep3.i.i60, %.loopexit.i.i61 ], [ %711, %newVExpAbs.exit80 ]
  %722 = getelementptr inbounds %struct.VExp* %721, i64 0, i32 4
  store i32 1, i32* %722, align 4, !tbaa !17
  %723 = getelementptr inbounds %struct.VExp* %721, i64 0, i32 3
  %724 = bitcast %union.anon.1* %723 to %struct.VExp**
  %725 = load %struct.VExp** %724, align 8, !tbaa !1
  store %struct.VExp* %725, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %726 = getelementptr inbounds %struct.VExp* %721, i64 0, i32 0
  store i32 1, i32* %726, align 4, !tbaa !15
  store %struct.VExp* %705, %struct.VExp** %724, align 8, !tbaa !1
  br label %745

.thread120:                                       ; preds = %406, %400, %392, %389, %370, %364, %356, %353, %334, %328, %320, %317, %672
  %result.sroa.0.0118122 = phi i32 [ %result.sroa.0.0, %672 ], [ 0, %317 ], [ 1, %320 ], [ 1, %328 ], [ 1, %334 ], [ 0, %353 ], [ 1, %356 ], [ 1, %364 ], [ 1, %370 ], [ 0, %389 ], [ 1, %392 ], [ 1, %400 ], [ 1, %406 ]
  %result.sroa.11.0119121 = phi i64 [ %674, %672 ], [ %319, %317 ], [ %325, %320 ], [ %333, %328 ], [ %337, %334 ], [ %355, %353 ], [ %361, %356 ], [ %369, %364 ], [ %373, %370 ], [ %391, %389 ], [ %397, %392 ], [ %405, %400 ], [ %409, %406 ]
  %727 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %728 = icmp eq %struct.VExp* %727, null
  br i1 %728, label %729, label %newVExpNum.exit

; <label>:729                                     ; preds = %.thread120
  %730 = tail call noalias i8* @malloc(i64 56000) #7
  %731 = bitcast i8* %730 to %struct.VExp*
  br label %732

; <label>:732                                     ; preds = %732, %729
  %indvars.iv.i.i49 = phi i64 [ 0, %729 ], [ %indvars.iv.next.i.i50, %732 ]
  %733 = phi %struct.VExp* [ null, %729 ], [ %734, %732 ]
  %734 = getelementptr inbounds %struct.VExp* %731, i64 %indvars.iv.i.i49
  %735 = getelementptr inbounds %struct.VExp* %731, i64 %indvars.iv.i.i49, i32 3
  %736 = bitcast %union.anon.1* %735 to %struct.VExp**
  store %struct.VExp* %733, %struct.VExp** %736, align 8, !tbaa !1
  %indvars.iv.next.i.i50 = add nuw nsw i64 %indvars.iv.i.i49, 1
  %exitcond.i.i51 = icmp eq i64 %indvars.iv.next.i.i50, 1000
  br i1 %exitcond.i.i51, label %.loopexit.i.i54, label %732

.loopexit.i.i54:                                  ; preds = %732
  %scevgep.i.i52 = getelementptr i8* %730, i64 55944
  %scevgep3.i.i53 = bitcast i8* %scevgep.i.i52 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i53, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNum.exit

newVExpNum.exit:                                  ; preds = %.thread120, %.loopexit.i.i54
  %737 = phi %struct.VExp* [ %scevgep3.i.i53, %.loopexit.i.i54 ], [ %727, %.thread120 ]
  %738 = getelementptr inbounds %struct.VExp* %737, i64 0, i32 4
  store i32 1, i32* %738, align 4, !tbaa !17
  %739 = getelementptr inbounds %struct.VExp* %737, i64 0, i32 3
  %740 = bitcast %union.anon.1* %739 to %struct.VExp**
  %741 = load %struct.VExp** %740, align 8, !tbaa !1
  store %struct.VExp* %741, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %742 = getelementptr inbounds %struct.VExp* %737, i64 0, i32 0
  store i32 0, i32* %742, align 4, !tbaa !15
  %743 = getelementptr inbounds %struct.VExp* %737, i64 0, i32 3, i32 0, i32 0
  store i32 %result.sroa.0.0118122, i32* %743, align 8
  %744 = getelementptr inbounds %struct.VExp* %737, i64 0, i32 3, i32 0, i32 2, i32 0
  %num_val.coerce1.c.i = inttoptr i64 %result.sroa.11.0119121 to %struct.IntList*
  store %struct.IntList* %num_val.coerce1.c.i, %struct.IntList** %744, align 8
  br label %745

; <label>:745                                     ; preds = %newVExpNum.exit, %newVExpAbs.exit
  %nexp9.0 = phi %struct.VExp* [ %721, %newVExpAbs.exit ], [ %737, %newVExpNum.exit ]
  %746 = getelementptr inbounds %struct.Continuation* %3, i64 0, i32 2
  %747 = load %struct.Continuation** %746, align 8, !tbaa !44
  store %struct.VExp* %nexp9.0, %struct.VExp** %125, align 8, !tbaa !31
  store %struct.VContext* null, %struct.VContext** %127, align 8, !tbaa !33
  store %struct.Continuation* %747, %struct.Continuation** %2, align 8, !tbaa !34
  br label %830

; <label>:748                                     ; preds = %124
  %749 = getelementptr inbounds %struct.Value* %131, i64 0, i32 0
  %750 = load i32* %749, align 4, !tbaa !30
  %switch41 = icmp ult i32 %750, 2
  br i1 %switch41, label %751, label %831

; <label>:751                                     ; preds = %748
  %752 = icmp eq i32 %750, 1
  %753 = getelementptr inbounds %struct.Value* %131, i64 0, i32 1
  br i1 %752, label %754, label %758

; <label>:754                                     ; preds = %751
  %755 = bitcast %union.anon.0* %753 to i8**
  %756 = load i8** %755, align 8, !tbaa !1
  %757 = getelementptr inbounds %struct.Value* %v, i64 0, i32 0
  store i32 1, i32* %757, align 4, !tbaa !30
  %.c34 = bitcast i8* %756 to %struct.VExp*
  store %struct.VExp* %.c34, %struct.VExp** %125, align 8, !tbaa !1
  br label %830

; <label>:758                                     ; preds = %751
  %759 = getelementptr inbounds %union.anon.0* %753, i64 0, i32 0, i32 0
  %760 = load %struct.VExp** %759, align 8, !tbaa !18
  %761 = getelementptr inbounds %struct.VExp* %760, i64 0, i32 0
  %762 = load i32* %761, align 4, !tbaa !15
  %763 = icmp eq i32 %762, 0
  br i1 %763, label %766, label %764

; <label>:764                                     ; preds = %758
  %765 = getelementptr inbounds %struct.Value* %v, i64 0, i32 0
  store i32 1, i32* %765, align 4, !tbaa !30
  store %struct.VExp* bitcast ([52 x i8]* @.str9 to %struct.VExp*), %struct.VExp** %125, align 8, !tbaa !1
  br label %830

; <label>:766                                     ; preds = %758
  %767 = getelementptr inbounds %struct.VExp* %760, i64 0, i32 3, i32 0, i32 0
  %768 = load i32* %767, align 4, !tbaa !40
  %769 = icmp eq i32 %768, 0
  br i1 %769, label %772, label %770

; <label>:770                                     ; preds = %766
  %771 = getelementptr inbounds %struct.Value* %v, i64 0, i32 0
  store i32 1, i32* %771, align 4, !tbaa !30
  store %struct.VExp* bitcast ([44 x i8]* @.str10 to %struct.VExp*), %struct.VExp** %125, align 8, !tbaa !1
  br label %830

; <label>:772                                     ; preds = %766
  %773 = getelementptr inbounds %struct.VExp* %760, i64 0, i32 3, i32 0, i32 2
  %774 = bitcast %union.SyscallArg* %773 to i32*
  %775 = load i32* %774, align 4, !tbaa !26
  %776 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 3
  %777 = bitcast %union.anon.1* %776 to %struct.IntList**
  %778 = load %struct.IntList** %777, align 8, !tbaa !21
  %779 = icmp eq %struct.IntList* %778, null
  br i1 %779, label %retainIntList.exit, label %780

; <label>:780                                     ; preds = %772
  %781 = getelementptr inbounds %struct.IntList* %778, i64 0, i32 2
  %782 = load i32* %781, align 4, !tbaa !8
  %783 = add nsw i32 %782, 1
  store i32 %783, i32* %781, align 4, !tbaa !8
  br label %retainIntList.exit

retainIntList.exit:                               ; preds = %772, %780
  %784 = load %struct.IntList** @allocateIntList.pool, align 8, !tbaa !1
  %785 = icmp eq %struct.IntList* %784, null
  br i1 %785, label %786, label %newIntList.exit

; <label>:786                                     ; preds = %retainIntList.exit
  %787 = tail call noalias i8* @malloc(i64 24000) #7
  %788 = bitcast i8* %787 to %struct.IntList*
  br label %789

; <label>:789                                     ; preds = %789, %786
  %indvars.iv.i.i42 = phi i64 [ 0, %786 ], [ %indvars.iv.next.i.i43, %789 ]
  %790 = phi %struct.IntList* [ null, %786 ], [ %791, %789 ]
  %791 = getelementptr inbounds %struct.IntList* %788, i64 %indvars.iv.i.i42
  %792 = getelementptr inbounds %struct.IntList* %788, i64 %indvars.iv.i.i42, i32 1
  store %struct.IntList* %790, %struct.IntList** %792, align 8, !tbaa !5
  %indvars.iv.next.i.i43 = add nuw nsw i64 %indvars.iv.i.i42, 1
  %exitcond.i.i44 = icmp eq i64 %indvars.iv.next.i.i43, 1000
  br i1 %exitcond.i.i44, label %.loopexit.i.i47, label %789

.loopexit.i.i47:                                  ; preds = %789
  %scevgep.i.i45 = getelementptr i8* %787, i64 23976
  %scevgep3.i.i46 = bitcast i8* %scevgep.i.i45 to %struct.IntList*
  store %struct.IntList* %scevgep3.i.i46, %struct.IntList** @allocateIntList.pool, align 8, !tbaa !1
  br label %newIntList.exit

newIntList.exit:                                  ; preds = %retainIntList.exit, %.loopexit.i.i47
  %793 = phi %struct.IntList* [ %scevgep3.i.i46, %.loopexit.i.i47 ], [ %784, %retainIntList.exit ]
  %794 = getelementptr inbounds %struct.IntList* %793, i64 0, i32 1
  %795 = load %struct.IntList** %794, align 8, !tbaa !5
  store %struct.IntList* %795, %struct.IntList** @allocateIntList.pool, align 8, !tbaa !1
  %796 = getelementptr inbounds %struct.IntList* %793, i64 0, i32 0
  store i32 %775, i32* %796, align 4, !tbaa !9
  store %struct.IntList* %778, %struct.IntList** %794, align 8, !tbaa !5
  %797 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %798 = icmp eq %struct.VExp* %797, null
  br i1 %798, label %799, label %newVExpIntList.exit

; <label>:799                                     ; preds = %newIntList.exit
  %800 = tail call noalias i8* @malloc(i64 56000) #7
  %801 = bitcast i8* %800 to %struct.VExp*
  br label %802

; <label>:802                                     ; preds = %802, %799
  %indvars.iv.i.i = phi i64 [ 0, %799 ], [ %indvars.iv.next.i.i, %802 ]
  %803 = phi %struct.VExp* [ null, %799 ], [ %804, %802 ]
  %804 = getelementptr inbounds %struct.VExp* %801, i64 %indvars.iv.i.i
  %805 = getelementptr inbounds %struct.VExp* %801, i64 %indvars.iv.i.i, i32 3
  %806 = bitcast %union.anon.1* %805 to %struct.VExp**
  store %struct.VExp* %803, %struct.VExp** %806, align 8, !tbaa !1
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %exitcond.i.i = icmp eq i64 %indvars.iv.next.i.i, 1000
  br i1 %exitcond.i.i, label %.loopexit.i.i, label %802

.loopexit.i.i:                                    ; preds = %802
  %scevgep.i.i = getelementptr i8* %800, i64 55944
  %scevgep3.i.i = bitcast i8* %scevgep.i.i to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpIntList.exit

newVExpIntList.exit:                              ; preds = %newIntList.exit, %.loopexit.i.i
  %807 = phi %struct.VExp* [ %scevgep3.i.i, %.loopexit.i.i ], [ %797, %newIntList.exit ]
  %808 = getelementptr inbounds %struct.VExp* %807, i64 0, i32 4
  store i32 1, i32* %808, align 4, !tbaa !17
  %809 = getelementptr inbounds %struct.VExp* %807, i64 0, i32 3
  %810 = bitcast %union.anon.1* %809 to %struct.VExp**
  %811 = load %struct.VExp** %810, align 8, !tbaa !1
  store %struct.VExp* %811, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %812 = getelementptr inbounds %struct.VExp* %807, i64 0, i32 0
  store i32 4, i32* %812, align 4, !tbaa !15
  %813 = bitcast %union.anon.1* %809 to %struct.IntList**
  store %struct.IntList* %793, %struct.IntList** %813, align 8, !tbaa !21
  %814 = getelementptr inbounds %struct.Continuation* %3, i64 0, i32 2
  %815 = load %struct.Continuation** %814, align 8, !tbaa !44
  store %struct.VExp* %807, %struct.VExp** %125, align 8, !tbaa !31
  store %struct.VContext* null, %struct.VContext** %127, align 8, !tbaa !33
  store %struct.Continuation* %815, %struct.Continuation** %2, align 8, !tbaa !34
  br label %830

; <label>:816                                     ; preds = %124
  %817 = call %struct.VExp* @appendSyscallArg(%struct.VExp* %126, %struct.Value* %131, i8** %error_message, %struct.Value** %to_resolve)
  %818 = icmp eq %struct.VExp* %817, null
  br i1 %818, label %819, label %827

; <label>:819                                     ; preds = %816
  %820 = load i8** %error_message, align 8, !tbaa !1
  %821 = icmp eq i8* %820, null
  br i1 %821, label %824, label %822

; <label>:822                                     ; preds = %819
  %823 = getelementptr inbounds %struct.Value* %v, i64 0, i32 0
  store i32 1, i32* %823, align 4, !tbaa !30
  %.c = bitcast i8* %820 to %struct.VExp*
  store %struct.VExp* %.c, %struct.VExp** %125, align 8, !tbaa !1
  br label %830

; <label>:824                                     ; preds = %819
  %825 = load %struct.Value** %to_resolve, align 8, !tbaa !1
  %826 = icmp eq %struct.Value* %825, null
  br i1 %826, label %830, label %831

; <label>:827                                     ; preds = %816
  %828 = getelementptr inbounds %struct.Continuation* %3, i64 0, i32 2
  %829 = load %struct.Continuation** %828, align 8, !tbaa !44
  store %struct.VExp* %817, %struct.VExp** %125, align 8, !tbaa !31
  store %struct.VContext* %128, %struct.VContext** %127, align 8, !tbaa !33
  store %struct.Continuation* %829, %struct.Continuation** %2, align 8, !tbaa !34
  br label %830

; <label>:830                                     ; preds = %124, %7, %34, %824, %newValue.exit, %retainVContext.exit55, %65, %134, %180, %retainVExp.exit73, %170, %764, %newVExpIntList.exit, %770, %754, %827, %822, %287, %676, %745, %297, %insertRef.exit, %5
  br label %831

; <label>:831                                     ; preds = %748, %281, %164, %824, %lookUpRef.exit, %830
  %.0 = phi %struct.Value* [ null, %830 ], [ %43, %lookUpRef.exit ], [ %131, %164 ], [ %131, %281 ], [ %131, %748 ], [ %825, %824 ]
  ret %struct.Value* %.0
}

; Function Attrs: nounwind readnone
declare double @floor(double) #4

; Function Attrs: nounwind uwtable
define void @resolveAllValue(%struct.Value* %v) #1 {
  %1 = tail call noalias i8* @malloc(i64 16) #7
  %2 = bitcast i8* %1 to i64*
  store i64 0, i64* %2, align 8
  %3 = bitcast i8* %1 to %struct.Value**
  store %struct.Value* %v, %struct.Value** %3, align 8, !tbaa !47
  %4 = getelementptr inbounds i8* %1, i64 8
  %5 = bitcast i8* %4 to %struct.ValueStack**
  store %struct.ValueStack* null, %struct.ValueStack** %5, align 8, !tbaa !49
  %6 = icmp eq i8* %1, null
  br i1 %6, label %.loopexit, label %.lr.ph.lr.ph

.lr.ph.lr.ph:                                     ; preds = %0
  %7 = bitcast i8* %1 to %struct.ValueStack*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.lr.ph, %.outer.backedge
  %head.0.ph1 = phi %struct.ValueStack* [ %7, %.lr.ph.lr.ph ], [ %head.0.ph.be, %.outer.backedge ]
  %8 = getelementptr inbounds %struct.ValueStack* %head.0.ph1, i64 0, i32 0
  br label %.backedge

.backedge:                                        ; preds = %15, %12, %.lr.ph
  %9 = load %struct.Value** %8, align 8, !tbaa !47
  %10 = getelementptr inbounds %struct.Value* %9, i64 0, i32 0
  %11 = load i32* %10, align 4, !tbaa !30
  %switch = icmp ult i32 %11, 2
  br i1 %switch, label %26, label %12

; <label>:12                                      ; preds = %.backedge
  %13 = tail call %struct.Value* @resolveValue(%struct.Value* %9)
  %14 = icmp eq %struct.Value* %13, null
  br i1 %14, label %.backedge, label %15

; <label>:15                                      ; preds = %12
  %16 = load %struct.Value** %8, align 8, !tbaa !47
  %17 = icmp eq %struct.Value* %13, %16
  br i1 %17, label %.backedge, label %18

; <label>:18                                      ; preds = %15
  %19 = tail call noalias i8* @malloc(i64 16) #7
  %20 = bitcast i8* %19 to %struct.ValueStack*
  %21 = bitcast i8* %19 to i64*
  store i64 0, i64* %21, align 8
  %22 = bitcast i8* %19 to %struct.Value**
  store %struct.Value* %13, %struct.Value** %22, align 8, !tbaa !47
  %23 = getelementptr inbounds i8* %19, i64 8
  %24 = bitcast i8* %23 to %struct.ValueStack**
  store %struct.ValueStack* %head.0.ph1, %struct.ValueStack** %24, align 8, !tbaa !49
  br label %.outer.backedge

.outer.backedge:                                  ; preds = %18, %26
  %head.0.ph.be = phi %struct.ValueStack* [ %20, %18 ], [ %28, %26 ]
  %25 = icmp eq %struct.ValueStack* %head.0.ph.be, null
  br i1 %25, label %.loopexit, label %.lr.ph

; <label>:26                                      ; preds = %.backedge
  %27 = getelementptr inbounds %struct.ValueStack* %head.0.ph1, i64 0, i32 1
  %28 = load %struct.ValueStack** %27, align 8, !tbaa !49
  br label %.outer.backedge

.loopexit:                                        ; preds = %.outer.backedge, %0
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @executeValue(%struct.Value* %v, i32 %argc, i8** nocapture readonly %args) #1 {
  %1 = icmp sgt i32 %argc, 0
  br i1 %1, label %2, label %4

; <label>:2                                       ; preds = %0
  %3 = load i8** %args, align 8, !tbaa !1
  br label %4

; <label>:4                                       ; preds = %2, %0
  %cur_arg.0 = phi i8* [ %3, %2 ], [ null, %0 ]
  %5 = tail call noalias i8* @malloc(i64 16) #7
  %6 = bitcast i8* %5 to %struct._IO_FILE**
  %7 = load %struct._IO_FILE** @stdin, align 8, !tbaa !1
  store %struct._IO_FILE* %7, %struct._IO_FILE** %6, align 8, !tbaa !1
  %8 = load %struct._IO_FILE** @stdout, align 8, !tbaa !1
  %9 = getelementptr inbounds i8* %5, i64 8
  %10 = bitcast i8* %9 to %struct._IO_FILE**
  store %struct._IO_FILE* %8, %struct._IO_FILE** %10, align 8, !tbaa !1
  br label %.backedge

.backedge:                                        ; preds = %resolveAllValue.exit34, %newValue.exit47, %4
  %files_buflen.0 = phi i32 [ 2, %4 ], [ %files_buflen.2, %newValue.exit47 ], [ %files_buflen.2, %resolveAllValue.exit34 ]
  %files.0 = phi %struct._IO_FILE** [ %6, %4 ], [ %files.2, %newValue.exit47 ], [ %files.2, %resolveAllValue.exit34 ]
  %cur_arg.1 = phi i8* [ %cur_arg.0, %4 ], [ %cur_arg.2, %newValue.exit47 ], [ %cur_arg.2, %resolveAllValue.exit34 ]
  %cur_argi.0 = phi i32 [ 0, %4 ], [ %cur_argi.1, %newValue.exit47 ], [ %cur_argi.1, %resolveAllValue.exit34 ]
  %.0 = phi %struct.Value* [ %v, %4 ], [ %336, %newValue.exit47 ], [ %252, %resolveAllValue.exit34 ]
  %11 = bitcast %struct._IO_FILE** %files.0 to i8*
  %12 = getelementptr inbounds %struct.Value* %.0, i64 0, i32 0
  %13 = load i32* %12, align 4, !tbaa !30
  %switch = icmp ult i32 %13, 2
  br i1 %switch, label %resolveAllValue.exit, label %14

; <label>:14                                      ; preds = %.backedge
  %15 = tail call noalias i8* @malloc(i64 16) #7
  %16 = bitcast i8* %15 to %struct.Value**
  store %struct.Value* %.0, %struct.Value** %16, align 8, !tbaa !47
  %17 = getelementptr inbounds i8* %15, i64 8
  %18 = bitcast i8* %17 to %struct.ValueStack**
  store %struct.ValueStack* null, %struct.ValueStack** %18, align 8, !tbaa !49
  %19 = icmp eq i8* %15, null
  br i1 %19, label %resolveAllValue.exitthread-pre-split, label %.lr.ph.lr.ph.i

.lr.ph.lr.ph.i:                                   ; preds = %14
  %20 = bitcast i8* %15 to %struct.ValueStack*
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.outer.backedge.i, %.lr.ph.lr.ph.i
  %head.0.ph1.i = phi %struct.ValueStack* [ %20, %.lr.ph.lr.ph.i ], [ %head.0.ph.be.i, %.outer.backedge.i ]
  %21 = getelementptr inbounds %struct.ValueStack* %head.0.ph1.i, i64 0, i32 0
  %22 = load %struct.Value** %21, align 8, !tbaa !47
  %23 = getelementptr inbounds %struct.Value* %22, i64 0, i32 0
  %24 = load i32* %23, align 4, !tbaa !30
  %switch.i50 = icmp ult i32 %24, 2
  br i1 %switch.i50, label %.backedge.i._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.i, %.backedge.i.backedge
  %25 = phi %struct.Value* [ %28, %.backedge.i.backedge ], [ %22, %.lr.ph.i ]
  %26 = tail call %struct.Value* @resolveValue(%struct.Value* %25) #7
  %27 = icmp eq %struct.Value* %26, null
  %.pre103 = load %struct.Value** %21, align 8, !tbaa !47
  br i1 %27, label %.backedge.i.backedge, label %31

.backedge.i.backedge:                             ; preds = %.lr.ph, %31
  %28 = phi %struct.Value* [ %26, %31 ], [ %.pre103, %.lr.ph ]
  %29 = getelementptr inbounds %struct.Value* %28, i64 0, i32 0
  %30 = load i32* %29, align 4, !tbaa !30
  %switch.i = icmp ult i32 %30, 2
  br i1 %switch.i, label %.backedge.i._crit_edge, label %.lr.ph

; <label>:31                                      ; preds = %.lr.ph
  %32 = icmp eq %struct.Value* %26, %.pre103
  br i1 %32, label %.backedge.i.backedge, label %33

; <label>:33                                      ; preds = %31
  %34 = tail call noalias i8* @malloc(i64 16) #7
  %35 = bitcast i8* %34 to %struct.ValueStack*
  %36 = bitcast i8* %34 to %struct.Value**
  store %struct.Value* %26, %struct.Value** %36, align 8, !tbaa !47
  %37 = getelementptr inbounds i8* %34, i64 8
  %38 = bitcast i8* %37 to %struct.ValueStack**
  store %struct.ValueStack* %head.0.ph1.i, %struct.ValueStack** %38, align 8, !tbaa !49
  br label %.outer.backedge.i

.outer.backedge.i:                                ; preds = %.backedge.i._crit_edge, %33
  %head.0.ph.be.i = phi %struct.ValueStack* [ %35, %33 ], [ %41, %.backedge.i._crit_edge ]
  %39 = icmp eq %struct.ValueStack* %head.0.ph.be.i, null
  br i1 %39, label %resolveAllValue.exitthread-pre-split, label %.lr.ph.i

.backedge.i._crit_edge:                           ; preds = %.backedge.i.backedge, %.lr.ph.i
  %40 = getelementptr inbounds %struct.ValueStack* %head.0.ph1.i, i64 0, i32 1
  %41 = load %struct.ValueStack** %40, align 8, !tbaa !49
  br label %.outer.backedge.i

resolveAllValue.exitthread-pre-split:             ; preds = %.outer.backedge.i, %14
  %.pr = load i32* %12, align 4, !tbaa !30
  br label %resolveAllValue.exit

resolveAllValue.exit:                             ; preds = %resolveAllValue.exitthread-pre-split, %.backedge
  %42 = phi i32 [ %.pr, %resolveAllValue.exitthread-pre-split ], [ %13, %.backedge ]
  %43 = icmp eq i32 %42, 1
  %44 = getelementptr inbounds %struct.Value* %.0, i64 0, i32 1
  br i1 %43, label %45, label %49

; <label>:45                                      ; preds = %resolveAllValue.exit
  %46 = bitcast %union.anon.0* %44 to i8**
  %47 = load i8** %46, align 8, !tbaa !1
  %48 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str11, i64 0, i64 0), i8* %47) #7
  br label %displayExp.exit

; <label>:49                                      ; preds = %resolveAllValue.exit
  %50 = getelementptr inbounds %union.anon.0* %44, i64 0, i32 0, i32 0
  %51 = load %struct.VExp** %50, align 8, !tbaa !18
  %52 = getelementptr inbounds %struct.VExp* %51, i64 0, i32 0
  %53 = load i32* %52, align 4, !tbaa !15
  switch i32 %53, label %67 [
    i32 5, label %69
    i32 0, label %54
  ]

; <label>:54                                      ; preds = %49
  %55 = getelementptr inbounds %struct.VExp* %51, i64 0, i32 3, i32 0, i32 0
  %56 = load i32* %55, align 8
  %57 = getelementptr inbounds %struct.VExp* %51, i64 0, i32 3, i32 0, i32 2
  %58 = bitcast %union.SyscallArg* %57 to double*
  %59 = load double* %58, align 8
  %60 = icmp eq i32 %56, 0
  br i1 %60, label %61, label %65

; <label>:61                                      ; preds = %54
  %62 = bitcast double %59 to i64
  %63 = trunc i64 %62 to i32
  %64 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i32 %63) #7
  br label %displayExp.exit

; <label>:65                                      ; preds = %54
  %66 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), double %59) #7
  br label %displayExp.exit

; <label>:67                                      ; preds = %49
  %68 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str4, i64 0, i64 0)) #7
  br label %displayExp.exit

; <label>:69                                      ; preds = %49
  %70 = getelementptr inbounds %struct.VExp* %51, i64 0, i32 3, i32 0, i32 0
  %71 = load i32* %70, align 4, !tbaa !25
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds [8 x [4 x i32]]* @syscall_arginfo, i64 0, i64 %72, i64 0
  %74 = load i32* %73, align 16, !tbaa !26
  %75 = getelementptr inbounds %struct.VExp* %51, i64 0, i32 3, i32 0, i32 1
  %76 = load i32* %75, align 4, !tbaa !23
  %77 = icmp sgt i32 %74, %76
  br i1 %77, label %78, label %79

; <label>:78                                      ; preds = %69
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([45 x i8]* @str, i64 0, i64 0))
  br label %displayExp.exit

; <label>:79                                      ; preds = %69
  switch i32 %71, label %.critedge [
    i32 0, label %80
    i32 1, label %84
    i32 3, label %157
    i32 4, label %170
    i32 5, label %186
    i32 6, label %202
    i32 2, label %217
    i32 7, label %230
  ]

; <label>:80                                      ; preds = %79
  %81 = getelementptr inbounds %struct.VExp* %51, i64 0, i32 3, i32 0, i32 2
  %82 = bitcast %union.SyscallArg* %81 to i32*
  %83 = load i32* %82, align 4, !tbaa !26
  br label %displayExp.exit

; <label>:84                                      ; preds = %79
  %85 = getelementptr inbounds %struct.VExp* %51, i64 0, i32 3, i32 0, i32 3
  %86 = load i32* %85, align 4, !tbaa !41
  %87 = icmp ult i32 %86, 4
  br i1 %87, label %88, label %.critedge

; <label>:88                                      ; preds = %84
  %89 = sext i32 %86 to i64
  %switch.gep = getelementptr inbounds [4 x i8*]* @switch.table, i64 0, i64 %89
  %switch.load = load i8** %switch.gep, align 8
  %90 = getelementptr inbounds %struct.VExp* %51, i64 0, i32 3, i32 0, i32 2, i32 0
  %91 = load %struct.IntList** %90, align 8, !tbaa !1
  %92 = icmp eq %struct.IntList* %91, null
  br i1 %92, label %.thread.i, label %.lr.ph7.i

.thread.i:                                        ; preds = %88
  %93 = tail call noalias i8* @malloc(i64 1) #7
  br label %convertIntListToString.exit

.lr.ph7.i:                                        ; preds = %88, %.lr.ph7.i
  %l.05.i = phi i32 [ %phitmp.i, %.lr.ph7.i ], [ 1, %88 ]
  %p.04.i = phi %struct.IntList* [ %95, %.lr.ph7.i ], [ %91, %88 ]
  %94 = getelementptr inbounds %struct.IntList* %p.04.i, i64 0, i32 1
  %95 = load %struct.IntList** %94, align 8, !tbaa !5
  %phitmp.i = add i32 %l.05.i, 1
  %96 = icmp eq %struct.IntList* %95, null
  br i1 %96, label %.lr.ph.i11.preheader, label %.lr.ph7.i

.lr.ph.i11.preheader:                             ; preds = %.lr.ph7.i
  %phitmp10.i = sext i32 %phitmp.i to i64
  %97 = tail call noalias i8* @malloc(i64 %phitmp10.i) #7
  br label %.lr.ph.i11

.lr.ph.i11:                                       ; preds = %.lr.ph.i11.preheader, %.lr.ph.i11
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %.lr.ph.i11 ], [ 0, %.lr.ph.i11.preheader ]
  %p1.03.i = phi %struct.IntList* [ %104, %.lr.ph.i11 ], [ %91, %.lr.ph.i11.preheader ]
  %i.02.i = phi i32 [ %102, %.lr.ph.i11 ], [ 0, %.lr.ph.i11.preheader ]
  %98 = getelementptr inbounds %struct.IntList* %p1.03.i, i64 0, i32 0
  %99 = load i32* %98, align 4, !tbaa !9
  %100 = trunc i32 %99 to i8
  %101 = getelementptr inbounds i8* %97, i64 %indvars.iv.i
  store i8 %100, i8* %101, align 1, !tbaa !10
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %102 = add nsw i32 %i.02.i, 1
  %103 = getelementptr inbounds %struct.IntList* %p1.03.i, i64 0, i32 1
  %104 = load %struct.IntList** %103, align 8, !tbaa !5
  %105 = icmp eq %struct.IntList* %104, null
  br i1 %105, label %._crit_edge.i, label %.lr.ph.i11

._crit_edge.i:                                    ; preds = %.lr.ph.i11
  %phitmp11.i = sext i32 %102 to i64
  br label %convertIntListToString.exit

convertIntListToString.exit:                      ; preds = %.thread.i, %._crit_edge.i
  %106 = phi i8* [ %97, %._crit_edge.i ], [ %93, %.thread.i ]
  %i.0.lcssa.i = phi i64 [ %phitmp11.i, %._crit_edge.i ], [ 0, %.thread.i ]
  %107 = getelementptr inbounds i8* %106, i64 %i.0.lcssa.i
  store i8 0, i8* %107, align 1, !tbaa !10
  %108 = tail call %struct._IO_FILE* @fopen(i8* %106, i8* %switch.load) #7
  tail call void @free(i8* %106) #7
  %109 = icmp eq %struct._IO_FILE* %108, null
  br i1 %109, label %.critedge, label %.preheader

.preheader:                                       ; preds = %convertIntListToString.exit
  %110 = icmp sgt i32 %files_buflen.0, 0
  br i1 %110, label %.lr.ph55, label %.thread48.thread

.thread48.thread:                                 ; preds = %.preheader
  %111 = sext i32 %files_buflen.0 to i64
  %112 = shl nsw i64 %111, 4
  %113 = tail call i8* @realloc(i8* %11, i64 %112) #7
  %114 = bitcast i8* %113 to %struct._IO_FILE**
  br label %.loopexit.thread

; <label>:115                                     ; preds = %.lr.ph55
  %116 = add nsw i32 %i.054, 1
  %117 = trunc i64 %indvars.iv.next to i32
  %118 = icmp slt i32 %117, %files_buflen.0
  br i1 %118, label %.lr.ph55, label %.thread48

.lr.ph55:                                         ; preds = %.preheader, %115
  %indvars.iv = phi i64 [ %indvars.iv.next, %115 ], [ 0, %.preheader ]
  %i.054 = phi i32 [ %116, %115 ], [ 0, %.preheader ]
  %119 = getelementptr inbounds %struct._IO_FILE** %files.0, i64 %indvars.iv
  %120 = load %struct._IO_FILE** %119, align 8, !tbaa !1
  %121 = icmp eq %struct._IO_FILE* %120, null
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %121, label %122, label %115

; <label>:122                                     ; preds = %.lr.ph55
  %123 = icmp eq i32 %i.054, -1
  br i1 %123, label %.thread48, label %154

.thread48:                                        ; preds = %115, %122
  %124 = bitcast %struct._IO_FILE** %files.0 to i8*
  %125 = sext i32 %files_buflen.0 to i64
  %126 = shl nsw i64 %125, 4
  %127 = tail call i8* @realloc(i8* %124, i64 %126) #7
  %128 = bitcast i8* %127 to %struct._IO_FILE**
  br i1 %110, label %.lr.ph57.preheader, label %.loopexit.thread

.lr.ph57.preheader:                               ; preds = %.thread48
  %129 = add i32 %files_buflen.0, -1
  %130 = zext i32 %129 to i64
  %131 = add i64 %130, 1
  %end.idx = add i64 %130, 1
  %n.vec = and i64 %131, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %132 = add i32 %files_buflen.0, -1
  %133 = zext i32 %132 to i64
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph57.preheader
  %scevgep127 = getelementptr %struct._IO_FILE** %files.0, i64 %133
  %134 = shl nuw nsw i64 %133, 3
  %scevgep127128 = bitcast %struct._IO_FILE** %scevgep127 to i8*
  %scevgep126 = getelementptr i8* %127, i64 %134
  %bound1 = icmp ule i8* %11, %scevgep126
  %bound0 = icmp ule i8* %127, %scevgep127128
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.memcheck, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %135 = getelementptr inbounds %struct._IO_FILE** %files.0, i64 %index
  %136 = bitcast %struct._IO_FILE** %135 to <2 x %struct._IO_FILE*>*
  %wide.load = load <2 x %struct._IO_FILE*>* %136, align 8
  %.sum133 = or i64 %index, 2
  %137 = getelementptr %struct._IO_FILE** %files.0, i64 %.sum133
  %138 = bitcast %struct._IO_FILE** %137 to <2 x %struct._IO_FILE*>*
  %wide.load130 = load <2 x %struct._IO_FILE*>* %138, align 8
  %139 = getelementptr inbounds %struct._IO_FILE** %128, i64 %index
  %140 = bitcast %struct._IO_FILE** %139 to <2 x %struct._IO_FILE*>*
  store <2 x %struct._IO_FILE*> %wide.load, <2 x %struct._IO_FILE*>* %140, align 8
  %.sum134 = or i64 %index, 2
  %141 = getelementptr %struct._IO_FILE** %128, i64 %.sum134
  %142 = bitcast %struct._IO_FILE** %141 to <2 x %struct._IO_FILE*>*
  store <2 x %struct._IO_FILE*> %wide.load130, <2 x %struct._IO_FILE*>* %142, align 8
  %index.next = add i64 %index, 4
  %143 = icmp eq i64 %index.next, %n.vec
  br i1 %143, label %middle.block, label %vector.body, !llvm.loop !50

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph57.preheader
  %resume.val = phi i64 [ 0, %.lr.ph57.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %.loopexit, label %.lr.ph57

.lr.ph57:                                         ; preds = %middle.block, %.lr.ph57
  %indvars.iv81 = phi i64 [ %indvars.iv.next82, %.lr.ph57 ], [ %resume.val, %middle.block ]
  %144 = getelementptr inbounds %struct._IO_FILE** %files.0, i64 %indvars.iv81
  %145 = load %struct._IO_FILE** %144, align 8, !tbaa !1
  %146 = getelementptr inbounds %struct._IO_FILE** %128, i64 %indvars.iv81
  store %struct._IO_FILE* %145, %struct._IO_FILE** %146, align 8, !tbaa !1
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next82 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %files_buflen.0
  br i1 %exitcond, label %.loopexit, label %.lr.ph57, !llvm.loop !53

.loopexit:                                        ; preds = %middle.block, %.lr.ph57
  br i1 %110, label %.lr.ph59, label %.loopexit.thread

.lr.ph59:                                         ; preds = %.loopexit
  %147 = shl nsw i64 %125, 3
  %scevgep = getelementptr i8* %127, i64 %147
  %148 = add i32 %files_buflen.0, -1
  %149 = zext i32 %148 to i64
  %150 = shl nuw nsw i64 %149, 3
  %151 = add i64 %150, 8
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %151, i32 8, i1 false)
  br label %.loopexit.thread

.loopexit.thread:                                 ; preds = %.thread48, %.thread48.thread, %.lr.ph59, %.loopexit
  %152 = phi %struct._IO_FILE** [ %128, %.lr.ph59 ], [ %128, %.loopexit ], [ %114, %.thread48.thread ], [ %128, %.thread48 ]
  %153 = shl nsw i32 %files_buflen.0, 1
  br label %154

; <label>:154                                     ; preds = %.loopexit.thread, %122
  %position.1 = phi i32 [ %files_buflen.0, %.loopexit.thread ], [ %i.054, %122 ]
  %files_buflen.1 = phi i32 [ %153, %.loopexit.thread ], [ %files_buflen.0, %122 ]
  %files.1 = phi %struct._IO_FILE** [ %152, %.loopexit.thread ], [ %files.0, %122 ]
  %155 = sext i32 %position.1 to i64
  %156 = getelementptr inbounds %struct._IO_FILE** %files.1, i64 %155
  store %struct._IO_FILE* %108, %struct._IO_FILE** %156, align 8, !tbaa !1
  br label %.critedge

; <label>:157                                     ; preds = %79
  %158 = getelementptr inbounds %struct.VExp* %51, i64 0, i32 3, i32 0, i32 2
  %159 = bitcast %union.SyscallArg* %158 to i32*
  %160 = load i32* %159, align 4, !tbaa !26
  %161 = icmp sgt i32 %160, -1
  %162 = icmp slt i32 %160, %files_buflen.0
  %or.cond = and i1 %161, %162
  br i1 %or.cond, label %163, label %.critedge

; <label>:163                                     ; preds = %157
  %164 = sext i32 %160 to i64
  %165 = getelementptr inbounds %struct._IO_FILE** %files.0, i64 %164
  %166 = load %struct._IO_FILE** %165, align 8, !tbaa !1
  %167 = icmp eq %struct._IO_FILE* %166, null
  br i1 %167, label %.critedge, label %168

; <label>:168                                     ; preds = %163
  %169 = tail call i32 @fgetc(%struct._IO_FILE* %166) #7
  br label %.critedge

; <label>:170                                     ; preds = %79
  %171 = getelementptr inbounds %struct.VExp* %51, i64 0, i32 3, i32 0, i32 2
  %172 = bitcast %union.SyscallArg* %171 to i32*
  %173 = load i32* %172, align 4, !tbaa !26
  %174 = icmp sgt i32 %173, -1
  %175 = icmp slt i32 %173, %files_buflen.0
  %or.cond8 = and i1 %174, %175
  br i1 %or.cond8, label %176, label %.critedge

; <label>:176                                     ; preds = %170
  %177 = sext i32 %173 to i64
  %178 = getelementptr inbounds %struct._IO_FILE** %files.0, i64 %177
  %179 = load %struct._IO_FILE** %178, align 8, !tbaa !1
  %180 = icmp eq %struct._IO_FILE* %179, null
  br i1 %180, label %.critedge, label %181

; <label>:181                                     ; preds = %176
  %182 = getelementptr inbounds %struct.VExp* %51, i64 0, i32 3, i32 0, i32 3
  %183 = load i32* %182, align 4, !tbaa !41
  %184 = tail call i32 @fputc(i32 %183, %struct._IO_FILE* %179) #7
  %185 = icmp eq i32 %184, -1
  %. = zext i1 %185 to i32
  br label %.critedge

; <label>:186                                     ; preds = %79
  %187 = getelementptr inbounds %struct.VExp* %51, i64 0, i32 3, i32 0, i32 2
  %188 = bitcast %union.SyscallArg* %187 to i32*
  %189 = load i32* %188, align 4, !tbaa !26
  %190 = icmp sgt i32 %189, -1
  %191 = icmp slt i32 %189, %files_buflen.0
  %or.cond9 = and i1 %190, %191
  br i1 %or.cond9, label %192, label %.critedge

; <label>:192                                     ; preds = %186
  %193 = sext i32 %189 to i64
  %194 = getelementptr inbounds %struct._IO_FILE** %files.0, i64 %193
  %195 = load %struct._IO_FILE** %194, align 8, !tbaa !1
  %196 = icmp eq %struct._IO_FILE* %195, null
  br i1 %196, label %.critedge, label %197

; <label>:197                                     ; preds = %192
  %198 = tail call i32 @fgetc(%struct._IO_FILE* %195) #7
  %199 = icmp eq i32 %198, -1
  br i1 %199, label %.critedge, label %200

; <label>:200                                     ; preds = %197
  %201 = tail call i32 @ungetc(i32 %198, %struct._IO_FILE* %195) #7
  br label %.critedge

; <label>:202                                     ; preds = %79
  %203 = icmp slt i32 %cur_argi.0, %argc
  br i1 %203, label %204, label %.critedge

; <label>:204                                     ; preds = %202
  %205 = load i8* %cur_arg.1, align 1, !tbaa !10
  %206 = icmp eq i8 %205, 0
  br i1 %206, label %210, label %207

; <label>:207                                     ; preds = %204
  %208 = sext i8 %205 to i32
  %209 = getelementptr inbounds i8* %cur_arg.1, i64 1
  br label %.critedge

; <label>:210                                     ; preds = %204
  %211 = add nsw i32 %cur_argi.0, 1
  %212 = icmp slt i32 %211, %argc
  br i1 %212, label %213, label %.critedge

; <label>:213                                     ; preds = %210
  %214 = sext i32 %211 to i64
  %215 = getelementptr inbounds i8** %args, i64 %214
  %216 = load i8** %215, align 8, !tbaa !1
  br label %.critedge

; <label>:217                                     ; preds = %79
  %218 = getelementptr inbounds %struct.VExp* %51, i64 0, i32 3, i32 0, i32 2
  %219 = bitcast %union.SyscallArg* %218 to i32*
  %220 = load i32* %219, align 4, !tbaa !26
  %221 = icmp sgt i32 %220, -1
  %222 = icmp slt i32 %220, %files_buflen.0
  %or.cond10 = and i1 %221, %222
  br i1 %or.cond10, label %223, label %.critedge

; <label>:223                                     ; preds = %217
  %224 = sext i32 %220 to i64
  %225 = getelementptr inbounds %struct._IO_FILE** %files.0, i64 %224
  %226 = load %struct._IO_FILE** %225, align 8, !tbaa !1
  %227 = icmp eq %struct._IO_FILE* %226, null
  br i1 %227, label %.critedge, label %228

; <label>:228                                     ; preds = %223
  %229 = tail call i32 @fclose(%struct._IO_FILE* %226) #7
  store %struct._IO_FILE* null, %struct._IO_FILE** %225, align 8, !tbaa !1
  br label %.critedge

; <label>:230                                     ; preds = %79
  %231 = getelementptr inbounds %struct.VExp* %51, i64 0, i32 3, i32 0, i32 2, i32 0
  %232 = load %struct.IntList** %231, align 8, !tbaa !1
  %233 = icmp eq %struct.IntList* %232, null
  br i1 %233, label %.thread.i12, label %.lr.ph7.i16

.thread.i12:                                      ; preds = %230
  %234 = tail call noalias i8* @malloc(i64 1) #7
  br label %convertIntListToString.exit26

.lr.ph7.i16:                                      ; preds = %230, %.lr.ph7.i16
  %l.05.i13 = phi i32 [ %phitmp.i15, %.lr.ph7.i16 ], [ 1, %230 ]
  %p.04.i14 = phi %struct.IntList* [ %236, %.lr.ph7.i16 ], [ %232, %230 ]
  %235 = getelementptr inbounds %struct.IntList* %p.04.i14, i64 0, i32 1
  %236 = load %struct.IntList** %235, align 8, !tbaa !5
  %phitmp.i15 = add i32 %l.05.i13, 1
  %237 = icmp eq %struct.IntList* %236, null
  br i1 %237, label %.lr.ph.i22.preheader, label %.lr.ph7.i16

.lr.ph.i22.preheader:                             ; preds = %.lr.ph7.i16
  %phitmp10.i17 = sext i32 %phitmp.i15 to i64
  %238 = tail call noalias i8* @malloc(i64 %phitmp10.i17) #7
  br label %.lr.ph.i22

.lr.ph.i22:                                       ; preds = %.lr.ph.i22.preheader, %.lr.ph.i22
  %indvars.iv.i18 = phi i64 [ %indvars.iv.next.i21, %.lr.ph.i22 ], [ 0, %.lr.ph.i22.preheader ]
  %p1.03.i19 = phi %struct.IntList* [ %245, %.lr.ph.i22 ], [ %232, %.lr.ph.i22.preheader ]
  %i.02.i20 = phi i32 [ %243, %.lr.ph.i22 ], [ 0, %.lr.ph.i22.preheader ]
  %239 = getelementptr inbounds %struct.IntList* %p1.03.i19, i64 0, i32 0
  %240 = load i32* %239, align 4, !tbaa !9
  %241 = trunc i32 %240 to i8
  %242 = getelementptr inbounds i8* %238, i64 %indvars.iv.i18
  store i8 %241, i8* %242, align 1, !tbaa !10
  %indvars.iv.next.i21 = add nuw nsw i64 %indvars.iv.i18, 1
  %243 = add nsw i32 %i.02.i20, 1
  %244 = getelementptr inbounds %struct.IntList* %p1.03.i19, i64 0, i32 1
  %245 = load %struct.IntList** %244, align 8, !tbaa !5
  %246 = icmp eq %struct.IntList* %245, null
  br i1 %246, label %._crit_edge.i24, label %.lr.ph.i22

._crit_edge.i24:                                  ; preds = %.lr.ph.i22
  %phitmp11.i23 = sext i32 %243 to i64
  br label %convertIntListToString.exit26

convertIntListToString.exit26:                    ; preds = %.thread.i12, %._crit_edge.i24
  %247 = phi i8* [ %238, %._crit_edge.i24 ], [ %234, %.thread.i12 ]
  %i.0.lcssa.i25 = phi i64 [ %phitmp11.i23, %._crit_edge.i24 ], [ 0, %.thread.i12 ]
  %248 = getelementptr inbounds i8* %247, i64 %i.0.lcssa.i25
  store i8 0, i8* %248, align 1, !tbaa !10
  %249 = tail call i32 @system(i8* %247) #7
  tail call void @free(i8* %247) #7
  br label %.critedge

.critedge:                                        ; preds = %84, %79, %223, %217, %202, %192, %186, %181, %176, %170, %163, %157, %convertIntListToString.exit, %197, %154, %213, %210, %207, %convertIntListToString.exit26, %228, %200, %168
  %resultcode.1 = phi i32 [ %position.1, %154 ], [ %169, %168 ], [ %198, %200 ], [ -1, %197 ], [ %208, %207 ], [ 0, %213 ], [ 0, %210 ], [ %229, %228 ], [ %249, %convertIntListToString.exit26 ], [ -1, %convertIntListToString.exit ], [ -2, %157 ], [ -2, %163 ], [ -2, %170 ], [ -2, %176 ], [ %., %181 ], [ -2, %186 ], [ -2, %192 ], [ -1, %202 ], [ -2, %217 ], [ -2, %223 ], [ 0, %79 ], [ -2, %84 ]
  %files_buflen.2 = phi i32 [ %files_buflen.1, %154 ], [ %files_buflen.0, %168 ], [ %files_buflen.0, %200 ], [ %files_buflen.0, %197 ], [ %files_buflen.0, %207 ], [ %files_buflen.0, %213 ], [ %files_buflen.0, %210 ], [ %files_buflen.0, %228 ], [ %files_buflen.0, %convertIntListToString.exit26 ], [ %files_buflen.0, %convertIntListToString.exit ], [ %files_buflen.0, %157 ], [ %files_buflen.0, %163 ], [ %files_buflen.0, %170 ], [ %files_buflen.0, %176 ], [ %files_buflen.0, %181 ], [ %files_buflen.0, %186 ], [ %files_buflen.0, %192 ], [ %files_buflen.0, %202 ], [ %files_buflen.0, %217 ], [ %files_buflen.0, %223 ], [ %files_buflen.0, %79 ], [ %files_buflen.0, %84 ]
  %files.2 = phi %struct._IO_FILE** [ %files.1, %154 ], [ %files.0, %168 ], [ %files.0, %200 ], [ %files.0, %197 ], [ %files.0, %207 ], [ %files.0, %213 ], [ %files.0, %210 ], [ %files.0, %228 ], [ %files.0, %convertIntListToString.exit26 ], [ %files.0, %convertIntListToString.exit ], [ %files.0, %157 ], [ %files.0, %163 ], [ %files.0, %170 ], [ %files.0, %176 ], [ %files.0, %181 ], [ %files.0, %186 ], [ %files.0, %192 ], [ %files.0, %202 ], [ %files.0, %217 ], [ %files.0, %223 ], [ %files.0, %79 ], [ %files.0, %84 ]
  %cur_arg.2 = phi i8* [ %cur_arg.1, %154 ], [ %cur_arg.1, %168 ], [ %cur_arg.1, %200 ], [ %cur_arg.1, %197 ], [ %209, %207 ], [ %216, %213 ], [ %cur_arg.1, %210 ], [ %cur_arg.1, %228 ], [ %cur_arg.1, %convertIntListToString.exit26 ], [ %cur_arg.1, %convertIntListToString.exit ], [ %cur_arg.1, %157 ], [ %cur_arg.1, %163 ], [ %cur_arg.1, %170 ], [ %cur_arg.1, %176 ], [ %cur_arg.1, %181 ], [ %cur_arg.1, %186 ], [ %cur_arg.1, %192 ], [ %cur_arg.1, %202 ], [ %cur_arg.1, %217 ], [ %cur_arg.1, %223 ], [ %cur_arg.1, %79 ], [ %cur_arg.1, %84 ]
  %cur_argi.1 = phi i32 [ %cur_argi.0, %154 ], [ %cur_argi.0, %168 ], [ %cur_argi.0, %200 ], [ %cur_argi.0, %197 ], [ %cur_argi.0, %207 ], [ %211, %213 ], [ %211, %210 ], [ %cur_argi.0, %228 ], [ %cur_argi.0, %convertIntListToString.exit26 ], [ %cur_argi.0, %convertIntListToString.exit ], [ %cur_argi.0, %157 ], [ %cur_argi.0, %163 ], [ %cur_argi.0, %170 ], [ %cur_argi.0, %176 ], [ %cur_argi.0, %181 ], [ %cur_argi.0, %186 ], [ %cur_argi.0, %192 ], [ %cur_argi.0, %202 ], [ %cur_argi.0, %217 ], [ %cur_argi.0, %223 ], [ %cur_argi.0, %79 ], [ %cur_argi.0, %84 ]
  %250 = load %struct.VExp** %50, align 8, !tbaa !18
  %251 = getelementptr inbounds %struct.VExp* %250, i64 0, i32 3, i32 0, i32 4
  %252 = load %struct.Value** %251, align 8, !tbaa !27
  %253 = tail call noalias i8* @malloc(i64 16) #7
  %254 = bitcast i8* %253 to %struct.Value**
  store %struct.Value* %252, %struct.Value** %254, align 8, !tbaa !47
  %255 = getelementptr inbounds i8* %253, i64 8
  %256 = bitcast i8* %255 to %struct.ValueStack**
  store %struct.ValueStack* null, %struct.ValueStack** %256, align 8, !tbaa !49
  %257 = icmp eq i8* %253, null
  br i1 %257, label %resolveAllValue.exit34, label %.lr.ph.lr.ph.i27

.lr.ph.lr.ph.i27:                                 ; preds = %.critedge
  %258 = bitcast i8* %253 to %struct.ValueStack*
  br label %.lr.ph.i29

.lr.ph.i29:                                       ; preds = %.outer.backedge.i33, %.lr.ph.lr.ph.i27
  %head.0.ph1.i28 = phi %struct.ValueStack* [ %258, %.lr.ph.lr.ph.i27 ], [ %head.0.ph.be.i32, %.outer.backedge.i33 ]
  %259 = getelementptr inbounds %struct.ValueStack* %head.0.ph1.i28, i64 0, i32 0
  %260 = load %struct.Value** %259, align 8, !tbaa !47
  %261 = getelementptr inbounds %struct.Value* %260, i64 0, i32 0
  %262 = load i32* %261, align 4, !tbaa !30
  %switch.i3061 = icmp ult i32 %262, 2
  br i1 %switch.i3061, label %.backedge.i31._crit_edge, label %.lr.ph62

.lr.ph62:                                         ; preds = %.lr.ph.i29, %.backedge.i31.backedge
  %263 = phi %struct.Value* [ %266, %.backedge.i31.backedge ], [ %260, %.lr.ph.i29 ]
  %264 = tail call %struct.Value* @resolveValue(%struct.Value* %263) #7
  %265 = icmp eq %struct.Value* %264, null
  %.pre = load %struct.Value** %259, align 8, !tbaa !47
  br i1 %265, label %.backedge.i31.backedge, label %269

.backedge.i31.backedge:                           ; preds = %.lr.ph62, %269
  %266 = phi %struct.Value* [ %264, %269 ], [ %.pre, %.lr.ph62 ]
  %267 = getelementptr inbounds %struct.Value* %266, i64 0, i32 0
  %268 = load i32* %267, align 4, !tbaa !30
  %switch.i30 = icmp ult i32 %268, 2
  br i1 %switch.i30, label %.backedge.i31._crit_edge, label %.lr.ph62

; <label>:269                                     ; preds = %.lr.ph62
  %270 = icmp eq %struct.Value* %264, %.pre
  br i1 %270, label %.backedge.i31.backedge, label %271

; <label>:271                                     ; preds = %269
  %272 = tail call noalias i8* @malloc(i64 16) #7
  %273 = bitcast i8* %272 to %struct.ValueStack*
  %274 = bitcast i8* %272 to %struct.Value**
  store %struct.Value* %264, %struct.Value** %274, align 8, !tbaa !47
  %275 = getelementptr inbounds i8* %272, i64 8
  %276 = bitcast i8* %275 to %struct.ValueStack**
  store %struct.ValueStack* %head.0.ph1.i28, %struct.ValueStack** %276, align 8, !tbaa !49
  br label %.outer.backedge.i33

.outer.backedge.i33:                              ; preds = %.backedge.i31._crit_edge, %271
  %head.0.ph.be.i32 = phi %struct.ValueStack* [ %273, %271 ], [ %279, %.backedge.i31._crit_edge ]
  %277 = icmp eq %struct.ValueStack* %head.0.ph.be.i32, null
  br i1 %277, label %resolveAllValue.exit34, label %.lr.ph.i29

.backedge.i31._crit_edge:                         ; preds = %.backedge.i31.backedge, %.lr.ph.i29
  %278 = getelementptr inbounds %struct.ValueStack* %head.0.ph1.i28, i64 0, i32 1
  %279 = load %struct.ValueStack** %278, align 8, !tbaa !49
  br label %.outer.backedge.i33

resolveAllValue.exit34:                           ; preds = %.outer.backedge.i33, %.critedge
  %280 = getelementptr inbounds %struct.Value* %252, i64 0, i32 0
  %281 = load i32* %280, align 4, !tbaa !30
  %282 = icmp eq i32 %281, 1
  br i1 %282, label %.backedge, label %283

; <label>:283                                     ; preds = %resolveAllValue.exit34
  %284 = load %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %285 = icmp eq %struct.Value* %284, null
  br i1 %285, label %286, label %newValue.exit

; <label>:286                                     ; preds = %283
  %287 = tail call noalias i8* @malloc(i64 40000) #7
  %288 = bitcast i8* %287 to %struct.Value*
  br label %289

; <label>:289                                     ; preds = %289, %286
  %indvars.iv.i.i = phi i64 [ 0, %286 ], [ %indvars.iv.next.i.i, %289 ]
  %290 = phi %struct.Value* [ null, %286 ], [ %291, %289 ]
  %291 = getelementptr inbounds %struct.Value* %288, i64 %indvars.iv.i.i
  %292 = getelementptr inbounds %struct.Value* %288, i64 %indvars.iv.i.i, i32 1, i32 0, i32 0
  %.c.i.i = bitcast %struct.Value* %290 to %struct.VExp*
  store %struct.VExp* %.c.i.i, %struct.VExp** %292, align 8, !tbaa !1
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %exitcond.i.i = icmp eq i64 %indvars.iv.next.i.i, 1000
  br i1 %exitcond.i.i, label %.loopexit.i.i, label %289

.loopexit.i.i:                                    ; preds = %289
  %scevgep.i.i = getelementptr i8* %287, i64 39960
  %scevgep4.i.i = bitcast i8* %scevgep.i.i to %struct.Value*
  store %struct.Value* %scevgep4.i.i, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  br label %newValue.exit

newValue.exit:                                    ; preds = %283, %.loopexit.i.i
  %293 = phi %struct.Value* [ %scevgep4.i.i, %.loopexit.i.i ], [ %284, %283 ]
  %294 = getelementptr inbounds %struct.Value* %293, i64 0, i32 2
  store i32 1, i32* %294, align 4, !tbaa !28
  %295 = getelementptr inbounds %struct.Value* %293, i64 0, i32 1
  %296 = bitcast %union.anon.0* %295 to %struct.Value**
  %297 = load %struct.Value** %296, align 8, !tbaa !1
  store %struct.Value* %297, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %298 = getelementptr inbounds %struct.Value* %293, i64 0, i32 0
  store i32 0, i32* %298, align 4, !tbaa !30
  %299 = zext i32 %resultcode.1 to i64
  %300 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %301 = icmp eq %struct.VExp* %300, null
  br i1 %301, label %302, label %newVExpNum.exit

; <label>:302                                     ; preds = %newValue.exit
  %303 = tail call noalias i8* @malloc(i64 56000) #7
  %304 = bitcast i8* %303 to %struct.VExp*
  br label %305

; <label>:305                                     ; preds = %305, %302
  %indvars.iv.i.i35 = phi i64 [ 0, %302 ], [ %indvars.iv.next.i.i36, %305 ]
  %306 = phi %struct.VExp* [ null, %302 ], [ %307, %305 ]
  %307 = getelementptr inbounds %struct.VExp* %304, i64 %indvars.iv.i.i35
  %308 = getelementptr inbounds %struct.VExp* %304, i64 %indvars.iv.i.i35, i32 3
  %309 = bitcast %union.anon.1* %308 to %struct.VExp**
  store %struct.VExp* %306, %struct.VExp** %309, align 8, !tbaa !1
  %indvars.iv.next.i.i36 = add nuw nsw i64 %indvars.iv.i.i35, 1
  %exitcond.i.i37 = icmp eq i64 %indvars.iv.next.i.i36, 1000
  br i1 %exitcond.i.i37, label %.loopexit.i.i39, label %305

.loopexit.i.i39:                                  ; preds = %305
  %scevgep.i.i38 = getelementptr i8* %303, i64 55944
  %scevgep3.i.i = bitcast i8* %scevgep.i.i38 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNum.exit

newVExpNum.exit:                                  ; preds = %newValue.exit, %.loopexit.i.i39
  %310 = phi %struct.VExp* [ %scevgep3.i.i, %.loopexit.i.i39 ], [ %300, %newValue.exit ]
  %311 = getelementptr inbounds %struct.VExp* %310, i64 0, i32 4
  store i32 1, i32* %311, align 4, !tbaa !17
  %312 = getelementptr inbounds %struct.VExp* %310, i64 0, i32 3
  %313 = bitcast %union.anon.1* %312 to %struct.VExp**
  %314 = load %struct.VExp** %313, align 8, !tbaa !1
  store %struct.VExp* %314, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %315 = getelementptr inbounds %struct.VExp* %310, i64 0, i32 0
  store i32 0, i32* %315, align 4, !tbaa !15
  %316 = getelementptr inbounds %struct.VExp* %310, i64 0, i32 3, i32 0, i32 0
  store i32 0, i32* %316, align 8
  %317 = getelementptr inbounds %struct.VExp* %310, i64 0, i32 3, i32 0, i32 2, i32 0
  %num_val.coerce1.c.i = inttoptr i64 %299 to %struct.IntList*
  store %struct.IntList* %num_val.coerce1.c.i, %struct.IntList** %317, align 8
  %318 = getelementptr inbounds %struct.Value* %293, i64 0, i32 1, i32 0, i32 0
  store %struct.VExp* %310, %struct.VExp** %318, align 8, !tbaa !18
  %319 = getelementptr inbounds %struct.Value* %293, i64 0, i32 1, i32 0, i32 1
  store %struct.VContext* null, %struct.VContext** %319, align 8, !tbaa !20
  %320 = tail call noalias i8* @malloc(i64 32) #7
  %321 = bitcast i8* %320 to %struct.Continuation*
  %322 = bitcast i8* %320 to i32*
  store i32 1, i32* %322, align 4, !tbaa !42
  %323 = getelementptr inbounds i8* %320, i64 8
  %324 = bitcast i8* %323 to %struct.VExp**
  %.c = bitcast %struct.Value* %293 to %struct.VExp*
  store %struct.VExp* %.c, %struct.VExp** %324, align 8, !tbaa !21
  %325 = getelementptr inbounds i8* %320, i64 24
  %326 = bitcast i8* %325 to %struct.Continuation**
  store %struct.Continuation* null, %struct.Continuation** %326, align 8, !tbaa !44
  %327 = load %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %328 = icmp eq %struct.Value* %327, null
  br i1 %328, label %329, label %newValue.exit47

; <label>:329                                     ; preds = %newVExpNum.exit
  %330 = tail call noalias i8* @malloc(i64 40000) #7
  %331 = bitcast i8* %330 to %struct.Value*
  br label %332

; <label>:332                                     ; preds = %332, %329
  %indvars.iv.i.i40 = phi i64 [ 0, %329 ], [ %indvars.iv.next.i.i42, %332 ]
  %333 = phi %struct.Value* [ null, %329 ], [ %334, %332 ]
  %334 = getelementptr inbounds %struct.Value* %331, i64 %indvars.iv.i.i40
  %335 = getelementptr inbounds %struct.Value* %331, i64 %indvars.iv.i.i40, i32 1, i32 0, i32 0
  %.c.i.i41 = bitcast %struct.Value* %333 to %struct.VExp*
  store %struct.VExp* %.c.i.i41, %struct.VExp** %335, align 8, !tbaa !1
  %indvars.iv.next.i.i42 = add nuw nsw i64 %indvars.iv.i.i40, 1
  %exitcond.i.i43 = icmp eq i64 %indvars.iv.next.i.i42, 1000
  br i1 %exitcond.i.i43, label %.loopexit.i.i46, label %332

.loopexit.i.i46:                                  ; preds = %332
  %scevgep.i.i44 = getelementptr i8* %330, i64 39960
  %scevgep4.i.i45 = bitcast i8* %scevgep.i.i44 to %struct.Value*
  store %struct.Value* %scevgep4.i.i45, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  br label %newValue.exit47

newValue.exit47:                                  ; preds = %newVExpNum.exit, %.loopexit.i.i46
  %336 = phi %struct.Value* [ %scevgep4.i.i45, %.loopexit.i.i46 ], [ %327, %newVExpNum.exit ]
  %337 = getelementptr inbounds %struct.Value* %336, i64 0, i32 2
  store i32 1, i32* %337, align 4, !tbaa !28
  %338 = getelementptr inbounds %struct.Value* %336, i64 0, i32 1
  %339 = bitcast %union.anon.0* %338 to %struct.Value**
  %340 = load %struct.Value** %339, align 8, !tbaa !1
  store %struct.Value* %340, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %341 = getelementptr inbounds %struct.Value* %336, i64 0, i32 0
  store i32 2, i32* %341, align 4, !tbaa !30
  %342 = getelementptr inbounds %struct.Value* %252, i64 0, i32 1, i32 0, i32 0
  %343 = load %struct.VExp** %342, align 8, !tbaa !18
  %344 = getelementptr inbounds %struct.Value* %336, i64 0, i32 1, i32 0, i32 0
  store %struct.VExp* %343, %struct.VExp** %344, align 8, !tbaa !31
  %345 = getelementptr inbounds %struct.Value* %252, i64 0, i32 1, i32 0, i32 1
  %346 = load %struct.VContext** %345, align 8, !tbaa !20
  %347 = getelementptr inbounds %struct.Value* %336, i64 0, i32 1, i32 0, i32 1
  store %struct.VContext* %346, %struct.VContext** %347, align 8, !tbaa !33
  %348 = getelementptr inbounds %struct.Value* %336, i64 0, i32 1, i32 0, i32 2
  store %struct.Continuation* %321, %struct.Continuation** %348, align 8, !tbaa !34
  br label %.backedge

displayExp.exit:                                  ; preds = %67, %65, %61, %80, %78, %45
  %exitcode.0 = phi i32 [ 1, %45 ], [ 1, %78 ], [ %83, %80 ], [ 0, %61 ], [ 0, %65 ], [ 0, %67 ]
  %349 = bitcast %struct._IO_FILE** %files.0 to i8*
  tail call void @free(i8* %349) #7
  ret i32 %exitcode.0
}

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) #2

; Function Attrs: nounwind
declare noalias i8* @realloc(i8* nocapture, i64) #2

; Function Attrs: nounwind
declare i32 @fgetc(%struct._IO_FILE* nocapture) #2

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #2

; Function Attrs: nounwind
declare i32 @ungetc(i32, %struct._IO_FILE* nocapture) #2

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) #2

declare i32 @system(i8* nocapture readonly) #5

; Function Attrs: nounwind uwtable
define %struct.VExp* @makeApply(%struct.VExp* %f, %struct.VExp* %x) #1 {
  %1 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %2 = icmp eq %struct.VExp* %1, null
  br i1 %2, label %3, label %newVExpApply.exit

; <label>:3                                       ; preds = %0
  %4 = tail call noalias i8* @malloc(i64 56000) #7
  %5 = bitcast i8* %4 to %struct.VExp*
  br label %6

; <label>:6                                       ; preds = %6, %3
  %indvars.iv.i.i = phi i64 [ 0, %3 ], [ %indvars.iv.next.i.i, %6 ]
  %7 = phi %struct.VExp* [ null, %3 ], [ %8, %6 ]
  %8 = getelementptr inbounds %struct.VExp* %5, i64 %indvars.iv.i.i
  %9 = getelementptr inbounds %struct.VExp* %5, i64 %indvars.iv.i.i, i32 3
  %10 = bitcast %union.anon.1* %9 to %struct.VExp**
  store %struct.VExp* %7, %struct.VExp** %10, align 8, !tbaa !1
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %exitcond.i.i = icmp eq i64 %indvars.iv.next.i.i, 1000
  br i1 %exitcond.i.i, label %.loopexit.i.i, label %6

.loopexit.i.i:                                    ; preds = %6
  %scevgep.i.i = getelementptr i8* %4, i64 55944
  %scevgep3.i.i = bitcast i8* %scevgep.i.i to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpApply.exit

newVExpApply.exit:                                ; preds = %0, %.loopexit.i.i
  %11 = phi %struct.VExp* [ %scevgep3.i.i, %.loopexit.i.i ], [ %1, %0 ]
  %12 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 4
  store i32 1, i32* %12, align 4, !tbaa !17
  %13 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3
  %14 = bitcast %union.anon.1* %13 to %struct.VExp**
  %15 = load %struct.VExp** %14, align 8, !tbaa !1
  store %struct.VExp* %15, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %16 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 0
  store i32 8, i32* %16, align 4, !tbaa !15
  store %struct.VExp* %f, %struct.VExp** %14, align 8, !tbaa !18
  %17 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3, i32 0, i32 2, i32 0
  %ap_x.c.i = bitcast %struct.VExp* %x to %struct.IntList*
  store %struct.IntList* %ap_x.c.i, %struct.IntList** %17, align 8, !tbaa !20
  ret %struct.VExp* %11
}

; Function Attrs: nounwind uwtable
define %struct.VExp* @makeInt(i32 %a) #1 {
  %1 = zext i32 %a to i64
  %2 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %3 = icmp eq %struct.VExp* %2, null
  br i1 %3, label %4, label %newVExpNum.exit

; <label>:4                                       ; preds = %0
  %5 = tail call noalias i8* @malloc(i64 56000) #7
  %6 = bitcast i8* %5 to %struct.VExp*
  br label %7

; <label>:7                                       ; preds = %7, %4
  %indvars.iv.i.i = phi i64 [ 0, %4 ], [ %indvars.iv.next.i.i, %7 ]
  %8 = phi %struct.VExp* [ null, %4 ], [ %9, %7 ]
  %9 = getelementptr inbounds %struct.VExp* %6, i64 %indvars.iv.i.i
  %10 = getelementptr inbounds %struct.VExp* %6, i64 %indvars.iv.i.i, i32 3
  %11 = bitcast %union.anon.1* %10 to %struct.VExp**
  store %struct.VExp* %8, %struct.VExp** %11, align 8, !tbaa !1
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %exitcond.i.i = icmp eq i64 %indvars.iv.next.i.i, 1000
  br i1 %exitcond.i.i, label %.loopexit.i.i, label %7

.loopexit.i.i:                                    ; preds = %7
  %scevgep.i.i = getelementptr i8* %5, i64 55944
  %scevgep3.i.i = bitcast i8* %scevgep.i.i to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNum.exit

newVExpNum.exit:                                  ; preds = %0, %.loopexit.i.i
  %12 = phi %struct.VExp* [ %scevgep3.i.i, %.loopexit.i.i ], [ %2, %0 ]
  %13 = getelementptr inbounds %struct.VExp* %12, i64 0, i32 4
  store i32 1, i32* %13, align 4, !tbaa !17
  %14 = getelementptr inbounds %struct.VExp* %12, i64 0, i32 3
  %15 = bitcast %union.anon.1* %14 to %struct.VExp**
  %16 = load %struct.VExp** %15, align 8, !tbaa !1
  store %struct.VExp* %16, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %17 = getelementptr inbounds %struct.VExp* %12, i64 0, i32 0
  store i32 0, i32* %17, align 4, !tbaa !15
  %18 = getelementptr inbounds %struct.VExp* %12, i64 0, i32 3, i32 0, i32 0
  store i32 0, i32* %18, align 8
  %19 = getelementptr inbounds %struct.VExp* %12, i64 0, i32 3, i32 0, i32 2, i32 0
  %num_val.coerce1.c.i = inttoptr i64 %1 to %struct.IntList*
  store %struct.IntList* %num_val.coerce1.c.i, %struct.IntList** %19, align 8
  ret %struct.VExp* %12
}

; Function Attrs: nounwind uwtable
define %struct.VExp* @makeDouble(double %a) #1 {
  %1 = bitcast double %a to i64
  %2 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %3 = icmp eq %struct.VExp* %2, null
  br i1 %3, label %4, label %newVExpNum.exit

; <label>:4                                       ; preds = %0
  %5 = tail call noalias i8* @malloc(i64 56000) #7
  %6 = bitcast i8* %5 to %struct.VExp*
  br label %7

; <label>:7                                       ; preds = %7, %4
  %indvars.iv.i.i = phi i64 [ 0, %4 ], [ %indvars.iv.next.i.i, %7 ]
  %8 = phi %struct.VExp* [ null, %4 ], [ %9, %7 ]
  %9 = getelementptr inbounds %struct.VExp* %6, i64 %indvars.iv.i.i
  %10 = getelementptr inbounds %struct.VExp* %6, i64 %indvars.iv.i.i, i32 3
  %11 = bitcast %union.anon.1* %10 to %struct.VExp**
  store %struct.VExp* %8, %struct.VExp** %11, align 8, !tbaa !1
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %exitcond.i.i = icmp eq i64 %indvars.iv.next.i.i, 1000
  br i1 %exitcond.i.i, label %.loopexit.i.i, label %7

.loopexit.i.i:                                    ; preds = %7
  %scevgep.i.i = getelementptr i8* %5, i64 55944
  %scevgep3.i.i = bitcast i8* %scevgep.i.i to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNum.exit

newVExpNum.exit:                                  ; preds = %0, %.loopexit.i.i
  %12 = phi %struct.VExp* [ %scevgep3.i.i, %.loopexit.i.i ], [ %2, %0 ]
  %13 = getelementptr inbounds %struct.VExp* %12, i64 0, i32 4
  store i32 1, i32* %13, align 4, !tbaa !17
  %14 = getelementptr inbounds %struct.VExp* %12, i64 0, i32 3
  %15 = bitcast %union.anon.1* %14 to %struct.VExp**
  %16 = load %struct.VExp** %15, align 8, !tbaa !1
  store %struct.VExp* %16, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %17 = getelementptr inbounds %struct.VExp* %12, i64 0, i32 0
  store i32 0, i32* %17, align 4, !tbaa !15
  %18 = getelementptr inbounds %struct.VExp* %12, i64 0, i32 3, i32 0, i32 0
  store i32 1, i32* %18, align 8
  %19 = getelementptr inbounds %struct.VExp* %12, i64 0, i32 3, i32 0, i32 2, i32 0
  %num_val.coerce1.c.i = inttoptr i64 %1 to %struct.IntList*
  store %struct.IntList* %num_val.coerce1.c.i, %struct.IntList** %19, align 8
  ret %struct.VExp* %12
}

; Function Attrs: nounwind uwtable
define %struct.VExp* @makeAbs(%struct.VExp* %abs_val) #1 {
  %1 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %2 = icmp eq %struct.VExp* %1, null
  br i1 %2, label %3, label %newVExpAbs.exit

; <label>:3                                       ; preds = %0
  %4 = tail call noalias i8* @malloc(i64 56000) #7
  %5 = bitcast i8* %4 to %struct.VExp*
  br label %6

; <label>:6                                       ; preds = %6, %3
  %indvars.iv.i.i = phi i64 [ 0, %3 ], [ %indvars.iv.next.i.i, %6 ]
  %7 = phi %struct.VExp* [ null, %3 ], [ %8, %6 ]
  %8 = getelementptr inbounds %struct.VExp* %5, i64 %indvars.iv.i.i
  %9 = getelementptr inbounds %struct.VExp* %5, i64 %indvars.iv.i.i, i32 3
  %10 = bitcast %union.anon.1* %9 to %struct.VExp**
  store %struct.VExp* %7, %struct.VExp** %10, align 8, !tbaa !1
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %exitcond.i.i = icmp eq i64 %indvars.iv.next.i.i, 1000
  br i1 %exitcond.i.i, label %.loopexit.i.i, label %6

.loopexit.i.i:                                    ; preds = %6
  %scevgep.i.i = getelementptr i8* %4, i64 55944
  %scevgep3.i.i = bitcast i8* %scevgep.i.i to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpAbs.exit

newVExpAbs.exit:                                  ; preds = %0, %.loopexit.i.i
  %11 = phi %struct.VExp* [ %scevgep3.i.i, %.loopexit.i.i ], [ %1, %0 ]
  %12 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 4
  store i32 1, i32* %12, align 4, !tbaa !17
  %13 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3
  %14 = bitcast %union.anon.1* %13 to %struct.VExp**
  %15 = load %struct.VExp** %14, align 8, !tbaa !1
  store %struct.VExp* %15, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %16 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 0
  store i32 1, i32* %16, align 4, !tbaa !15
  store %struct.VExp* %abs_val, %struct.VExp** %14, align 8, !tbaa !1
  ret %struct.VExp* %11
}

; Function Attrs: nounwind uwtable
define %struct.VExp* @makeRef(i32 %ref_val) #1 {
  %1 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %2 = icmp eq %struct.VExp* %1, null
  br i1 %2, label %3, label %newVExpRef.exit

; <label>:3                                       ; preds = %0
  %4 = tail call noalias i8* @malloc(i64 56000) #7
  %5 = bitcast i8* %4 to %struct.VExp*
  br label %6

; <label>:6                                       ; preds = %6, %3
  %indvars.iv.i.i = phi i64 [ 0, %3 ], [ %indvars.iv.next.i.i, %6 ]
  %7 = phi %struct.VExp* [ null, %3 ], [ %8, %6 ]
  %8 = getelementptr inbounds %struct.VExp* %5, i64 %indvars.iv.i.i
  %9 = getelementptr inbounds %struct.VExp* %5, i64 %indvars.iv.i.i, i32 3
  %10 = bitcast %union.anon.1* %9 to %struct.VExp**
  store %struct.VExp* %7, %struct.VExp** %10, align 8, !tbaa !1
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %exitcond.i.i = icmp eq i64 %indvars.iv.next.i.i, 1000
  br i1 %exitcond.i.i, label %.loopexit.i.i, label %6

.loopexit.i.i:                                    ; preds = %6
  %scevgep.i.i = getelementptr i8* %4, i64 55944
  %scevgep3.i.i = bitcast i8* %scevgep.i.i to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpRef.exit

newVExpRef.exit:                                  ; preds = %0, %.loopexit.i.i
  %11 = phi %struct.VExp* [ %scevgep3.i.i, %.loopexit.i.i ], [ %1, %0 ]
  %12 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 4
  store i32 1, i32* %12, align 4, !tbaa !17
  %13 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3
  %14 = bitcast %union.anon.1* %13 to %struct.VExp**
  %15 = load %struct.VExp** %14, align 8, !tbaa !1
  store %struct.VExp* %15, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %16 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 0
  store i32 7, i32* %16, align 4, !tbaa !15
  %17 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3, i32 0, i32 0
  store i32 %ref_val, i32* %17, align 4, !tbaa !26
  ret %struct.VExp* %11
}

; Function Attrs: nounwind uwtable
define %struct.VExp* @makeBuiltin(i8* %func_name) #1 {
  %1 = load i8* %func_name, align 1, !tbaa !10
  %2 = zext i8 %1 to i32
  %3 = sub nsw i32 43, %2
  %4 = icmp eq i8 %1, 43
  br i1 %4, label %5, label %10

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds i8* %func_name, i64 1
  %7 = load i8* %6, align 1, !tbaa !10
  %8 = zext i8 %7 to i32
  %9 = sub nsw i32 0, %8
  br label %10

; <label>:10                                      ; preds = %5, %0
  %__result.0 = phi i32 [ %9, %5 ], [ %3, %0 ]
  %phitmp = icmp eq i32 %__result.0, 0
  br i1 %phitmp, label %484, label %11

; <label>:11                                      ; preds = %10
  %12 = sub nsw i32 45, %2
  %13 = icmp eq i8 %1, 45
  br i1 %13, label %14, label %19

; <label>:14                                      ; preds = %11
  %15 = getelementptr inbounds i8* %func_name, i64 1
  %16 = load i8* %15, align 1, !tbaa !10
  %17 = zext i8 %16 to i32
  %18 = sub nsw i32 0, %17
  br label %19

; <label>:19                                      ; preds = %14, %11
  %__result4.0 = phi i32 [ %18, %14 ], [ %12, %11 ]
  %phitmp246 = icmp eq i32 %__result4.0, 0
  br i1 %phitmp246, label %484, label %20

; <label>:20                                      ; preds = %19
  %21 = sub nsw i32 42, %2
  %22 = icmp eq i8 %1, 42
  br i1 %22, label %23, label %28

; <label>:23                                      ; preds = %20
  %24 = getelementptr inbounds i8* %func_name, i64 1
  %25 = load i8* %24, align 1, !tbaa !10
  %26 = zext i8 %25 to i32
  %27 = sub nsw i32 0, %26
  br label %28

; <label>:28                                      ; preds = %23, %20
  %__result8.0 = phi i32 [ %27, %23 ], [ %21, %20 ]
  %phitmp247 = icmp eq i32 %__result8.0, 0
  br i1 %phitmp247, label %484, label %29

; <label>:29                                      ; preds = %28
  %30 = sub nsw i32 47, %2
  %31 = icmp eq i8 %1, 47
  br i1 %31, label %32, label %37

; <label>:32                                      ; preds = %29
  %33 = getelementptr inbounds i8* %func_name, i64 1
  %34 = load i8* %33, align 1, !tbaa !10
  %35 = zext i8 %34 to i32
  %36 = sub nsw i32 0, %35
  br label %37

; <label>:37                                      ; preds = %32, %29
  %__result12.0 = phi i32 [ %36, %32 ], [ %30, %29 ]
  %phitmp248 = icmp eq i32 %__result12.0, 0
  br i1 %phitmp248, label %484, label %38

; <label>:38                                      ; preds = %37
  %39 = sub nsw i32 37, %2
  %40 = icmp eq i8 %1, 37
  br i1 %40, label %41, label %46

; <label>:41                                      ; preds = %38
  %42 = getelementptr inbounds i8* %func_name, i64 1
  %43 = load i8* %42, align 1, !tbaa !10
  %44 = zext i8 %43 to i32
  %45 = sub nsw i32 0, %44
  br label %46

; <label>:46                                      ; preds = %41, %38
  %__result16.0 = phi i32 [ %45, %41 ], [ %39, %38 ]
  %phitmp249 = icmp eq i32 %__result16.0, 0
  br i1 %phitmp249, label %484, label %47

; <label>:47                                      ; preds = %46
  %48 = sub nsw i32 60, %2
  %49 = icmp eq i8 %1, 60
  br i1 %49, label %50, label %55

; <label>:50                                      ; preds = %47
  %51 = getelementptr inbounds i8* %func_name, i64 1
  %52 = load i8* %51, align 1, !tbaa !10
  %53 = zext i8 %52 to i32
  %54 = sub nsw i32 0, %53
  br label %55

; <label>:55                                      ; preds = %50, %47
  %__result20.0 = phi i32 [ %54, %50 ], [ %48, %47 ]
  %phitmp250 = icmp eq i32 %__result20.0, 0
  br i1 %phitmp250, label %484, label %56

; <label>:56                                      ; preds = %55
  %57 = sub nsw i32 62, %2
  %58 = icmp eq i8 %1, 62
  br i1 %58, label %59, label %70

; <label>:59                                      ; preds = %56
  %60 = getelementptr inbounds i8* %func_name, i64 1
  %61 = load i8* %60, align 1, !tbaa !10
  %62 = zext i8 %61 to i32
  %63 = sub nsw i32 61, %62
  %64 = icmp eq i8 %61, 61
  br i1 %64, label %65, label %70

; <label>:65                                      ; preds = %59
  %66 = getelementptr inbounds i8* %func_name, i64 2
  %67 = load i8* %66, align 1, !tbaa !10
  %68 = zext i8 %67 to i32
  %69 = sub nsw i32 0, %68
  br label %70

; <label>:70                                      ; preds = %65, %59, %56
  %__result24.0 = phi i32 [ %69, %65 ], [ %63, %59 ], [ %57, %56 ]
  %phitmp251 = icmp eq i32 %__result24.0, 0
  br i1 %phitmp251, label %484, label %71

; <label>:71                                      ; preds = %70
  br i1 %58, label %72, label %77

; <label>:72                                      ; preds = %71
  %73 = getelementptr inbounds i8* %func_name, i64 1
  %74 = load i8* %73, align 1, !tbaa !10
  %75 = zext i8 %74 to i32
  %76 = sub nsw i32 0, %75
  br label %77

; <label>:77                                      ; preds = %72, %71
  %__result28.0 = phi i32 [ %76, %72 ], [ %57, %71 ]
  %phitmp252 = icmp eq i32 %__result28.0, 0
  br i1 %phitmp252, label %484, label %78

; <label>:78                                      ; preds = %77
  br i1 %49, label %79, label %90

; <label>:79                                      ; preds = %78
  %80 = getelementptr inbounds i8* %func_name, i64 1
  %81 = load i8* %80, align 1, !tbaa !10
  %82 = zext i8 %81 to i32
  %83 = sub nsw i32 61, %82
  %84 = icmp eq i8 %81, 61
  br i1 %84, label %85, label %90

; <label>:85                                      ; preds = %79
  %86 = getelementptr inbounds i8* %func_name, i64 2
  %87 = load i8* %86, align 1, !tbaa !10
  %88 = zext i8 %87 to i32
  %89 = sub nsw i32 0, %88
  br label %90

; <label>:90                                      ; preds = %85, %79, %78
  %__result32.0 = phi i32 [ %89, %85 ], [ %83, %79 ], [ %48, %78 ]
  %phitmp253 = icmp eq i32 %__result32.0, 0
  br i1 %phitmp253, label %484, label %91

; <label>:91                                      ; preds = %90
  br i1 %31, label %92, label %103

; <label>:92                                      ; preds = %91
  %93 = getelementptr inbounds i8* %func_name, i64 1
  %94 = load i8* %93, align 1, !tbaa !10
  %95 = zext i8 %94 to i32
  %96 = sub nsw i32 61, %95
  %97 = icmp eq i8 %94, 61
  br i1 %97, label %98, label %103

; <label>:98                                      ; preds = %92
  %99 = getelementptr inbounds i8* %func_name, i64 2
  %100 = load i8* %99, align 1, !tbaa !10
  %101 = zext i8 %100 to i32
  %102 = sub nsw i32 0, %101
  br label %103

; <label>:103                                     ; preds = %98, %92, %91
  %__result36.0 = phi i32 [ %102, %98 ], [ %96, %92 ], [ %30, %91 ]
  %phitmp254 = icmp eq i32 %__result36.0, 0
  br i1 %phitmp254, label %484, label %104

; <label>:104                                     ; preds = %103
  %105 = sub nsw i32 61, %2
  %106 = icmp eq i8 %1, 61
  br i1 %106, label %107, label %112

; <label>:107                                     ; preds = %104
  %108 = getelementptr inbounds i8* %func_name, i64 1
  %109 = load i8* %108, align 1, !tbaa !10
  %110 = zext i8 %109 to i32
  %111 = sub nsw i32 0, %110
  br label %112

; <label>:112                                     ; preds = %107, %104
  %__result40.0 = phi i32 [ %111, %107 ], [ %105, %104 ]
  %phitmp255 = icmp eq i32 %__result40.0, 0
  br i1 %phitmp255, label %484, label %113

; <label>:113                                     ; preds = %112
  %114 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([6 x i8]* @.str28, i64 0, i64 0)) #7
  %115 = icmp eq i32 %114, 0
  br i1 %115, label %484, label %116

; <label>:116                                     ; preds = %113
  %117 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([8 x i8]* @.str29, i64 0, i64 0)) #7
  %118 = icmp eq i32 %117, 0
  br i1 %118, label %484, label %119

; <label>:119                                     ; preds = %116
  %120 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([5 x i8]* @.str30, i64 0, i64 0)) #7
  %121 = icmp eq i32 %120, 0
  br i1 %121, label %122, label %141

; <label>:122                                     ; preds = %119
  %123 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %124 = icmp eq %struct.VExp* %123, null
  br i1 %124, label %125, label %newVExpSyscall0.exit

; <label>:125                                     ; preds = %122
  %126 = tail call noalias i8* @malloc(i64 56000) #7
  %127 = bitcast i8* %126 to %struct.VExp*
  br label %128

; <label>:128                                     ; preds = %128, %125
  %indvars.iv.i.i = phi i64 [ 0, %125 ], [ %indvars.iv.next.i.i, %128 ]
  %129 = phi %struct.VExp* [ null, %125 ], [ %130, %128 ]
  %130 = getelementptr inbounds %struct.VExp* %127, i64 %indvars.iv.i.i
  %131 = getelementptr inbounds %struct.VExp* %127, i64 %indvars.iv.i.i, i32 3
  %132 = bitcast %union.anon.1* %131 to %struct.VExp**
  store %struct.VExp* %129, %struct.VExp** %132, align 8, !tbaa !1
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %exitcond.i.i = icmp eq i64 %indvars.iv.next.i.i, 1000
  br i1 %exitcond.i.i, label %.loopexit.i.i, label %128

.loopexit.i.i:                                    ; preds = %128
  %scevgep.i.i = getelementptr i8* %126, i64 55944
  %scevgep3.i.i = bitcast i8* %scevgep.i.i to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit

newVExpSyscall0.exit:                             ; preds = %122, %.loopexit.i.i
  %133 = phi %struct.VExp* [ %scevgep3.i.i, %.loopexit.i.i ], [ %123, %122 ]
  %134 = getelementptr inbounds %struct.VExp* %133, i64 0, i32 4
  store i32 1, i32* %134, align 4, !tbaa !17
  %135 = getelementptr inbounds %struct.VExp* %133, i64 0, i32 3
  %136 = bitcast %union.anon.1* %135 to %struct.VExp**
  %137 = load %struct.VExp** %136, align 8, !tbaa !1
  store %struct.VExp* %137, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %138 = getelementptr inbounds %struct.VExp* %133, i64 0, i32 0
  store i32 5, i32* %138, align 4, !tbaa !15
  %139 = getelementptr inbounds %struct.VExp* %133, i64 0, i32 3, i32 0, i32 0
  store i32 0, i32* %139, align 4, !tbaa !25
  %140 = getelementptr inbounds %struct.VExp* %133, i64 0, i32 3, i32 0, i32 1
  store i32 0, i32* %140, align 4, !tbaa !23
  br label %502

; <label>:141                                     ; preds = %119
  %142 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([8 x i8]* @.str31, i64 0, i64 0)) #7
  %143 = icmp eq i32 %142, 0
  br i1 %143, label %144, label %197

; <label>:144                                     ; preds = %141
  %145 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %146 = icmp eq %struct.VExp* %145, null
  br i1 %146, label %147, label %newVExpSyscall0.exit262

; <label>:147                                     ; preds = %144
  %148 = tail call noalias i8* @malloc(i64 56000) #7
  %149 = bitcast i8* %148 to %struct.VExp*
  br label %150

; <label>:150                                     ; preds = %150, %147
  %indvars.iv.i.i256 = phi i64 [ 0, %147 ], [ %indvars.iv.next.i.i257, %150 ]
  %151 = phi %struct.VExp* [ null, %147 ], [ %152, %150 ]
  %152 = getelementptr inbounds %struct.VExp* %149, i64 %indvars.iv.i.i256
  %153 = getelementptr inbounds %struct.VExp* %149, i64 %indvars.iv.i.i256, i32 3
  %154 = bitcast %union.anon.1* %153 to %struct.VExp**
  store %struct.VExp* %151, %struct.VExp** %154, align 8, !tbaa !1
  %indvars.iv.next.i.i257 = add nuw nsw i64 %indvars.iv.i.i256, 1
  %exitcond.i.i258 = icmp eq i64 %indvars.iv.next.i.i257, 1000
  br i1 %exitcond.i.i258, label %.loopexit.i.i261, label %150

.loopexit.i.i261:                                 ; preds = %150
  %scevgep.i.i259 = getelementptr i8* %148, i64 55944
  %scevgep3.i.i260 = bitcast i8* %scevgep.i.i259 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i260, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit262

newVExpSyscall0.exit262:                          ; preds = %144, %.loopexit.i.i261
  %155 = phi %struct.VExp* [ %scevgep3.i.i260, %.loopexit.i.i261 ], [ %145, %144 ]
  %156 = getelementptr inbounds %struct.VExp* %155, i64 0, i32 4
  store i32 1, i32* %156, align 4, !tbaa !17
  %157 = getelementptr inbounds %struct.VExp* %155, i64 0, i32 3
  %158 = bitcast %union.anon.1* %157 to %struct.VExp**
  %159 = load %struct.VExp** %158, align 8, !tbaa !1
  store %struct.VExp* %159, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %160 = getelementptr inbounds %struct.VExp* %155, i64 0, i32 0
  store i32 5, i32* %160, align 4, !tbaa !15
  %161 = getelementptr inbounds %struct.VExp* %155, i64 0, i32 3, i32 0, i32 0
  store i32 4, i32* %161, align 4, !tbaa !25
  %162 = getelementptr inbounds %struct.VExp* %155, i64 0, i32 3, i32 0, i32 1
  store i32 0, i32* %162, align 4, !tbaa !23
  %163 = icmp eq %struct.VExp* %159, null
  br i1 %163, label %164, label %makeInt.exit

; <label>:164                                     ; preds = %newVExpSyscall0.exit262
  %165 = tail call noalias i8* @malloc(i64 56000) #7
  %166 = bitcast i8* %165 to %struct.VExp*
  br label %167

; <label>:167                                     ; preds = %167, %164
  %indvars.iv.i.i.i = phi i64 [ 0, %164 ], [ %indvars.iv.next.i.i.i, %167 ]
  %168 = phi %struct.VExp* [ null, %164 ], [ %169, %167 ]
  %169 = getelementptr inbounds %struct.VExp* %166, i64 %indvars.iv.i.i.i
  %170 = getelementptr inbounds %struct.VExp* %166, i64 %indvars.iv.i.i.i, i32 3
  %171 = bitcast %union.anon.1* %170 to %struct.VExp**
  store %struct.VExp* %168, %struct.VExp** %171, align 8, !tbaa !1
  %indvars.iv.next.i.i.i = add nuw nsw i64 %indvars.iv.i.i.i, 1
  %exitcond.i.i.i = icmp eq i64 %indvars.iv.next.i.i.i, 1000
  br i1 %exitcond.i.i.i, label %.loopexit.i.i.i, label %167

.loopexit.i.i.i:                                  ; preds = %167
  %scevgep.i.i.i = getelementptr i8* %165, i64 55944
  %scevgep3.i.i.i = bitcast i8* %scevgep.i.i.i to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i.i, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %makeInt.exit

makeInt.exit:                                     ; preds = %newVExpSyscall0.exit262, %.loopexit.i.i.i
  %172 = phi %struct.VExp* [ %scevgep3.i.i.i, %.loopexit.i.i.i ], [ %159, %newVExpSyscall0.exit262 ]
  %173 = getelementptr inbounds %struct.VExp* %172, i64 0, i32 4
  store i32 1, i32* %173, align 4, !tbaa !17
  %174 = getelementptr inbounds %struct.VExp* %172, i64 0, i32 3
  %175 = bitcast %union.anon.1* %174 to %struct.VExp**
  %176 = load %struct.VExp** %175, align 8, !tbaa !1
  store %struct.VExp* %176, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %177 = getelementptr inbounds %struct.VExp* %172, i64 0, i32 0
  store i32 0, i32* %177, align 4, !tbaa !15
  %178 = getelementptr inbounds %struct.VExp* %172, i64 0, i32 3, i32 0, i32 0
  store i32 0, i32* %178, align 8
  %179 = getelementptr inbounds %struct.VExp* %172, i64 0, i32 3, i32 0, i32 2, i32 0
  store %struct.IntList* inttoptr (i64 1 to %struct.IntList*), %struct.IntList** %179, align 8
  %180 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %181 = icmp eq %struct.VExp* %180, null
  br i1 %181, label %182, label %newVExpApply.exit

; <label>:182                                     ; preds = %makeInt.exit
  %183 = tail call noalias i8* @malloc(i64 56000) #7
  %184 = bitcast i8* %183 to %struct.VExp*
  br label %185

; <label>:185                                     ; preds = %185, %182
  %indvars.iv.i.i263 = phi i64 [ 0, %182 ], [ %indvars.iv.next.i.i264, %185 ]
  %186 = phi %struct.VExp* [ null, %182 ], [ %187, %185 ]
  %187 = getelementptr inbounds %struct.VExp* %184, i64 %indvars.iv.i.i263
  %188 = getelementptr inbounds %struct.VExp* %184, i64 %indvars.iv.i.i263, i32 3
  %189 = bitcast %union.anon.1* %188 to %struct.VExp**
  store %struct.VExp* %186, %struct.VExp** %189, align 8, !tbaa !1
  %indvars.iv.next.i.i264 = add nuw nsw i64 %indvars.iv.i.i263, 1
  %exitcond.i.i265 = icmp eq i64 %indvars.iv.next.i.i264, 1000
  br i1 %exitcond.i.i265, label %.loopexit.i.i268, label %185

.loopexit.i.i268:                                 ; preds = %185
  %scevgep.i.i266 = getelementptr i8* %183, i64 55944
  %scevgep3.i.i267 = bitcast i8* %scevgep.i.i266 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i267, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpApply.exit

newVExpApply.exit:                                ; preds = %makeInt.exit, %.loopexit.i.i268
  %190 = phi %struct.VExp* [ %scevgep3.i.i267, %.loopexit.i.i268 ], [ %180, %makeInt.exit ]
  %191 = getelementptr inbounds %struct.VExp* %190, i64 0, i32 4
  store i32 1, i32* %191, align 4, !tbaa !17
  %192 = getelementptr inbounds %struct.VExp* %190, i64 0, i32 3
  %193 = bitcast %union.anon.1* %192 to %struct.VExp**
  %194 = load %struct.VExp** %193, align 8, !tbaa !1
  store %struct.VExp* %194, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %195 = getelementptr inbounds %struct.VExp* %190, i64 0, i32 0
  store i32 8, i32* %195, align 4, !tbaa !15
  store %struct.VExp* %155, %struct.VExp** %193, align 8, !tbaa !18
  %196 = getelementptr inbounds %struct.VExp* %190, i64 0, i32 3, i32 0, i32 2, i32 0
  %ap_x.c.i = bitcast %struct.VExp* %172 to %struct.IntList*
  store %struct.IntList* %ap_x.c.i, %struct.IntList** %196, align 8, !tbaa !20
  br label %502

; <label>:197                                     ; preds = %141
  %198 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([9 x i8]* @.str32, i64 0, i64 0)) #7
  %199 = icmp eq i32 %198, 0
  br i1 %199, label %200, label %219

; <label>:200                                     ; preds = %197
  %201 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %202 = icmp eq %struct.VExp* %201, null
  br i1 %202, label %203, label %newVExpSyscall0.exit275

; <label>:203                                     ; preds = %200
  %204 = tail call noalias i8* @malloc(i64 56000) #7
  %205 = bitcast i8* %204 to %struct.VExp*
  br label %206

; <label>:206                                     ; preds = %206, %203
  %indvars.iv.i.i269 = phi i64 [ 0, %203 ], [ %indvars.iv.next.i.i270, %206 ]
  %207 = phi %struct.VExp* [ null, %203 ], [ %208, %206 ]
  %208 = getelementptr inbounds %struct.VExp* %205, i64 %indvars.iv.i.i269
  %209 = getelementptr inbounds %struct.VExp* %205, i64 %indvars.iv.i.i269, i32 3
  %210 = bitcast %union.anon.1* %209 to %struct.VExp**
  store %struct.VExp* %207, %struct.VExp** %210, align 8, !tbaa !1
  %indvars.iv.next.i.i270 = add nuw nsw i64 %indvars.iv.i.i269, 1
  %exitcond.i.i271 = icmp eq i64 %indvars.iv.next.i.i270, 1000
  br i1 %exitcond.i.i271, label %.loopexit.i.i274, label %206

.loopexit.i.i274:                                 ; preds = %206
  %scevgep.i.i272 = getelementptr i8* %204, i64 55944
  %scevgep3.i.i273 = bitcast i8* %scevgep.i.i272 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i273, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit275

newVExpSyscall0.exit275:                          ; preds = %200, %.loopexit.i.i274
  %211 = phi %struct.VExp* [ %scevgep3.i.i273, %.loopexit.i.i274 ], [ %201, %200 ]
  %212 = getelementptr inbounds %struct.VExp* %211, i64 0, i32 4
  store i32 1, i32* %212, align 4, !tbaa !17
  %213 = getelementptr inbounds %struct.VExp* %211, i64 0, i32 3
  %214 = bitcast %union.anon.1* %213 to %struct.VExp**
  %215 = load %struct.VExp** %214, align 8, !tbaa !1
  store %struct.VExp* %215, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %216 = getelementptr inbounds %struct.VExp* %211, i64 0, i32 0
  store i32 5, i32* %216, align 4, !tbaa !15
  %217 = getelementptr inbounds %struct.VExp* %211, i64 0, i32 3, i32 0, i32 0
  store i32 4, i32* %217, align 4, !tbaa !25
  %218 = getelementptr inbounds %struct.VExp* %211, i64 0, i32 3, i32 0, i32 1
  store i32 0, i32* %218, align 4, !tbaa !23
  br label %502

; <label>:219                                     ; preds = %197
  %220 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([8 x i8]* @.str33, i64 0, i64 0)) #7
  %221 = icmp eq i32 %220, 0
  br i1 %221, label %222, label %275

; <label>:222                                     ; preds = %219
  %223 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %224 = icmp eq %struct.VExp* %223, null
  br i1 %224, label %225, label %newVExpSyscall0.exit282

; <label>:225                                     ; preds = %222
  %226 = tail call noalias i8* @malloc(i64 56000) #7
  %227 = bitcast i8* %226 to %struct.VExp*
  br label %228

; <label>:228                                     ; preds = %228, %225
  %indvars.iv.i.i276 = phi i64 [ 0, %225 ], [ %indvars.iv.next.i.i277, %228 ]
  %229 = phi %struct.VExp* [ null, %225 ], [ %230, %228 ]
  %230 = getelementptr inbounds %struct.VExp* %227, i64 %indvars.iv.i.i276
  %231 = getelementptr inbounds %struct.VExp* %227, i64 %indvars.iv.i.i276, i32 3
  %232 = bitcast %union.anon.1* %231 to %struct.VExp**
  store %struct.VExp* %229, %struct.VExp** %232, align 8, !tbaa !1
  %indvars.iv.next.i.i277 = add nuw nsw i64 %indvars.iv.i.i276, 1
  %exitcond.i.i278 = icmp eq i64 %indvars.iv.next.i.i277, 1000
  br i1 %exitcond.i.i278, label %.loopexit.i.i281, label %228

.loopexit.i.i281:                                 ; preds = %228
  %scevgep.i.i279 = getelementptr i8* %226, i64 55944
  %scevgep3.i.i280 = bitcast i8* %scevgep.i.i279 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i280, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit282

newVExpSyscall0.exit282:                          ; preds = %222, %.loopexit.i.i281
  %233 = phi %struct.VExp* [ %scevgep3.i.i280, %.loopexit.i.i281 ], [ %223, %222 ]
  %234 = getelementptr inbounds %struct.VExp* %233, i64 0, i32 4
  store i32 1, i32* %234, align 4, !tbaa !17
  %235 = getelementptr inbounds %struct.VExp* %233, i64 0, i32 3
  %236 = bitcast %union.anon.1* %235 to %struct.VExp**
  %237 = load %struct.VExp** %236, align 8, !tbaa !1
  store %struct.VExp* %237, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %238 = getelementptr inbounds %struct.VExp* %233, i64 0, i32 0
  store i32 5, i32* %238, align 4, !tbaa !15
  %239 = getelementptr inbounds %struct.VExp* %233, i64 0, i32 3, i32 0, i32 0
  store i32 3, i32* %239, align 4, !tbaa !25
  %240 = getelementptr inbounds %struct.VExp* %233, i64 0, i32 3, i32 0, i32 1
  store i32 0, i32* %240, align 4, !tbaa !23
  %241 = icmp eq %struct.VExp* %237, null
  br i1 %241, label %242, label %makeInt.exit289

; <label>:242                                     ; preds = %newVExpSyscall0.exit282
  %243 = tail call noalias i8* @malloc(i64 56000) #7
  %244 = bitcast i8* %243 to %struct.VExp*
  br label %245

; <label>:245                                     ; preds = %245, %242
  %indvars.iv.i.i.i283 = phi i64 [ 0, %242 ], [ %indvars.iv.next.i.i.i284, %245 ]
  %246 = phi %struct.VExp* [ null, %242 ], [ %247, %245 ]
  %247 = getelementptr inbounds %struct.VExp* %244, i64 %indvars.iv.i.i.i283
  %248 = getelementptr inbounds %struct.VExp* %244, i64 %indvars.iv.i.i.i283, i32 3
  %249 = bitcast %union.anon.1* %248 to %struct.VExp**
  store %struct.VExp* %246, %struct.VExp** %249, align 8, !tbaa !1
  %indvars.iv.next.i.i.i284 = add nuw nsw i64 %indvars.iv.i.i.i283, 1
  %exitcond.i.i.i285 = icmp eq i64 %indvars.iv.next.i.i.i284, 1000
  br i1 %exitcond.i.i.i285, label %.loopexit.i.i.i288, label %245

.loopexit.i.i.i288:                               ; preds = %245
  %scevgep.i.i.i286 = getelementptr i8* %243, i64 55944
  %scevgep3.i.i.i287 = bitcast i8* %scevgep.i.i.i286 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i.i287, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %makeInt.exit289

makeInt.exit289:                                  ; preds = %newVExpSyscall0.exit282, %.loopexit.i.i.i288
  %250 = phi %struct.VExp* [ %scevgep3.i.i.i287, %.loopexit.i.i.i288 ], [ %237, %newVExpSyscall0.exit282 ]
  %251 = getelementptr inbounds %struct.VExp* %250, i64 0, i32 4
  store i32 1, i32* %251, align 4, !tbaa !17
  %252 = getelementptr inbounds %struct.VExp* %250, i64 0, i32 3
  %253 = bitcast %union.anon.1* %252 to %struct.VExp**
  %254 = load %struct.VExp** %253, align 8, !tbaa !1
  store %struct.VExp* %254, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %255 = getelementptr inbounds %struct.VExp* %250, i64 0, i32 0
  store i32 0, i32* %255, align 4, !tbaa !15
  %256 = getelementptr inbounds %struct.VExp* %250, i64 0, i32 3, i32 0, i32 0
  store i32 0, i32* %256, align 8
  %257 = getelementptr inbounds %struct.VExp* %250, i64 0, i32 3, i32 0, i32 2, i32 0
  store %struct.IntList* null, %struct.IntList** %257, align 8
  %258 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %259 = icmp eq %struct.VExp* %258, null
  br i1 %259, label %260, label %newVExpApply.exit297

; <label>:260                                     ; preds = %makeInt.exit289
  %261 = tail call noalias i8* @malloc(i64 56000) #7
  %262 = bitcast i8* %261 to %struct.VExp*
  br label %263

; <label>:263                                     ; preds = %263, %260
  %indvars.iv.i.i290 = phi i64 [ 0, %260 ], [ %indvars.iv.next.i.i291, %263 ]
  %264 = phi %struct.VExp* [ null, %260 ], [ %265, %263 ]
  %265 = getelementptr inbounds %struct.VExp* %262, i64 %indvars.iv.i.i290
  %266 = getelementptr inbounds %struct.VExp* %262, i64 %indvars.iv.i.i290, i32 3
  %267 = bitcast %union.anon.1* %266 to %struct.VExp**
  store %struct.VExp* %264, %struct.VExp** %267, align 8, !tbaa !1
  %indvars.iv.next.i.i291 = add nuw nsw i64 %indvars.iv.i.i290, 1
  %exitcond.i.i292 = icmp eq i64 %indvars.iv.next.i.i291, 1000
  br i1 %exitcond.i.i292, label %.loopexit.i.i295, label %263

.loopexit.i.i295:                                 ; preds = %263
  %scevgep.i.i293 = getelementptr i8* %261, i64 55944
  %scevgep3.i.i294 = bitcast i8* %scevgep.i.i293 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i294, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpApply.exit297

newVExpApply.exit297:                             ; preds = %makeInt.exit289, %.loopexit.i.i295
  %268 = phi %struct.VExp* [ %scevgep3.i.i294, %.loopexit.i.i295 ], [ %258, %makeInt.exit289 ]
  %269 = getelementptr inbounds %struct.VExp* %268, i64 0, i32 4
  store i32 1, i32* %269, align 4, !tbaa !17
  %270 = getelementptr inbounds %struct.VExp* %268, i64 0, i32 3
  %271 = bitcast %union.anon.1* %270 to %struct.VExp**
  %272 = load %struct.VExp** %271, align 8, !tbaa !1
  store %struct.VExp* %272, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %273 = getelementptr inbounds %struct.VExp* %268, i64 0, i32 0
  store i32 8, i32* %273, align 4, !tbaa !15
  store %struct.VExp* %233, %struct.VExp** %271, align 8, !tbaa !18
  %274 = getelementptr inbounds %struct.VExp* %268, i64 0, i32 3, i32 0, i32 2, i32 0
  %ap_x.c.i296 = bitcast %struct.VExp* %250 to %struct.IntList*
  store %struct.IntList* %ap_x.c.i296, %struct.IntList** %274, align 8, !tbaa !20
  br label %502

; <label>:275                                     ; preds = %219
  %276 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([9 x i8]* @.str34, i64 0, i64 0)) #7
  %277 = icmp eq i32 %276, 0
  br i1 %277, label %278, label %297

; <label>:278                                     ; preds = %275
  %279 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %280 = icmp eq %struct.VExp* %279, null
  br i1 %280, label %281, label %newVExpSyscall0.exit304

; <label>:281                                     ; preds = %278
  %282 = tail call noalias i8* @malloc(i64 56000) #7
  %283 = bitcast i8* %282 to %struct.VExp*
  br label %284

; <label>:284                                     ; preds = %284, %281
  %indvars.iv.i.i298 = phi i64 [ 0, %281 ], [ %indvars.iv.next.i.i299, %284 ]
  %285 = phi %struct.VExp* [ null, %281 ], [ %286, %284 ]
  %286 = getelementptr inbounds %struct.VExp* %283, i64 %indvars.iv.i.i298
  %287 = getelementptr inbounds %struct.VExp* %283, i64 %indvars.iv.i.i298, i32 3
  %288 = bitcast %union.anon.1* %287 to %struct.VExp**
  store %struct.VExp* %285, %struct.VExp** %288, align 8, !tbaa !1
  %indvars.iv.next.i.i299 = add nuw nsw i64 %indvars.iv.i.i298, 1
  %exitcond.i.i300 = icmp eq i64 %indvars.iv.next.i.i299, 1000
  br i1 %exitcond.i.i300, label %.loopexit.i.i303, label %284

.loopexit.i.i303:                                 ; preds = %284
  %scevgep.i.i301 = getelementptr i8* %282, i64 55944
  %scevgep3.i.i302 = bitcast i8* %scevgep.i.i301 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i302, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit304

newVExpSyscall0.exit304:                          ; preds = %278, %.loopexit.i.i303
  %289 = phi %struct.VExp* [ %scevgep3.i.i302, %.loopexit.i.i303 ], [ %279, %278 ]
  %290 = getelementptr inbounds %struct.VExp* %289, i64 0, i32 4
  store i32 1, i32* %290, align 4, !tbaa !17
  %291 = getelementptr inbounds %struct.VExp* %289, i64 0, i32 3
  %292 = bitcast %union.anon.1* %291 to %struct.VExp**
  %293 = load %struct.VExp** %292, align 8, !tbaa !1
  store %struct.VExp* %293, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %294 = getelementptr inbounds %struct.VExp* %289, i64 0, i32 0
  store i32 5, i32* %294, align 4, !tbaa !15
  %295 = getelementptr inbounds %struct.VExp* %289, i64 0, i32 3, i32 0, i32 0
  store i32 3, i32* %295, align 4, !tbaa !25
  %296 = getelementptr inbounds %struct.VExp* %289, i64 0, i32 3, i32 0, i32 1
  store i32 0, i32* %296, align 4, !tbaa !23
  br label %502

; <label>:297                                     ; preds = %275
  %298 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([9 x i8]* @.str35, i64 0, i64 0)) #7
  %299 = icmp eq i32 %298, 0
  br i1 %299, label %300, label %353

; <label>:300                                     ; preds = %297
  %301 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %302 = icmp eq %struct.VExp* %301, null
  br i1 %302, label %303, label %newVExpSyscall0.exit311

; <label>:303                                     ; preds = %300
  %304 = tail call noalias i8* @malloc(i64 56000) #7
  %305 = bitcast i8* %304 to %struct.VExp*
  br label %306

; <label>:306                                     ; preds = %306, %303
  %indvars.iv.i.i305 = phi i64 [ 0, %303 ], [ %indvars.iv.next.i.i306, %306 ]
  %307 = phi %struct.VExp* [ null, %303 ], [ %308, %306 ]
  %308 = getelementptr inbounds %struct.VExp* %305, i64 %indvars.iv.i.i305
  %309 = getelementptr inbounds %struct.VExp* %305, i64 %indvars.iv.i.i305, i32 3
  %310 = bitcast %union.anon.1* %309 to %struct.VExp**
  store %struct.VExp* %307, %struct.VExp** %310, align 8, !tbaa !1
  %indvars.iv.next.i.i306 = add nuw nsw i64 %indvars.iv.i.i305, 1
  %exitcond.i.i307 = icmp eq i64 %indvars.iv.next.i.i306, 1000
  br i1 %exitcond.i.i307, label %.loopexit.i.i310, label %306

.loopexit.i.i310:                                 ; preds = %306
  %scevgep.i.i308 = getelementptr i8* %304, i64 55944
  %scevgep3.i.i309 = bitcast i8* %scevgep.i.i308 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i309, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit311

newVExpSyscall0.exit311:                          ; preds = %300, %.loopexit.i.i310
  %311 = phi %struct.VExp* [ %scevgep3.i.i309, %.loopexit.i.i310 ], [ %301, %300 ]
  %312 = getelementptr inbounds %struct.VExp* %311, i64 0, i32 4
  store i32 1, i32* %312, align 4, !tbaa !17
  %313 = getelementptr inbounds %struct.VExp* %311, i64 0, i32 3
  %314 = bitcast %union.anon.1* %313 to %struct.VExp**
  %315 = load %struct.VExp** %314, align 8, !tbaa !1
  store %struct.VExp* %315, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %316 = getelementptr inbounds %struct.VExp* %311, i64 0, i32 0
  store i32 5, i32* %316, align 4, !tbaa !15
  %317 = getelementptr inbounds %struct.VExp* %311, i64 0, i32 3, i32 0, i32 0
  store i32 5, i32* %317, align 4, !tbaa !25
  %318 = getelementptr inbounds %struct.VExp* %311, i64 0, i32 3, i32 0, i32 1
  store i32 0, i32* %318, align 4, !tbaa !23
  %319 = icmp eq %struct.VExp* %315, null
  br i1 %319, label %320, label %makeInt.exit318

; <label>:320                                     ; preds = %newVExpSyscall0.exit311
  %321 = tail call noalias i8* @malloc(i64 56000) #7
  %322 = bitcast i8* %321 to %struct.VExp*
  br label %323

; <label>:323                                     ; preds = %323, %320
  %indvars.iv.i.i.i312 = phi i64 [ 0, %320 ], [ %indvars.iv.next.i.i.i313, %323 ]
  %324 = phi %struct.VExp* [ null, %320 ], [ %325, %323 ]
  %325 = getelementptr inbounds %struct.VExp* %322, i64 %indvars.iv.i.i.i312
  %326 = getelementptr inbounds %struct.VExp* %322, i64 %indvars.iv.i.i.i312, i32 3
  %327 = bitcast %union.anon.1* %326 to %struct.VExp**
  store %struct.VExp* %324, %struct.VExp** %327, align 8, !tbaa !1
  %indvars.iv.next.i.i.i313 = add nuw nsw i64 %indvars.iv.i.i.i312, 1
  %exitcond.i.i.i314 = icmp eq i64 %indvars.iv.next.i.i.i313, 1000
  br i1 %exitcond.i.i.i314, label %.loopexit.i.i.i317, label %323

.loopexit.i.i.i317:                               ; preds = %323
  %scevgep.i.i.i315 = getelementptr i8* %321, i64 55944
  %scevgep3.i.i.i316 = bitcast i8* %scevgep.i.i.i315 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i.i316, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %makeInt.exit318

makeInt.exit318:                                  ; preds = %newVExpSyscall0.exit311, %.loopexit.i.i.i317
  %328 = phi %struct.VExp* [ %scevgep3.i.i.i316, %.loopexit.i.i.i317 ], [ %315, %newVExpSyscall0.exit311 ]
  %329 = getelementptr inbounds %struct.VExp* %328, i64 0, i32 4
  store i32 1, i32* %329, align 4, !tbaa !17
  %330 = getelementptr inbounds %struct.VExp* %328, i64 0, i32 3
  %331 = bitcast %union.anon.1* %330 to %struct.VExp**
  %332 = load %struct.VExp** %331, align 8, !tbaa !1
  store %struct.VExp* %332, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %333 = getelementptr inbounds %struct.VExp* %328, i64 0, i32 0
  store i32 0, i32* %333, align 4, !tbaa !15
  %334 = getelementptr inbounds %struct.VExp* %328, i64 0, i32 3, i32 0, i32 0
  store i32 0, i32* %334, align 8
  %335 = getelementptr inbounds %struct.VExp* %328, i64 0, i32 3, i32 0, i32 2, i32 0
  store %struct.IntList* null, %struct.IntList** %335, align 8
  %336 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %337 = icmp eq %struct.VExp* %336, null
  br i1 %337, label %338, label %newVExpApply.exit326

; <label>:338                                     ; preds = %makeInt.exit318
  %339 = tail call noalias i8* @malloc(i64 56000) #7
  %340 = bitcast i8* %339 to %struct.VExp*
  br label %341

; <label>:341                                     ; preds = %341, %338
  %indvars.iv.i.i319 = phi i64 [ 0, %338 ], [ %indvars.iv.next.i.i320, %341 ]
  %342 = phi %struct.VExp* [ null, %338 ], [ %343, %341 ]
  %343 = getelementptr inbounds %struct.VExp* %340, i64 %indvars.iv.i.i319
  %344 = getelementptr inbounds %struct.VExp* %340, i64 %indvars.iv.i.i319, i32 3
  %345 = bitcast %union.anon.1* %344 to %struct.VExp**
  store %struct.VExp* %342, %struct.VExp** %345, align 8, !tbaa !1
  %indvars.iv.next.i.i320 = add nuw nsw i64 %indvars.iv.i.i319, 1
  %exitcond.i.i321 = icmp eq i64 %indvars.iv.next.i.i320, 1000
  br i1 %exitcond.i.i321, label %.loopexit.i.i324, label %341

.loopexit.i.i324:                                 ; preds = %341
  %scevgep.i.i322 = getelementptr i8* %339, i64 55944
  %scevgep3.i.i323 = bitcast i8* %scevgep.i.i322 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i323, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpApply.exit326

newVExpApply.exit326:                             ; preds = %makeInt.exit318, %.loopexit.i.i324
  %346 = phi %struct.VExp* [ %scevgep3.i.i323, %.loopexit.i.i324 ], [ %336, %makeInt.exit318 ]
  %347 = getelementptr inbounds %struct.VExp* %346, i64 0, i32 4
  store i32 1, i32* %347, align 4, !tbaa !17
  %348 = getelementptr inbounds %struct.VExp* %346, i64 0, i32 3
  %349 = bitcast %union.anon.1* %348 to %struct.VExp**
  %350 = load %struct.VExp** %349, align 8, !tbaa !1
  store %struct.VExp* %350, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %351 = getelementptr inbounds %struct.VExp* %346, i64 0, i32 0
  store i32 8, i32* %351, align 4, !tbaa !15
  store %struct.VExp* %311, %struct.VExp** %349, align 8, !tbaa !18
  %352 = getelementptr inbounds %struct.VExp* %346, i64 0, i32 3, i32 0, i32 2, i32 0
  %ap_x.c.i325 = bitcast %struct.VExp* %328 to %struct.IntList*
  store %struct.IntList* %ap_x.c.i325, %struct.IntList** %352, align 8, !tbaa !20
  br label %502

; <label>:353                                     ; preds = %297
  %354 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([10 x i8]* @.str36, i64 0, i64 0)) #7
  %355 = icmp eq i32 %354, 0
  br i1 %355, label %356, label %375

; <label>:356                                     ; preds = %353
  %357 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %358 = icmp eq %struct.VExp* %357, null
  br i1 %358, label %359, label %newVExpSyscall0.exit333

; <label>:359                                     ; preds = %356
  %360 = tail call noalias i8* @malloc(i64 56000) #7
  %361 = bitcast i8* %360 to %struct.VExp*
  br label %362

; <label>:362                                     ; preds = %362, %359
  %indvars.iv.i.i327 = phi i64 [ 0, %359 ], [ %indvars.iv.next.i.i328, %362 ]
  %363 = phi %struct.VExp* [ null, %359 ], [ %364, %362 ]
  %364 = getelementptr inbounds %struct.VExp* %361, i64 %indvars.iv.i.i327
  %365 = getelementptr inbounds %struct.VExp* %361, i64 %indvars.iv.i.i327, i32 3
  %366 = bitcast %union.anon.1* %365 to %struct.VExp**
  store %struct.VExp* %363, %struct.VExp** %366, align 8, !tbaa !1
  %indvars.iv.next.i.i328 = add nuw nsw i64 %indvars.iv.i.i327, 1
  %exitcond.i.i329 = icmp eq i64 %indvars.iv.next.i.i328, 1000
  br i1 %exitcond.i.i329, label %.loopexit.i.i332, label %362

.loopexit.i.i332:                                 ; preds = %362
  %scevgep.i.i330 = getelementptr i8* %360, i64 55944
  %scevgep3.i.i331 = bitcast i8* %scevgep.i.i330 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i331, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit333

newVExpSyscall0.exit333:                          ; preds = %356, %.loopexit.i.i332
  %367 = phi %struct.VExp* [ %scevgep3.i.i331, %.loopexit.i.i332 ], [ %357, %356 ]
  %368 = getelementptr inbounds %struct.VExp* %367, i64 0, i32 4
  store i32 1, i32* %368, align 4, !tbaa !17
  %369 = getelementptr inbounds %struct.VExp* %367, i64 0, i32 3
  %370 = bitcast %union.anon.1* %369 to %struct.VExp**
  %371 = load %struct.VExp** %370, align 8, !tbaa !1
  store %struct.VExp* %371, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %372 = getelementptr inbounds %struct.VExp* %367, i64 0, i32 0
  store i32 5, i32* %372, align 4, !tbaa !15
  %373 = getelementptr inbounds %struct.VExp* %367, i64 0, i32 3, i32 0, i32 0
  store i32 5, i32* %373, align 4, !tbaa !25
  %374 = getelementptr inbounds %struct.VExp* %367, i64 0, i32 3, i32 0, i32 1
  store i32 0, i32* %374, align 4, !tbaa !23
  br label %502

; <label>:375                                     ; preds = %353
  %376 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([6 x i8]* @.str37, i64 0, i64 0)) #7
  %377 = icmp eq i32 %376, 0
  br i1 %377, label %378, label %397

; <label>:378                                     ; preds = %375
  %379 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %380 = icmp eq %struct.VExp* %379, null
  br i1 %380, label %381, label %newVExpSyscall0.exit340

; <label>:381                                     ; preds = %378
  %382 = tail call noalias i8* @malloc(i64 56000) #7
  %383 = bitcast i8* %382 to %struct.VExp*
  br label %384

; <label>:384                                     ; preds = %384, %381
  %indvars.iv.i.i334 = phi i64 [ 0, %381 ], [ %indvars.iv.next.i.i335, %384 ]
  %385 = phi %struct.VExp* [ null, %381 ], [ %386, %384 ]
  %386 = getelementptr inbounds %struct.VExp* %383, i64 %indvars.iv.i.i334
  %387 = getelementptr inbounds %struct.VExp* %383, i64 %indvars.iv.i.i334, i32 3
  %388 = bitcast %union.anon.1* %387 to %struct.VExp**
  store %struct.VExp* %385, %struct.VExp** %388, align 8, !tbaa !1
  %indvars.iv.next.i.i335 = add nuw nsw i64 %indvars.iv.i.i334, 1
  %exitcond.i.i336 = icmp eq i64 %indvars.iv.next.i.i335, 1000
  br i1 %exitcond.i.i336, label %.loopexit.i.i339, label %384

.loopexit.i.i339:                                 ; preds = %384
  %scevgep.i.i337 = getelementptr i8* %382, i64 55944
  %scevgep3.i.i338 = bitcast i8* %scevgep.i.i337 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i338, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit340

newVExpSyscall0.exit340:                          ; preds = %378, %.loopexit.i.i339
  %389 = phi %struct.VExp* [ %scevgep3.i.i338, %.loopexit.i.i339 ], [ %379, %378 ]
  %390 = getelementptr inbounds %struct.VExp* %389, i64 0, i32 4
  store i32 1, i32* %390, align 4, !tbaa !17
  %391 = getelementptr inbounds %struct.VExp* %389, i64 0, i32 3
  %392 = bitcast %union.anon.1* %391 to %struct.VExp**
  %393 = load %struct.VExp** %392, align 8, !tbaa !1
  store %struct.VExp* %393, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %394 = getelementptr inbounds %struct.VExp* %389, i64 0, i32 0
  store i32 5, i32* %394, align 4, !tbaa !15
  %395 = getelementptr inbounds %struct.VExp* %389, i64 0, i32 3, i32 0, i32 0
  store i32 2, i32* %395, align 4, !tbaa !25
  %396 = getelementptr inbounds %struct.VExp* %389, i64 0, i32 3, i32 0, i32 1
  store i32 0, i32* %396, align 4, !tbaa !23
  br label %502

; <label>:397                                     ; preds = %375
  %398 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([8 x i8]* @.str38, i64 0, i64 0)) #7
  %399 = icmp eq i32 %398, 0
  br i1 %399, label %400, label %419

; <label>:400                                     ; preds = %397
  %401 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %402 = icmp eq %struct.VExp* %401, null
  br i1 %402, label %403, label %newVExpSyscall0.exit347

; <label>:403                                     ; preds = %400
  %404 = tail call noalias i8* @malloc(i64 56000) #7
  %405 = bitcast i8* %404 to %struct.VExp*
  br label %406

; <label>:406                                     ; preds = %406, %403
  %indvars.iv.i.i341 = phi i64 [ 0, %403 ], [ %indvars.iv.next.i.i342, %406 ]
  %407 = phi %struct.VExp* [ null, %403 ], [ %408, %406 ]
  %408 = getelementptr inbounds %struct.VExp* %405, i64 %indvars.iv.i.i341
  %409 = getelementptr inbounds %struct.VExp* %405, i64 %indvars.iv.i.i341, i32 3
  %410 = bitcast %union.anon.1* %409 to %struct.VExp**
  store %struct.VExp* %407, %struct.VExp** %410, align 8, !tbaa !1
  %indvars.iv.next.i.i342 = add nuw nsw i64 %indvars.iv.i.i341, 1
  %exitcond.i.i343 = icmp eq i64 %indvars.iv.next.i.i342, 1000
  br i1 %exitcond.i.i343, label %.loopexit.i.i346, label %406

.loopexit.i.i346:                                 ; preds = %406
  %scevgep.i.i344 = getelementptr i8* %404, i64 55944
  %scevgep3.i.i345 = bitcast i8* %scevgep.i.i344 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i345, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit347

newVExpSyscall0.exit347:                          ; preds = %400, %.loopexit.i.i346
  %411 = phi %struct.VExp* [ %scevgep3.i.i345, %.loopexit.i.i346 ], [ %401, %400 ]
  %412 = getelementptr inbounds %struct.VExp* %411, i64 0, i32 4
  store i32 1, i32* %412, align 4, !tbaa !17
  %413 = getelementptr inbounds %struct.VExp* %411, i64 0, i32 3
  %414 = bitcast %union.anon.1* %413 to %struct.VExp**
  %415 = load %struct.VExp** %414, align 8, !tbaa !1
  store %struct.VExp* %415, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %416 = getelementptr inbounds %struct.VExp* %411, i64 0, i32 0
  store i32 5, i32* %416, align 4, !tbaa !15
  %417 = getelementptr inbounds %struct.VExp* %411, i64 0, i32 3, i32 0, i32 0
  store i32 1, i32* %417, align 4, !tbaa !25
  %418 = getelementptr inbounds %struct.VExp* %411, i64 0, i32 3, i32 0, i32 1
  store i32 0, i32* %418, align 4, !tbaa !23
  br label %502

; <label>:419                                     ; preds = %397
  %420 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([12 x i8]* @.str39, i64 0, i64 0)) #7
  %421 = icmp eq i32 %420, 0
  br i1 %421, label %422, label %440

; <label>:422                                     ; preds = %419
  %423 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %424 = icmp eq %struct.VExp* %423, null
  br i1 %424, label %425, label %newVExpIntList.exit

; <label>:425                                     ; preds = %422
  %426 = tail call noalias i8* @malloc(i64 56000) #7
  %427 = bitcast i8* %426 to %struct.VExp*
  br label %428

; <label>:428                                     ; preds = %428, %425
  %indvars.iv.i.i348 = phi i64 [ 0, %425 ], [ %indvars.iv.next.i.i349, %428 ]
  %429 = phi %struct.VExp* [ null, %425 ], [ %430, %428 ]
  %430 = getelementptr inbounds %struct.VExp* %427, i64 %indvars.iv.i.i348
  %431 = getelementptr inbounds %struct.VExp* %427, i64 %indvars.iv.i.i348, i32 3
  %432 = bitcast %union.anon.1* %431 to %struct.VExp**
  store %struct.VExp* %429, %struct.VExp** %432, align 8, !tbaa !1
  %indvars.iv.next.i.i349 = add nuw nsw i64 %indvars.iv.i.i348, 1
  %exitcond.i.i350 = icmp eq i64 %indvars.iv.next.i.i349, 1000
  br i1 %exitcond.i.i350, label %.loopexit.i.i353, label %428

.loopexit.i.i353:                                 ; preds = %428
  %scevgep.i.i351 = getelementptr i8* %426, i64 55944
  %scevgep3.i.i352 = bitcast i8* %scevgep.i.i351 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i352, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpIntList.exit

newVExpIntList.exit:                              ; preds = %422, %.loopexit.i.i353
  %433 = phi %struct.VExp* [ %scevgep3.i.i352, %.loopexit.i.i353 ], [ %423, %422 ]
  %434 = getelementptr inbounds %struct.VExp* %433, i64 0, i32 4
  store i32 1, i32* %434, align 4, !tbaa !17
  %435 = getelementptr inbounds %struct.VExp* %433, i64 0, i32 3
  %436 = bitcast %union.anon.1* %435 to %struct.VExp**
  %437 = load %struct.VExp** %436, align 8, !tbaa !1
  store %struct.VExp* %437, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %438 = getelementptr inbounds %struct.VExp* %433, i64 0, i32 0
  store i32 4, i32* %438, align 4, !tbaa !15
  %439 = bitcast %union.anon.1* %435 to %struct.IntList**
  store %struct.IntList* null, %struct.IntList** %439, align 8, !tbaa !21
  br label %502

; <label>:440                                     ; preds = %419
  %441 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([7 x i8]* @.str40, i64 0, i64 0)) #7
  %442 = icmp eq i32 %441, 0
  br i1 %442, label %443, label %462

; <label>:443                                     ; preds = %440
  %444 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %445 = icmp eq %struct.VExp* %444, null
  br i1 %445, label %446, label %newVExpSyscall0.exit360

; <label>:446                                     ; preds = %443
  %447 = tail call noalias i8* @malloc(i64 56000) #7
  %448 = bitcast i8* %447 to %struct.VExp*
  br label %449

; <label>:449                                     ; preds = %449, %446
  %indvars.iv.i.i354 = phi i64 [ 0, %446 ], [ %indvars.iv.next.i.i355, %449 ]
  %450 = phi %struct.VExp* [ null, %446 ], [ %451, %449 ]
  %451 = getelementptr inbounds %struct.VExp* %448, i64 %indvars.iv.i.i354
  %452 = getelementptr inbounds %struct.VExp* %448, i64 %indvars.iv.i.i354, i32 3
  %453 = bitcast %union.anon.1* %452 to %struct.VExp**
  store %struct.VExp* %450, %struct.VExp** %453, align 8, !tbaa !1
  %indvars.iv.next.i.i355 = add nuw nsw i64 %indvars.iv.i.i354, 1
  %exitcond.i.i356 = icmp eq i64 %indvars.iv.next.i.i355, 1000
  br i1 %exitcond.i.i356, label %.loopexit.i.i359, label %449

.loopexit.i.i359:                                 ; preds = %449
  %scevgep.i.i357 = getelementptr i8* %447, i64 55944
  %scevgep3.i.i358 = bitcast i8* %scevgep.i.i357 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i358, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit360

newVExpSyscall0.exit360:                          ; preds = %443, %.loopexit.i.i359
  %454 = phi %struct.VExp* [ %scevgep3.i.i358, %.loopexit.i.i359 ], [ %444, %443 ]
  %455 = getelementptr inbounds %struct.VExp* %454, i64 0, i32 4
  store i32 1, i32* %455, align 4, !tbaa !17
  %456 = getelementptr inbounds %struct.VExp* %454, i64 0, i32 3
  %457 = bitcast %union.anon.1* %456 to %struct.VExp**
  %458 = load %struct.VExp** %457, align 8, !tbaa !1
  store %struct.VExp* %458, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %459 = getelementptr inbounds %struct.VExp* %454, i64 0, i32 0
  store i32 5, i32* %459, align 4, !tbaa !15
  %460 = getelementptr inbounds %struct.VExp* %454, i64 0, i32 3, i32 0, i32 0
  store i32 6, i32* %460, align 4, !tbaa !25
  %461 = getelementptr inbounds %struct.VExp* %454, i64 0, i32 3, i32 0, i32 1
  store i32 0, i32* %461, align 4, !tbaa !23
  br label %502

; <label>:462                                     ; preds = %440
  %463 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([10 x i8]* @.str41, i64 0, i64 0)) #7
  %464 = icmp eq i32 %463, 0
  br i1 %464, label %465, label %502

; <label>:465                                     ; preds = %462
  %466 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %467 = icmp eq %struct.VExp* %466, null
  br i1 %467, label %468, label %newVExpSyscall0.exit367

; <label>:468                                     ; preds = %465
  %469 = tail call noalias i8* @malloc(i64 56000) #7
  %470 = bitcast i8* %469 to %struct.VExp*
  br label %471

; <label>:471                                     ; preds = %471, %468
  %indvars.iv.i.i361 = phi i64 [ 0, %468 ], [ %indvars.iv.next.i.i362, %471 ]
  %472 = phi %struct.VExp* [ null, %468 ], [ %473, %471 ]
  %473 = getelementptr inbounds %struct.VExp* %470, i64 %indvars.iv.i.i361
  %474 = getelementptr inbounds %struct.VExp* %470, i64 %indvars.iv.i.i361, i32 3
  %475 = bitcast %union.anon.1* %474 to %struct.VExp**
  store %struct.VExp* %472, %struct.VExp** %475, align 8, !tbaa !1
  %indvars.iv.next.i.i362 = add nuw nsw i64 %indvars.iv.i.i361, 1
  %exitcond.i.i363 = icmp eq i64 %indvars.iv.next.i.i362, 1000
  br i1 %exitcond.i.i363, label %.loopexit.i.i366, label %471

.loopexit.i.i366:                                 ; preds = %471
  %scevgep.i.i364 = getelementptr i8* %469, i64 55944
  %scevgep3.i.i365 = bitcast i8* %scevgep.i.i364 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i365, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit367

newVExpSyscall0.exit367:                          ; preds = %465, %.loopexit.i.i366
  %476 = phi %struct.VExp* [ %scevgep3.i.i365, %.loopexit.i.i366 ], [ %466, %465 ]
  %477 = getelementptr inbounds %struct.VExp* %476, i64 0, i32 4
  store i32 1, i32* %477, align 4, !tbaa !17
  %478 = getelementptr inbounds %struct.VExp* %476, i64 0, i32 3
  %479 = bitcast %union.anon.1* %478 to %struct.VExp**
  %480 = load %struct.VExp** %479, align 8, !tbaa !1
  store %struct.VExp* %480, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %481 = getelementptr inbounds %struct.VExp* %476, i64 0, i32 0
  store i32 5, i32* %481, align 4, !tbaa !15
  %482 = getelementptr inbounds %struct.VExp* %476, i64 0, i32 3, i32 0, i32 0
  store i32 7, i32* %482, align 4, !tbaa !25
  %483 = getelementptr inbounds %struct.VExp* %476, i64 0, i32 3, i32 0, i32 1
  store i32 0, i32* %483, align 4, !tbaa !23
  br label %502

; <label>:484                                     ; preds = %10, %19, %28, %37, %46, %55, %70, %77, %90, %103, %112, %113, %116
  %func_type.0.ph = phi i32 [ 0, %10 ], [ 1, %19 ], [ 2, %28 ], [ 3, %37 ], [ 4, %46 ], [ 6, %55 ], [ 8, %70 ], [ 5, %77 ], [ 7, %90 ], [ 10, %103 ], [ 9, %112 ], [ 13, %113 ], [ 12, %116 ]
  %485 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %486 = icmp eq %struct.VExp* %485, null
  br i1 %486, label %487, label %newVExpNumfunc.exit

; <label>:487                                     ; preds = %484
  %488 = tail call noalias i8* @malloc(i64 56000) #7
  %489 = bitcast i8* %488 to %struct.VExp*
  br label %490

; <label>:490                                     ; preds = %490, %487
  %indvars.iv.i.i368 = phi i64 [ 0, %487 ], [ %indvars.iv.next.i.i369, %490 ]
  %491 = phi %struct.VExp* [ null, %487 ], [ %492, %490 ]
  %492 = getelementptr inbounds %struct.VExp* %489, i64 %indvars.iv.i.i368
  %493 = getelementptr inbounds %struct.VExp* %489, i64 %indvars.iv.i.i368, i32 3
  %494 = bitcast %union.anon.1* %493 to %struct.VExp**
  store %struct.VExp* %491, %struct.VExp** %494, align 8, !tbaa !1
  %indvars.iv.next.i.i369 = add nuw nsw i64 %indvars.iv.i.i368, 1
  %exitcond.i.i370 = icmp eq i64 %indvars.iv.next.i.i369, 1000
  br i1 %exitcond.i.i370, label %.loopexit.i.i373, label %490

.loopexit.i.i373:                                 ; preds = %490
  %scevgep.i.i371 = getelementptr i8* %488, i64 55944
  %scevgep3.i.i372 = bitcast i8* %scevgep.i.i371 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i372, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNumfunc.exit

newVExpNumfunc.exit:                              ; preds = %484, %.loopexit.i.i373
  %495 = phi %struct.VExp* [ %scevgep3.i.i372, %.loopexit.i.i373 ], [ %485, %484 ]
  %496 = getelementptr inbounds %struct.VExp* %495, i64 0, i32 4
  store i32 1, i32* %496, align 4, !tbaa !17
  %497 = getelementptr inbounds %struct.VExp* %495, i64 0, i32 3
  %498 = bitcast %union.anon.1* %497 to %struct.VExp**
  %499 = load %struct.VExp** %498, align 8, !tbaa !1
  store %struct.VExp* %499, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %500 = getelementptr inbounds %struct.VExp* %495, i64 0, i32 0
  store i32 2, i32* %500, align 4, !tbaa !15
  %501 = getelementptr inbounds %struct.VExp* %495, i64 0, i32 3, i32 0, i32 0
  store i32 %func_type.0.ph, i32* %501, align 4, !tbaa !35
  br label %502

; <label>:502                                     ; preds = %462, %newVExpNumfunc.exit, %newVExpSyscall0.exit367, %newVExpSyscall0.exit360, %newVExpIntList.exit, %newVExpSyscall0.exit347, %newVExpSyscall0.exit340, %newVExpSyscall0.exit333, %newVExpApply.exit326, %newVExpSyscall0.exit304, %newVExpApply.exit297, %newVExpSyscall0.exit275, %newVExpApply.exit, %newVExpSyscall0.exit
  %.0 = phi %struct.VExp* [ %495, %newVExpNumfunc.exit ], [ %133, %newVExpSyscall0.exit ], [ %190, %newVExpApply.exit ], [ %211, %newVExpSyscall0.exit275 ], [ %268, %newVExpApply.exit297 ], [ %289, %newVExpSyscall0.exit304 ], [ %346, %newVExpApply.exit326 ], [ %367, %newVExpSyscall0.exit333 ], [ %389, %newVExpSyscall0.exit340 ], [ %411, %newVExpSyscall0.exit347 ], [ %433, %newVExpIntList.exit ], [ %454, %newVExpSyscall0.exit360 ], [ %476, %newVExpSyscall0.exit367 ], [ null, %462 ]
  ret %struct.VExp* %.0
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) #6

; Function Attrs: nounwind uwtable
define i32 @executeVExp(%struct.VExp* %exp, i32 %argc, i8** nocapture readonly %argv) #1 {
  %1 = load %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %2 = icmp eq %struct.Value* %1, null
  br i1 %2, label %3, label %newValue.exit

; <label>:3                                       ; preds = %0
  %4 = tail call noalias i8* @malloc(i64 40000) #7
  %5 = bitcast i8* %4 to %struct.Value*
  br label %6

; <label>:6                                       ; preds = %6, %3
  %indvars.iv.i.i = phi i64 [ 0, %3 ], [ %indvars.iv.next.i.i, %6 ]
  %7 = phi %struct.Value* [ null, %3 ], [ %8, %6 ]
  %8 = getelementptr inbounds %struct.Value* %5, i64 %indvars.iv.i.i
  %9 = getelementptr inbounds %struct.Value* %5, i64 %indvars.iv.i.i, i32 1, i32 0, i32 0
  %.c.i.i = bitcast %struct.Value* %7 to %struct.VExp*
  store %struct.VExp* %.c.i.i, %struct.VExp** %9, align 8, !tbaa !1
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %exitcond.i.i = icmp eq i64 %indvars.iv.next.i.i, 1000
  br i1 %exitcond.i.i, label %.loopexit.i.i, label %6

.loopexit.i.i:                                    ; preds = %6
  %scevgep.i.i = getelementptr i8* %4, i64 39960
  %scevgep4.i.i = bitcast i8* %scevgep.i.i to %struct.Value*
  store %struct.Value* %scevgep4.i.i, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  br label %newValue.exit

newValue.exit:                                    ; preds = %0, %.loopexit.i.i
  %10 = phi %struct.Value* [ %scevgep4.i.i, %.loopexit.i.i ], [ %1, %0 ]
  %11 = getelementptr inbounds %struct.Value* %10, i64 0, i32 2
  store i32 1, i32* %11, align 4, !tbaa !28
  %12 = getelementptr inbounds %struct.Value* %10, i64 0, i32 1
  %13 = bitcast %union.anon.0* %12 to %struct.Value**
  %14 = load %struct.Value** %13, align 8, !tbaa !1
  store %struct.Value* %14, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %15 = getelementptr inbounds %struct.Value* %10, i64 0, i32 0
  store i32 2, i32* %15, align 4, !tbaa !30
  %16 = load %struct.VContext** @allocateVContext.pool, align 8, !tbaa !1
  %17 = icmp eq %struct.VContext* %16, null
  br i1 %17, label %18, label %newVContext.exit

; <label>:18                                      ; preds = %newValue.exit
  %19 = tail call noalias i8* @malloc(i64 24000) #7
  %20 = bitcast i8* %19 to %struct.VContext*
  br label %21

; <label>:21                                      ; preds = %21, %18
  %indvars.iv.i.i1 = phi i64 [ 0, %18 ], [ %indvars.iv.next.i.i2, %21 ]
  %22 = phi %struct.VContext* [ null, %18 ], [ %23, %21 ]
  %23 = getelementptr inbounds %struct.VContext* %20, i64 %indvars.iv.i.i1
  %24 = getelementptr inbounds %struct.VContext* %20, i64 %indvars.iv.i.i1, i32 1
  store %struct.VContext* %22, %struct.VContext** %24, align 8, !tbaa !11
  %indvars.iv.next.i.i2 = add nuw nsw i64 %indvars.iv.i.i1, 1
  %exitcond.i.i3 = icmp eq i64 %indvars.iv.next.i.i2, 1000
  br i1 %exitcond.i.i3, label %.loopexit.i.i5, label %21

.loopexit.i.i5:                                   ; preds = %21
  %scevgep.i.i4 = getelementptr i8* %19, i64 23976
  %scevgep3.i.i = bitcast i8* %scevgep.i.i4 to %struct.VContext*
  store %struct.VContext* %scevgep3.i.i, %struct.VContext** @allocateVContext.pool, align 8, !tbaa !1
  br label %newVContext.exit

newVContext.exit:                                 ; preds = %newValue.exit, %.loopexit.i.i5
  %25 = phi %struct.VContext* [ %scevgep3.i.i, %.loopexit.i.i5 ], [ %16, %newValue.exit ]
  %26 = getelementptr inbounds %struct.VContext* %25, i64 0, i32 2
  store i32 1, i32* %26, align 4, !tbaa !13
  %27 = getelementptr inbounds %struct.VContext* %25, i64 0, i32 1
  %28 = load %struct.VContext** %27, align 8, !tbaa !11
  store %struct.VContext* %28, %struct.VContext** @allocateVContext.pool, align 8, !tbaa !1
  %29 = bitcast %struct.VContext* %25 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %29, i8 0, i64 16, i32 8, i1 false) #7
  %30 = tail call noalias i8* @malloc(i64 32) #7
  %31 = bitcast i8* %30 to %struct.Continuation*
  %32 = bitcast i8* %30 to i32*
  store i32 0, i32* %32, align 4, !tbaa !42
  %33 = getelementptr inbounds i8* %30, i64 8
  %34 = bitcast i8* %33 to %struct.VExp**
  store %struct.VExp* %exp, %struct.VExp** %34, align 8, !tbaa !18
  %35 = getelementptr inbounds i8* %30, i64 16
  %36 = bitcast i8* %35 to %struct.VContext**
  store %struct.VContext* %25, %struct.VContext** %36, align 8, !tbaa !20
  %37 = getelementptr inbounds %struct.Value* %10, i64 0, i32 1, i32 0, i32 0
  %38 = getelementptr inbounds %struct.Value* %10, i64 0, i32 1, i32 0, i32 2
  %39 = bitcast %struct.VExp** %37 to i8*
  call void @llvm.memset.p0i8.i64(i8* %39, i8 0, i64 16, i32 8, i1 false)
  store %struct.Continuation* %31, %struct.Continuation** %38, align 8, !tbaa !34
  %40 = tail call i32 @executeValue(%struct.Value* %10, i32 %argc, i8** %argv)
  ret i32 %40
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #7

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #7

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)"}
!1 = metadata !{metadata !2, metadata !2, i64 0}
!2 = metadata !{metadata !"any pointer", metadata !3, i64 0}
!3 = metadata !{metadata !"omnipotent char", metadata !4, i64 0}
!4 = metadata !{metadata !"Simple C/C++ TBAA"}
!5 = metadata !{metadata !6, metadata !2, i64 8}
!6 = metadata !{metadata !"IntList", metadata !7, i64 0, metadata !2, i64 8, metadata !7, i64 16}
!7 = metadata !{metadata !"int", metadata !3, i64 0}
!8 = metadata !{metadata !6, metadata !7, i64 16}
!9 = metadata !{metadata !6, metadata !7, i64 0}
!10 = metadata !{metadata !3, metadata !3, i64 0}
!11 = metadata !{metadata !12, metadata !2, i64 8}
!12 = metadata !{metadata !"VContext", metadata !2, i64 0, metadata !2, i64 8, metadata !7, i64 16}
!13 = metadata !{metadata !12, metadata !7, i64 16}
!14 = metadata !{metadata !12, metadata !2, i64 0}
!15 = metadata !{metadata !16, metadata !3, i64 0}
!16 = metadata !{metadata !"VExp", metadata !3, i64 0, metadata !3, i64 4, metadata !3, i64 8, metadata !3, i64 16, metadata !7, i64 48}
!17 = metadata !{metadata !16, metadata !7, i64 48}
!18 = metadata !{metadata !19, metadata !2, i64 0}
!19 = metadata !{metadata !"", metadata !2, i64 0, metadata !2, i64 8}
!20 = metadata !{metadata !19, metadata !2, i64 8}
!21 = metadata !{metadata !22, metadata !2, i64 0}
!22 = metadata !{metadata !"", metadata !2, i64 0}
!23 = metadata !{metadata !24, metadata !7, i64 4}
!24 = metadata !{metadata !"", metadata !3, i64 0, metadata !7, i64 4, metadata !3, i64 8, metadata !7, i64 16, metadata !2, i64 24}
!25 = metadata !{metadata !24, metadata !3, i64 0}
!26 = metadata !{metadata !7, metadata !7, i64 0}
!27 = metadata !{metadata !24, metadata !2, i64 24}
!28 = metadata !{metadata !29, metadata !7, i64 32}
!29 = metadata !{metadata !"Value", metadata !3, i64 0, metadata !3, i64 8, metadata !7, i64 32}
!30 = metadata !{metadata !29, metadata !3, i64 0}
!31 = metadata !{metadata !32, metadata !2, i64 0}
!32 = metadata !{metadata !"", metadata !2, i64 0, metadata !2, i64 8, metadata !2, i64 16}
!33 = metadata !{metadata !32, metadata !2, i64 8}
!34 = metadata !{metadata !32, metadata !2, i64 16}
!35 = metadata !{metadata !36, metadata !3, i64 0}
!36 = metadata !{metadata !"", metadata !3, i64 0}
!37 = metadata !{metadata !38, metadata !3, i64 0}
!38 = metadata !{metadata !"", metadata !3, i64 0, metadata !39, i64 8}
!39 = metadata !{metadata !"Number", metadata !3, i64 0, metadata !3, i64 8}
!40 = metadata !{metadata !39, metadata !3, i64 0}
!41 = metadata !{metadata !24, metadata !7, i64 16}
!42 = metadata !{metadata !43, metadata !3, i64 0}
!43 = metadata !{metadata !"Continuation", metadata !3, i64 0, metadata !3, i64 8, metadata !2, i64 24}
!44 = metadata !{metadata !43, metadata !2, i64 24}
!45 = metadata !{metadata !46, metadata !46, i64 0}
!46 = metadata !{metadata !"double", metadata !3, i64 0}
!47 = metadata !{metadata !48, metadata !2, i64 0}
!48 = metadata !{metadata !"ValueStack", metadata !2, i64 0, metadata !2, i64 8}
!49 = metadata !{metadata !48, metadata !2, i64 8}
!50 = metadata !{metadata !50, metadata !51, metadata !52}
!51 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!52 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!53 = metadata !{metadata !53, metadata !51, metadata !52}
