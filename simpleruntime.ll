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
%struct.ValueStack = type { %union.anon.11 }
%union.anon.11 = type { %struct.anon.12 }
%struct.anon.12 = type { %struct.Value*, %struct.ValueStack* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [16 x i8] c"divided by zero\00", align 1
@.str1 = private unnamed_addr constant [36 x i8] c"cannot use non-integer value in mod\00", align 1
@allocateIntList.pool = internal unnamed_addr global %struct.IntList* null, align 8
@syscall_arginfo = constant [8 x [4 x i32]] [[4 x i32] [i32 1, i32 0, i32 -1, i32 -1], [4 x i32] [i32 3, i32 1, i32 0, i32 2], [4 x i32] [i32 2, i32 0, i32 2, i32 -1], [4 x i32] [i32 2, i32 0, i32 2, i32 -1], [4 x i32] [i32 3, i32 0, i32 0, i32 2], [4 x i32] [i32 2, i32 0, i32 2, i32 -1], [4 x i32] [i32 1, i32 2, i32 -1, i32 -1], [4 x i32] [i32 2, i32 1, i32 2, i32 -1]], align 16
@allocateVContext.pool = internal unnamed_addr global %struct.VContext* null, align 8
@allocateContinuation.pool = internal unnamed_addr global %struct.Continuation* null, align 8
@funcNames.names = internal unnamed_addr constant [14 x i8*] [i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str7, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str8, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str10, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str11, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str12, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8]* @.str14, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str15, i32 0, i32 0)], align 16
@.str2 = private unnamed_addr constant [2 x i8] c"+\00", align 1
@.str3 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str4 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@.str5 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@.str6 = private unnamed_addr constant [2 x i8] c"%\00", align 1
@.str7 = private unnamed_addr constant [2 x i8] c">\00", align 1
@.str8 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@.str9 = private unnamed_addr constant [3 x i8] c"<=\00", align 1
@.str10 = private unnamed_addr constant [3 x i8] c">=\00", align 1
@.str11 = private unnamed_addr constant [3 x i8] c"==\00", align 1
@.str12 = private unnamed_addr constant [3 x i8] c"/=\00", align 1
@.str13 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str14 = private unnamed_addr constant [8 x i8] c"toFloat\00", align 1
@.str15 = private unnamed_addr constant [6 x i8] c"toInt\00", align 1
@syscallNames.names = internal unnamed_addr constant [8 x i8*] [i8* getelementptr inbounds ([5 x i8]* @.str16, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str18, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str19, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str20, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @.str21, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str22, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @.str23, i32 0, i32 0)], align 16
@.str16 = private unnamed_addr constant [5 x i8] c"exit\00", align 1
@.str17 = private unnamed_addr constant [8 x i8] c"openCmd\00", align 1
@.str18 = private unnamed_addr constant [6 x i8] c"close\00", align 1
@.str19 = private unnamed_addr constant [9 x i8] c"getCharF\00", align 1
@.str20 = private unnamed_addr constant [9 x i8] c"putCharF\00", align 1
@.str21 = private unnamed_addr constant [10 x i8] c"peekCharF\00", align 1
@.str22 = private unnamed_addr constant [7 x i8] c"getArg\00", align 1
@.str23 = private unnamed_addr constant [10 x i8] c"systemCmd\00", align 1
@.str24 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str25 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str26 = private unnamed_addr constant [7 x i8] c"(\5Cv%d \00", align 1
@.str28 = private unnamed_addr constant [4 x i8] c"v%d\00", align 1
@.str31 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str32 = private unnamed_addr constant [5 x i8] c"(%s \00", align 1
@.str33 = private unnamed_addr constant [13 x i8] c"(makeIntList\00", align 1
@.str34 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str35 = private unnamed_addr constant [4 x i8] c"(%s\00", align 1
@.str36 = private unnamed_addr constant [14 x i8] c" (makeIntList\00", align 1
@.str37 = private unnamed_addr constant [5 x i8] c" ...\00", align 1
@allocateVExp.pool = internal unnamed_addr global %struct.VExp* null, align 8
@allocateValue.pool = internal unnamed_addr global %struct.Value* null, align 8
@allocateValueStack.pool = internal unnamed_addr global %struct.ValueStack* null, align 8
@.str38 = private unnamed_addr constant [30 x i8] c"too many arguments to syscall\00", align 1
@.str39 = private unnamed_addr constant [42 x i8] c"cannot apply non-integer value to syscall\00", align 1
@.str40 = private unnamed_addr constant [42 x i8] c"cannot apply non-intlist value to syscall\00", align 1
@incCounter.count = internal unnamed_addr global i64 0, align 8
@incCounter.unit = internal unnamed_addr global i64 262144, align 8
@stderr = external global %struct._IO_FILE*
@.str41 = private unnamed_addr constant [11 x i8] c"count=%ld\0A\00", align 1
@.str42 = private unnamed_addr constant [37 x i8] c"cannot use numeric value as function\00", align 1
@.str43 = private unnamed_addr constant [52 x i8] c"cannot apply built-in function on non-numeric value\00", align 1
@.str44 = private unnamed_addr constant [44 x i8] c"cannot append non-integer number to IntList\00", align 1
@stdin = external global %struct._IO_FILE*
@stdout = external global %struct._IO_FILE*
@.str45 = private unnamed_addr constant [15 x i8] c"exception: %s\0A\00", align 1
@.str47 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str48 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str49 = private unnamed_addr constant [3 x i8] c"ab\00", align 1
@.str50 = private unnamed_addr constant [4 x i8] c"rwb\00", align 1
@.str52 = private unnamed_addr constant [8 x i8] c"putChar\00", align 1
@.str53 = private unnamed_addr constant [8 x i8] c"getChar\00", align 1
@.str54 = private unnamed_addr constant [9 x i8] c"peekChar\00", align 1
@.str55 = private unnamed_addr constant [12 x i8] c"makeIntList\00", align 1
@str = private unnamed_addr constant [45 x i8] c"exception: insufficient arguments to syscall\00"
@switch.table = private unnamed_addr constant [4 x i8*] [i8* getelementptr inbounds ([3 x i8]* @.str47, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str48, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str49, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8]* @.str50, i64 0, i64 0)]

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
  br label %24

; <label>:7                                       ; preds = %3
  %8 = trunc i64 %a.coerce1 to i32
  %9 = sitofp i32 %8 to double
  %10 = bitcast i64 %b.coerce1 to double
  %11 = fadd double %9, %10
  %12 = bitcast double %11 to i64
  br label %24

; <label>:13                                      ; preds = %0
  %14 = bitcast i64 %a.coerce1 to double
  br i1 %2, label %15, label %20

; <label>:15                                      ; preds = %13
  %16 = trunc i64 %b.coerce1 to i32
  %17 = sitofp i32 %16 to double
  %18 = fadd double %14, %17
  %19 = bitcast double %18 to i64
  br label %24

; <label>:20                                      ; preds = %13
  %21 = bitcast i64 %b.coerce1 to double
  %22 = fadd double %14, %21
  %23 = bitcast double %22 to i64
  br label %24

; <label>:24                                      ; preds = %20, %15, %7, %4
  %.sroa.0.0 = phi i32 [ 0, %4 ], [ 1, %7 ], [ 1, %15 ], [ 1, %20 ]
  %.sroa.5.0 = phi i64 [ %6, %4 ], [ %12, %7 ], [ %19, %15 ], [ %23, %20 ]
  %25 = insertvalue { i32, i64 } undef, i32 %.sroa.0.0, 0
  %26 = insertvalue { i32, i64 } %25, i64 %.sroa.5.0, 1
  ret { i32, i64 } %26
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
  br label %24

; <label>:7                                       ; preds = %3
  %8 = trunc i64 %a.coerce1 to i32
  %9 = sitofp i32 %8 to double
  %10 = bitcast i64 %b.coerce1 to double
  %11 = fsub double %9, %10
  %12 = bitcast double %11 to i64
  br label %24

; <label>:13                                      ; preds = %0
  %14 = bitcast i64 %a.coerce1 to double
  br i1 %2, label %15, label %20

; <label>:15                                      ; preds = %13
  %16 = trunc i64 %b.coerce1 to i32
  %17 = sitofp i32 %16 to double
  %18 = fsub double %14, %17
  %19 = bitcast double %18 to i64
  br label %24

; <label>:20                                      ; preds = %13
  %21 = bitcast i64 %b.coerce1 to double
  %22 = fsub double %14, %21
  %23 = bitcast double %22 to i64
  br label %24

; <label>:24                                      ; preds = %20, %15, %7, %4
  %.sroa.0.0 = phi i32 [ 0, %4 ], [ 1, %7 ], [ 1, %15 ], [ 1, %20 ]
  %.sroa.5.0 = phi i64 [ %6, %4 ], [ %12, %7 ], [ %19, %15 ], [ %23, %20 ]
  %25 = insertvalue { i32, i64 } undef, i32 %.sroa.0.0, 0
  %26 = insertvalue { i32, i64 } %25, i64 %.sroa.5.0, 1
  ret { i32, i64 } %26
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
  br label %24

; <label>:7                                       ; preds = %3
  %8 = trunc i64 %a.coerce1 to i32
  %9 = sitofp i32 %8 to double
  %10 = bitcast i64 %b.coerce1 to double
  %11 = fmul double %9, %10
  %12 = bitcast double %11 to i64
  br label %24

; <label>:13                                      ; preds = %0
  %14 = bitcast i64 %a.coerce1 to double
  br i1 %2, label %15, label %20

; <label>:15                                      ; preds = %13
  %16 = trunc i64 %b.coerce1 to i32
  %17 = sitofp i32 %16 to double
  %18 = fmul double %14, %17
  %19 = bitcast double %18 to i64
  br label %24

; <label>:20                                      ; preds = %13
  %21 = bitcast i64 %b.coerce1 to double
  %22 = fmul double %14, %21
  %23 = bitcast double %22 to i64
  br label %24

; <label>:24                                      ; preds = %20, %15, %7, %4
  %.sroa.0.0 = phi i32 [ 0, %4 ], [ 1, %7 ], [ 1, %15 ], [ 1, %20 ]
  %.sroa.5.0 = phi i64 [ %6, %4 ], [ %12, %7 ], [ %19, %15 ], [ %23, %20 ]
  %25 = insertvalue { i32, i64 } undef, i32 %.sroa.0.0, 0
  %26 = insertvalue { i32, i64 } %25, i64 %.sroa.5.0, 1
  ret { i32, i64 } %26
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
  br label %31

; <label>:8                                       ; preds = %4
  %9 = trunc i64 %a.coerce1 to i32
  %10 = sdiv i32 %9, %5
  %phitmp8 = zext i32 %10 to i64
  br label %31

; <label>:11                                      ; preds = %3
  %12 = trunc i64 %a.coerce1 to i32
  %13 = sitofp i32 %12 to double
  %14 = bitcast i64 %b.coerce1 to double
  %15 = fdiv double %13, %14
  %16 = bitcast double %15 to i64
  br label %31

; <label>:17                                      ; preds = %0
  br i1 %2, label %18, label %26

; <label>:18                                      ; preds = %17
  %19 = trunc i64 %b.coerce1 to i32
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %18
  store i8* getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), i8** %msg, align 8, !tbaa !1
  br label %31

; <label>:22                                      ; preds = %18
  %23 = bitcast i64 %a.coerce1 to double
  %24 = sitofp i32 %19 to double
  %25 = fdiv double %23, %24
  %phitmp = bitcast double %25 to i64
  br label %31

; <label>:26                                      ; preds = %17
  %27 = bitcast i64 %a.coerce1 to double
  %28 = bitcast i64 %b.coerce1 to double
  %29 = fdiv double %27, %28
  %30 = bitcast double %29 to i64
  br label %31

; <label>:31                                      ; preds = %21, %22, %7, %8, %26, %11
  %.sroa.0.0 = phi i32 [ 1, %11 ], [ 1, %26 ], [ 0, %8 ], [ 0, %7 ], [ 1, %22 ], [ 1, %21 ]
  %.sroa.9.0 = phi i64 [ %16, %11 ], [ %30, %26 ], [ %phitmp8, %8 ], [ 0, %7 ], [ %phitmp, %22 ], [ undef, %21 ]
  %32 = insertvalue { i32, i64 } undef, i32 %.sroa.0.0, 0
  %33 = insertvalue { i32, i64 } %32, i64 %.sroa.9.0, 1
  ret { i32, i64 } %33
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
  %14 = getelementptr inbounds %struct.VContext* %10, i64 0, i32 0
  store %struct.Value* %v, %struct.Value** %14, align 8, !tbaa !14
  store %struct.VContext* %context, %struct.VContext** %12, align 8, !tbaa !11
  ret %struct.VContext* %10
}

; Function Attrs: nounwind uwtable
define %struct.Continuation* @allocateContinuation(%struct.Continuation* %p) #1 {
  %1 = icmp eq %struct.Continuation* %p, null
  %2 = load %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  br i1 %1, label %3, label %16

; <label>:3                                       ; preds = %0
  %4 = icmp eq %struct.Continuation* %2, null
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %3
  %6 = tail call noalias i8* @malloc(i64 32000) #7
  %7 = bitcast i8* %6 to %struct.Continuation*
  %scevgep = getelementptr i8* %6, i64 31968
  br label %8

; <label>:8                                       ; preds = %8, %5
  %indvars.iv = phi i64 [ 0, %5 ], [ %indvars.iv.next, %8 ]
  %9 = phi %struct.Continuation* [ null, %5 ], [ %10, %8 ]
  %10 = getelementptr inbounds %struct.Continuation* %7, i64 %indvars.iv
  %11 = getelementptr inbounds %struct.Continuation* %7, i64 %indvars.iv, i32 2
  store %struct.Continuation* %9, %struct.Continuation** %11, align 8, !tbaa !15
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %.loopexit, label %8

.loopexit:                                        ; preds = %8
  %scevgep3 = bitcast i8* %scevgep to %struct.Continuation*
  store %struct.Continuation* %scevgep3, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  br label %12

; <label>:12                                      ; preds = %.loopexit, %3
  %13 = phi %struct.Continuation* [ %scevgep3, %.loopexit ], [ %2, %3 ]
  %14 = getelementptr inbounds %struct.Continuation* %13, i64 0, i32 2
  %15 = load %struct.Continuation** %14, align 8, !tbaa !15
  br label %18

; <label>:16                                      ; preds = %0
  %17 = getelementptr inbounds %struct.Continuation* %p, i64 0, i32 2
  store %struct.Continuation* %2, %struct.Continuation** %17, align 8, !tbaa !15
  br label %18

; <label>:18                                      ; preds = %16, %12
  %storemerge = phi %struct.Continuation* [ %15, %12 ], [ %p, %16 ]
  %.0 = phi %struct.Continuation* [ %13, %12 ], [ null, %16 ]
  store %struct.Continuation* %storemerge, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  ret %struct.Continuation* %.0
}

; Function Attrs: nounwind uwtable
define noalias %struct.Continuation* @releaseContinuationSingle(%struct.Continuation* %p) #1 {
  %1 = icmp eq %struct.Continuation* %p, null
  br i1 %1, label %19, label %2

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.Continuation* %p, i64 0, i32 0
  %4 = load i32* %3, align 4, !tbaa !17
  switch i32 %4, label %allocateContinuation.exit [
    i32 0, label %5
    i32 1, label %12
  ]

; <label>:5                                       ; preds = %2
  %6 = getelementptr inbounds %struct.Continuation* %p, i64 0, i32 1, i32 0, i32 0
  %7 = load %struct.VExp** %6, align 8, !tbaa !18
  %8 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %7)
  %9 = getelementptr inbounds %struct.Continuation* %p, i64 0, i32 1, i32 0, i32 1
  %10 = load %struct.VContext** %9, align 8, !tbaa !20
  %11 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %10)
  br label %allocateContinuation.exit

; <label>:12                                      ; preds = %2
  %13 = getelementptr inbounds %struct.Continuation* %p, i64 0, i32 1
  %14 = bitcast %union.anon.8* %13 to %struct.Value**
  %15 = load %struct.Value** %14, align 8, !tbaa !21
  %16 = tail call %struct.Value* @releaseValue(%struct.Value* %15)
  br label %allocateContinuation.exit

allocateContinuation.exit:                        ; preds = %5, %12, %2
  %17 = load %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  %18 = getelementptr inbounds %struct.Continuation* %p, i64 0, i32 2
  store %struct.Continuation* %17, %struct.Continuation** %18, align 8, !tbaa !15
  store %struct.Continuation* %p, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  br label %19

; <label>:19                                      ; preds = %0, %allocateContinuation.exit
  ret %struct.Continuation* null
}

; Function Attrs: nounwind uwtable
define noalias %struct.VExp* @releaseVExp(%struct.VExp* %p) #1 {
  %1 = icmp eq %struct.VExp* %p, null
  br i1 %1, label %58, label %2

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.VExp* %p, i64 0, i32 4
  %4 = load i32* %3, align 4, !tbaa !23
  %5 = add nsw i32 %4, -1
  store i32 %5, i32* %3, align 4, !tbaa !23
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %58

; <label>:7                                       ; preds = %2
  %8 = getelementptr inbounds %struct.VExp* %p, i64 0, i32 0
  %9 = load i32* %8, align 4, !tbaa !25
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
  %31 = load i32* %30, align 4, !tbaa !26
  %32 = icmp sgt i32 %31, 0
  %33 = getelementptr inbounds %struct.VExp* %p, i64 0, i32 3, i32 0, i32 0
  br i1 %32, label %34, label %._crit_edge

; <label>:34                                      ; preds = %29
  %35 = load i32* %33, align 4, !tbaa !28
  switch i32 %35, label %._crit_edge [
    i32 7, label %36
    i32 1, label %36
  ]

; <label>:36                                      ; preds = %34, %34
  %37 = getelementptr inbounds %struct.VExp* %p, i64 0, i32 3, i32 0, i32 2, i32 0
  %38 = load %struct.IntList** %37, align 8, !tbaa !1
  %39 = tail call %struct.IntList* @releaseIntList(%struct.IntList* %38)
  %.pre = load i32* %30, align 4, !tbaa !26
  br label %._crit_edge

._crit_edge:                                      ; preds = %29, %34, %36
  %40 = phi i32 [ %31, %34 ], [ %.pre, %36 ], [ %31, %29 ]
  %41 = load i32* %33, align 4, !tbaa !28
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds [8 x [4 x i32]]* @syscall_arginfo, i64 0, i64 %42, i64 0
  %44 = load i32* %43, align 16, !tbaa !29
  %45 = icmp eq i32 %40, %44
  br i1 %45, label %46, label %allocateVExp.exit

; <label>:46                                      ; preds = %._crit_edge
  %47 = sext i32 %40 to i64
  %48 = getelementptr inbounds [8 x [4 x i32]]* @syscall_arginfo, i64 0, i64 %42, i64 %47
  %49 = load i32* %48, align 4, !tbaa !29
  %50 = icmp eq i32 %49, 2
  br i1 %50, label %51, label %allocateVExp.exit

; <label>:51                                      ; preds = %46
  %52 = getelementptr inbounds %struct.VExp* %p, i64 0, i32 3, i32 0, i32 4
  %53 = load %struct.Value** %52, align 8, !tbaa !30
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
  br i1 %1, label %33, label %2

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.Value* %p, i64 0, i32 2
  %4 = load i32* %3, align 4, !tbaa !31
  %5 = add nsw i32 %4, -1
  store i32 %5, i32* %3, align 4, !tbaa !31
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %33

; <label>:7                                       ; preds = %2
  %8 = getelementptr inbounds %struct.Value* %p, i64 0, i32 0
  %9 = load i32* %8, align 4, !tbaa !33
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
  %19 = load %struct.VExp** %18, align 8, !tbaa !34
  %20 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %19)
  %21 = getelementptr inbounds %struct.Value* %p, i64 0, i32 1, i32 0, i32 1
  %22 = load %struct.VContext** %21, align 8, !tbaa !36
  %23 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %22)
  %24 = getelementptr inbounds %struct.Value* %p, i64 0, i32 1, i32 0, i32 2
  %25 = load %struct.Continuation** %24, align 8, !tbaa !37
  %26 = icmp eq %struct.Continuation* %25, null
  br i1 %26, label %allocateValue.exit, label %.lr.ph

.lr.ph:                                           ; preds = %17, %.lr.ph
  %.0.i12 = phi %struct.Continuation* [ %28, %.lr.ph ], [ %25, %17 ]
  %27 = getelementptr inbounds %struct.Continuation* %.0.i12, i64 0, i32 2
  %28 = load %struct.Continuation** %27, align 8, !tbaa !15
  %29 = tail call %struct.Continuation* @releaseContinuationSingle(%struct.Continuation* %.0.i12) #7
  %30 = icmp eq %struct.Continuation* %28, null
  br i1 %30, label %allocateValue.exit, label %.lr.ph

allocateValue.exit:                               ; preds = %.lr.ph, %17, %7, %10
  %31 = load %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %32 = getelementptr inbounds %struct.Value* %p, i64 0, i32 1, i32 0, i32 0
  %.c2.i = bitcast %struct.Value* %31 to %struct.VExp*
  store %struct.VExp* %.c2.i, %struct.VExp** %32, align 8, !tbaa !1
  store %struct.Value* %p, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  br label %33

; <label>:33                                      ; preds = %0, %2, %allocateValue.exit
  ret %struct.Value* null
}

; Function Attrs: nounwind uwtable
define noalias %struct.Continuation* @releaseContinuation(%struct.Continuation* %p) #1 {
  %1 = icmp eq %struct.Continuation* %p, null
  br i1 %1, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %0, %.lr.ph
  %.01 = phi %struct.Continuation* [ %3, %.lr.ph ], [ %p, %0 ]
  %2 = getelementptr inbounds %struct.Continuation* %.01, i64 0, i32 2
  %3 = load %struct.Continuation** %2, align 8, !tbaa !15
  %4 = tail call %struct.Continuation* @releaseContinuationSingle(%struct.Continuation* %.01)
  %5 = icmp eq %struct.Continuation* %3, null
  br i1 %5, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph, %0
  ret %struct.Continuation* null
}

; Function Attrs: nounwind readnone uwtable
define i8* @funcNames(i32 %ft) #0 {
  %1 = zext i32 %ft to i64
  %2 = getelementptr inbounds [14 x i8*]* @funcNames.names, i64 0, i64 %1
  %3 = load i8** %2, align 8, !tbaa !1
  ret i8* %3
}

; Function Attrs: nounwind readnone uwtable
define i8* @syscallNames(i32 %st) #0 {
  %1 = zext i32 %st to i64
  %2 = getelementptr inbounds [8 x i8*]* @syscallNames.names, i64 0, i64 %1
  %3 = load i8** %2, align 8, !tbaa !1
  ret i8* %3
}

; Function Attrs: nounwind uwtable
define void @displayNumber(i32 %a.coerce0, i64 %a.coerce1) #1 {
  %1 = icmp eq i32 %a.coerce0, 0
  br i1 %1, label %2, label %5

; <label>:2                                       ; preds = %0
  %3 = trunc i64 %a.coerce1 to i32
  %4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str24, i64 0, i64 0), i32 %3) #7
  br label %8

; <label>:5                                       ; preds = %0
  %6 = bitcast i64 %a.coerce1 to double
  %7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str25, i64 0, i64 0), double %6) #7
  br label %8

; <label>:8                                       ; preds = %5, %2
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define void @displayExpRecursive(%struct.VExp* nocapture readonly %e, i32 %level) #1 {
  %1 = getelementptr inbounds %struct.VExp* %e, i64 0, i32 0
  %2 = load i32* %1, align 4, !tbaa !25
  switch i32 %2, label %displayNumber.exit [
    i32 0, label %3
    i32 1, label %16
    i32 7, label %22
    i32 8, label %28
    i32 2, label %35
    i32 3, label %42
    i32 4, label %62
    i32 5, label %72
  ]

; <label>:3                                       ; preds = %0
  %4 = getelementptr inbounds %struct.VExp* %e, i64 0, i32 3, i32 0, i32 0
  %5 = load i32* %4, align 1
  %6 = getelementptr %struct.VExp* %e, i64 0, i32 3, i32 0, i32 2
  %7 = bitcast %union.SyscallArg* %6 to i64*
  %8 = load i64* %7, align 1
  %9 = icmp eq i32 %5, 0
  br i1 %9, label %10, label %13

; <label>:10                                      ; preds = %3
  %11 = trunc i64 %8 to i32
  %12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str24, i64 0, i64 0), i32 %11) #7
  br label %displayNumber.exit

; <label>:13                                      ; preds = %3
  %14 = bitcast i64 %8 to double
  %15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str25, i64 0, i64 0), double %14) #7
  br label %displayNumber.exit

; <label>:16                                      ; preds = %0
  %17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str26, i64 0, i64 0), i32 %level) #7
  %18 = getelementptr inbounds %struct.VExp* %e, i64 0, i32 3
  %19 = bitcast %union.anon.1* %18 to %struct.VExp**
  %20 = load %struct.VExp** %19, align 8, !tbaa !1
  %21 = add nsw i32 %level, 1
  tail call void @displayExpRecursive(%struct.VExp* %20, i32 %21)
  %putchar11 = tail call i32 @putchar(i32 41) #7
  ret void

; <label>:22                                      ; preds = %0
  %23 = add nsw i32 %level, -1
  %24 = getelementptr inbounds %struct.VExp* %e, i64 0, i32 3, i32 0, i32 0
  %25 = load i32* %24, align 4, !tbaa !29
  %26 = sub i32 %23, %25
  %27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str28, i64 0, i64 0), i32 %26) #7
  br label %displayNumber.exit

; <label>:28                                      ; preds = %0
  %putchar8 = tail call i32 @putchar(i32 40) #7
  %29 = getelementptr inbounds %struct.VExp* %e, i64 0, i32 3
  %30 = bitcast %union.anon.1* %29 to %struct.VExp**
  %31 = load %struct.VExp** %30, align 8, !tbaa !18
  tail call void @displayExpRecursive(%struct.VExp* %31, i32 %level)
  %putchar9 = tail call i32 @putchar(i32 32) #7
  %32 = getelementptr inbounds %struct.VExp* %e, i64 0, i32 3, i32 0, i32 2
  %33 = bitcast %union.SyscallArg* %32 to %struct.VExp**
  %34 = load %struct.VExp** %33, align 8, !tbaa !20
  tail call void @displayExpRecursive(%struct.VExp* %34, i32 %level)
  %putchar10 = tail call i32 @putchar(i32 41) #7
  ret void

; <label>:35                                      ; preds = %0
  %36 = getelementptr inbounds %struct.VExp* %e, i64 0, i32 3, i32 0, i32 0
  %37 = load i32* %36, align 4, !tbaa !38
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds [14 x i8*]* @funcNames.names, i64 0, i64 %38
  %40 = load i8** %39, align 8, !tbaa !1
  %41 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str31, i64 0, i64 0), i8* %40) #7
  br label %displayNumber.exit

; <label>:42                                      ; preds = %0
  %43 = getelementptr inbounds %struct.VExp* %e, i64 0, i32 3, i32 0, i32 0
  %44 = load i32* %43, align 4, !tbaa !40
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds [14 x i8*]* @funcNames.names, i64 0, i64 %45
  %47 = load i8** %46, align 8, !tbaa !1
  %48 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str32, i64 0, i64 0), i8* %47) #7
  %49 = getelementptr inbounds %struct.VExp* %e, i64 0, i32 3, i32 0, i32 2
  %50 = bitcast %union.SyscallArg* %49 to i32*
  %51 = load i32* %50, align 1
  %52 = getelementptr %union.SyscallArg* %49, i64 1
  %53 = bitcast %union.SyscallArg* %52 to i64*
  %54 = load i64* %53, align 1
  %55 = icmp eq i32 %51, 0
  br i1 %55, label %56, label %59

; <label>:56                                      ; preds = %42
  %57 = trunc i64 %54 to i32
  %58 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str24, i64 0, i64 0), i32 %57) #7
  br label %displayNumber.exit12

; <label>:59                                      ; preds = %42
  %60 = bitcast i64 %54 to double
  %61 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str25, i64 0, i64 0), double %60) #7
  br label %displayNumber.exit12

displayNumber.exit12:                             ; preds = %56, %59
  %putchar7 = tail call i32 @putchar(i32 41) #7
  br label %displayNumber.exit

; <label>:62                                      ; preds = %0
  %63 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str33, i64 0, i64 0)) #7
  %64 = getelementptr inbounds %struct.VExp* %e, i64 0, i32 3
  %65 = bitcast %union.anon.1* %64 to %struct.IntList**
  %p.013 = load %struct.IntList** %65, align 8
  %66 = icmp eq %struct.IntList* %p.013, null
  br i1 %66, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %62, %.lr.ph
  %p.014 = phi %struct.IntList* [ %p.0, %.lr.ph ], [ %p.013, %62 ]
  %67 = getelementptr inbounds %struct.IntList* %p.014, i64 0, i32 0
  %68 = load i32* %67, align 4, !tbaa !9
  %69 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str34, i64 0, i64 0), i32 %68) #7
  %70 = getelementptr inbounds %struct.IntList* %p.014, i64 0, i32 1
  %p.0 = load %struct.IntList** %70, align 8
  %71 = icmp eq %struct.IntList* %p.0, null
  br i1 %71, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph, %62
  %putchar6 = tail call i32 @putchar(i32 41) #7
  br label %displayNumber.exit

; <label>:72                                      ; preds = %0
  %73 = getelementptr inbounds %struct.VExp* %e, i64 0, i32 3, i32 0, i32 0
  %74 = load i32* %73, align 4, !tbaa !28
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds [8 x i8*]* @syscallNames.names, i64 0, i64 %75
  %77 = load i8** %76, align 8, !tbaa !1
  %78 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str35, i64 0, i64 0), i8* %77) #7
  %79 = load i32* %73, align 4, !tbaa !28
  %80 = getelementptr inbounds %struct.VExp* %e, i64 0, i32 3, i32 0, i32 1
  %81 = load i32* %80, align 4, !tbaa !26
  %82 = icmp sgt i32 %81, 0
  br i1 %82, label %switch.early.test, label %102

switch.early.test:                                ; preds = %72
  switch i32 %79, label %83 [
    i32 6, label %102
    i32 0, label %102
  ]

; <label>:83                                      ; preds = %switch.early.test
  %84 = zext i32 %79 to i64
  %85 = lshr i64 61, %84
  %86 = and i64 %85, 1
  %87 = icmp eq i64 %86, 0
  br i1 %87, label %93, label %88

; <label>:88                                      ; preds = %83
  %89 = getelementptr inbounds %struct.VExp* %e, i64 0, i32 3, i32 0, i32 2
  %90 = bitcast %union.SyscallArg* %89 to i32*
  %91 = load i32* %90, align 4, !tbaa !29
  %92 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str34, i64 0, i64 0), i32 %91) #7
  br label %102

; <label>:93                                      ; preds = %83
  %94 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str36, i64 0, i64 0)) #7
  %95 = getelementptr inbounds %struct.VExp* %e, i64 0, i32 3, i32 0, i32 2, i32 0
  %p1.015 = load %struct.IntList** %95, align 8
  %96 = icmp eq %struct.IntList* %p1.015, null
  br i1 %96, label %._crit_edge19, label %.lr.ph18

.lr.ph18:                                         ; preds = %93, %.lr.ph18
  %p1.016 = phi %struct.IntList* [ %p1.0, %.lr.ph18 ], [ %p1.015, %93 ]
  %97 = getelementptr inbounds %struct.IntList* %p1.016, i64 0, i32 0
  %98 = load i32* %97, align 4, !tbaa !9
  %99 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str34, i64 0, i64 0), i32 %98) #7
  %100 = getelementptr inbounds %struct.IntList* %p1.016, i64 0, i32 1
  %p1.0 = load %struct.IntList** %100, align 8
  %101 = icmp eq %struct.IntList* %p1.0, null
  br i1 %101, label %._crit_edge19, label %.lr.ph18

._crit_edge19:                                    ; preds = %.lr.ph18, %93
  %putchar5 = tail call i32 @putchar(i32 41) #7
  br label %102

; <label>:102                                     ; preds = %switch.early.test, %switch.early.test, %72, %88, %._crit_edge19
  %103 = load i32* %80, align 4, !tbaa !26
  %104 = icmp sgt i32 %103, 1
  %105 = icmp eq i32 %79, 1
  %106 = icmp eq i32 %79, 4
  %107 = or i1 %105, %106
  %or.cond4 = and i1 %104, %107
  br i1 %or.cond4, label %108, label %112

; <label>:108                                     ; preds = %102
  %109 = getelementptr inbounds %struct.VExp* %e, i64 0, i32 3, i32 0, i32 3
  %110 = load i32* %109, align 4, !tbaa !43
  %111 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str34, i64 0, i64 0), i32 %110) #7
  %.pre = load i32* %80, align 4, !tbaa !26
  br label %112

; <label>:112                                     ; preds = %108, %102
  %113 = phi i32 [ %.pre, %108 ], [ %103, %102 ]
  %114 = icmp sgt i32 %113, 0
  br i1 %114, label %115, label %124

; <label>:115                                     ; preds = %112
  %116 = sext i32 %113 to i64
  %117 = load i32* %73, align 4, !tbaa !28
  %118 = zext i32 %117 to i64
  %119 = getelementptr inbounds [8 x [4 x i32]]* @syscall_arginfo, i64 0, i64 %118, i64 %116
  %120 = load i32* %119, align 4, !tbaa !29
  %121 = icmp eq i32 %120, 2
  br i1 %121, label %122, label %124

; <label>:122                                     ; preds = %115
  %123 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str37, i64 0, i64 0)) #7
  br label %124

; <label>:124                                     ; preds = %122, %115, %112
  %putchar = tail call i32 @putchar(i32 41) #7
  br label %displayNumber.exit

displayNumber.exit:                               ; preds = %13, %10, %0, %displayNumber.exit12, %124, %._crit_edge, %35, %22
  ret void
}

; Function Attrs: nounwind uwtable
define void @displayExp(%struct.VExp* nocapture readonly %e) #1 {
  tail call void @displayExpRecursive(%struct.VExp* %e, i32 0)
  ret void
}

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
  store i32 1, i32* %15, align 4, !tbaa !23
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
  %4 = load i32* %3, align 4, !tbaa !23
  %5 = add nsw i32 %4, 1
  store i32 %5, i32* %3, align 4, !tbaa !23
  br label %6

; <label>:6                                       ; preds = %0, %2
  ret %struct.VExp* %p
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
  store i32 1, i32* %14, align 4, !tbaa !31
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
define %struct.Value* @newResolvedValue(%struct.VExp* %exp, %struct.VContext* %context) #1 {
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
  store i32 1, i32* %11, align 4, !tbaa !31
  %12 = getelementptr inbounds %struct.Value* %10, i64 0, i32 1
  %13 = bitcast %union.anon.0* %12 to %struct.Value**
  %14 = load %struct.Value** %13, align 8, !tbaa !1
  store %struct.Value* %14, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %15 = getelementptr inbounds %struct.Value* %10, i64 0, i32 0
  store i32 0, i32* %15, align 4, !tbaa !33
  %16 = getelementptr inbounds %struct.Value* %10, i64 0, i32 1, i32 0, i32 0
  store %struct.VExp* %exp, %struct.VExp** %16, align 8, !tbaa !18
  %17 = getelementptr inbounds %struct.Value* %10, i64 0, i32 1, i32 0, i32 1
  store %struct.VContext* %context, %struct.VContext** %17, align 8, !tbaa !20
  ret %struct.Value* %10
}

; Function Attrs: nounwind uwtable
define %struct.Value* @newRunningValue(%struct.VExp* %r_exp, %struct.VContext* %r_context) #1 {
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
  store i32 1, i32* %11, align 4, !tbaa !31
  %12 = getelementptr inbounds %struct.Value* %10, i64 0, i32 1
  %13 = bitcast %union.anon.0* %12 to %struct.Value**
  %14 = load %struct.Value** %13, align 8, !tbaa !1
  store %struct.Value* %14, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %15 = getelementptr inbounds %struct.Value* %10, i64 0, i32 0
  store i32 2, i32* %15, align 4, !tbaa !33
  %16 = getelementptr inbounds %struct.Value* %10, i64 0, i32 1, i32 0, i32 0
  store %struct.VExp* %r_exp, %struct.VExp** %16, align 8, !tbaa !34
  %17 = getelementptr inbounds %struct.Value* %10, i64 0, i32 1, i32 0, i32 1
  store %struct.VContext* %r_context, %struct.VContext** %17, align 8, !tbaa !36
  %18 = getelementptr inbounds %struct.Value* %10, i64 0, i32 1, i32 0, i32 2
  store %struct.Continuation* null, %struct.Continuation** %18, align 8, !tbaa !37
  ret %struct.Value* %10
}

; Function Attrs: nounwind uwtable
define %struct.Value* @retainValue(%struct.Value* %p) #1 {
  %1 = icmp eq %struct.Value* %p, null
  br i1 %1, label %6, label %2

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.Value* %p, i64 0, i32 2
  %4 = load i32* %3, align 4, !tbaa !31
  %5 = add nsw i32 %4, 1
  store i32 %5, i32* %3, align 4, !tbaa !31
  br label %6

; <label>:6                                       ; preds = %0, %2
  ret %struct.Value* %p
}

; Function Attrs: nounwind uwtable
define void @pushEvalContinuation(%struct.Value* nocapture %v, %struct.VExp* %exp, %struct.VContext* %context) #1 {
  %1 = load %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  %2 = icmp eq %struct.Continuation* %1, null
  br i1 %2, label %3, label %allocateContinuation.exit

; <label>:3                                       ; preds = %0
  %4 = tail call noalias i8* @malloc(i64 32000) #7
  %5 = bitcast i8* %4 to %struct.Continuation*
  br label %6

; <label>:6                                       ; preds = %6, %3
  %indvars.iv.i = phi i64 [ 0, %3 ], [ %indvars.iv.next.i, %6 ]
  %7 = phi %struct.Continuation* [ null, %3 ], [ %8, %6 ]
  %8 = getelementptr inbounds %struct.Continuation* %5, i64 %indvars.iv.i
  %9 = getelementptr inbounds %struct.Continuation* %5, i64 %indvars.iv.i, i32 2
  store %struct.Continuation* %7, %struct.Continuation** %9, align 8, !tbaa !15
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 1000
  br i1 %exitcond.i, label %.loopexit.i, label %6

.loopexit.i:                                      ; preds = %6
  %scevgep.i = getelementptr i8* %4, i64 31968
  %scevgep3.i = bitcast i8* %scevgep.i to %struct.Continuation*
  store %struct.Continuation* %scevgep3.i, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  br label %allocateContinuation.exit

allocateContinuation.exit:                        ; preds = %0, %.loopexit.i
  %10 = phi %struct.Continuation* [ %scevgep3.i, %.loopexit.i ], [ %1, %0 ]
  %11 = getelementptr inbounds %struct.Continuation* %10, i64 0, i32 2
  %12 = load %struct.Continuation** %11, align 8, !tbaa !15
  store %struct.Continuation* %12, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  %13 = getelementptr inbounds %struct.Continuation* %10, i64 0, i32 0
  store i32 0, i32* %13, align 4, !tbaa !17
  %14 = getelementptr inbounds %struct.Continuation* %10, i64 0, i32 1, i32 0, i32 0
  store %struct.VExp* %exp, %struct.VExp** %14, align 8, !tbaa !18
  %15 = getelementptr inbounds %struct.Continuation* %10, i64 0, i32 1, i32 0, i32 1
  store %struct.VContext* %context, %struct.VContext** %15, align 8, !tbaa !20
  %16 = getelementptr inbounds %struct.Value* %v, i64 0, i32 1, i32 0, i32 2
  %17 = load %struct.Continuation** %16, align 8, !tbaa !37
  store %struct.Continuation* %17, %struct.Continuation** %11, align 8, !tbaa !15
  store %struct.Continuation* %10, %struct.Continuation** %16, align 8, !tbaa !37
  ret void
}

; Function Attrs: nounwind uwtable
define void @pushApplyContinuation(%struct.Value* nocapture %v, %struct.Value* %ap_x) #1 {
  %1 = load %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  %2 = icmp eq %struct.Continuation* %1, null
  br i1 %2, label %3, label %allocateContinuation.exit

; <label>:3                                       ; preds = %0
  %4 = tail call noalias i8* @malloc(i64 32000) #7
  %5 = bitcast i8* %4 to %struct.Continuation*
  br label %6

; <label>:6                                       ; preds = %6, %3
  %indvars.iv.i = phi i64 [ 0, %3 ], [ %indvars.iv.next.i, %6 ]
  %7 = phi %struct.Continuation* [ null, %3 ], [ %8, %6 ]
  %8 = getelementptr inbounds %struct.Continuation* %5, i64 %indvars.iv.i
  %9 = getelementptr inbounds %struct.Continuation* %5, i64 %indvars.iv.i, i32 2
  store %struct.Continuation* %7, %struct.Continuation** %9, align 8, !tbaa !15
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 1000
  br i1 %exitcond.i, label %.loopexit.i, label %6

.loopexit.i:                                      ; preds = %6
  %scevgep.i = getelementptr i8* %4, i64 31968
  %scevgep3.i = bitcast i8* %scevgep.i to %struct.Continuation*
  store %struct.Continuation* %scevgep3.i, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  br label %allocateContinuation.exit

allocateContinuation.exit:                        ; preds = %0, %.loopexit.i
  %10 = phi %struct.Continuation* [ %scevgep3.i, %.loopexit.i ], [ %1, %0 ]
  %11 = getelementptr inbounds %struct.Continuation* %10, i64 0, i32 2
  %12 = load %struct.Continuation** %11, align 8, !tbaa !15
  store %struct.Continuation* %12, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  %13 = getelementptr inbounds %struct.Continuation* %10, i64 0, i32 0
  store i32 1, i32* %13, align 4, !tbaa !17
  %14 = getelementptr inbounds %struct.Continuation* %10, i64 0, i32 1, i32 0, i32 0
  %ap_x.c = bitcast %struct.Value* %ap_x to %struct.VExp*
  store %struct.VExp* %ap_x.c, %struct.VExp** %14, align 8, !tbaa !21
  %15 = getelementptr inbounds %struct.Value* %v, i64 0, i32 1, i32 0, i32 2
  %16 = load %struct.Continuation** %15, align 8, !tbaa !37
  store %struct.Continuation* %16, %struct.Continuation** %11, align 8, !tbaa !15
  store %struct.Continuation* %10, %struct.Continuation** %15, align 8, !tbaa !37
  ret void
}

; Function Attrs: nounwind uwtable
define void @popContinuation(%struct.Value* nocapture %v) #1 {
  %1 = getelementptr inbounds %struct.Value* %v, i64 0, i32 1, i32 0, i32 2
  %2 = load %struct.Continuation** %1, align 8, !tbaa !37
  %3 = getelementptr inbounds %struct.Continuation* %2, i64 0, i32 2
  %4 = load %struct.Continuation** %3, align 8, !tbaa !15
  %5 = icmp eq %struct.Continuation* %2, null
  br i1 %5, label %releaseContinuationSingle.exit, label %6

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds %struct.Continuation* %2, i64 0, i32 0
  %8 = load i32* %7, align 4, !tbaa !17
  switch i32 %8, label %allocateContinuation.exit.i [
    i32 0, label %9
    i32 1, label %16
  ]

; <label>:9                                       ; preds = %6
  %10 = getelementptr inbounds %struct.Continuation* %2, i64 0, i32 1, i32 0, i32 0
  %11 = load %struct.VExp** %10, align 8, !tbaa !18
  %12 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %11) #7
  %13 = getelementptr inbounds %struct.Continuation* %2, i64 0, i32 1, i32 0, i32 1
  %14 = load %struct.VContext** %13, align 8, !tbaa !20
  %15 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %14) #7
  br label %allocateContinuation.exit.i

; <label>:16                                      ; preds = %6
  %17 = getelementptr inbounds %struct.Continuation* %2, i64 0, i32 1
  %18 = bitcast %union.anon.8* %17 to %struct.Value**
  %19 = load %struct.Value** %18, align 8, !tbaa !21
  %20 = tail call %struct.Value* @releaseValue(%struct.Value* %19) #7
  br label %allocateContinuation.exit.i

allocateContinuation.exit.i:                      ; preds = %16, %9, %6
  %21 = load %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  store %struct.Continuation* %21, %struct.Continuation** %3, align 8, !tbaa !15
  store %struct.Continuation* %2, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  br label %releaseContinuationSingle.exit

releaseContinuationSingle.exit:                   ; preds = %0, %allocateContinuation.exit.i
  store %struct.Continuation* %4, %struct.Continuation** %1, align 8, !tbaa !37
  ret void
}

; Function Attrs: nounwind uwtable
define void @clearNullContinuation(%struct.Value* nocapture %v) #1 {
  %1 = getelementptr inbounds %struct.Value* %v, i64 0, i32 0
  store i32 0, i32* %1, align 4, !tbaa !33
  ret void
}

; Function Attrs: nounwind uwtable
define void @setRunningValue(%struct.Value* nocapture %v, %struct.VExp* %exp, %struct.VContext* %context) #1 {
  %1 = getelementptr inbounds %struct.Value* %v, i64 0, i32 1, i32 0, i32 0
  %2 = load %struct.VExp** %1, align 8, !tbaa !34
  %3 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %2)
  store %struct.VExp* %exp, %struct.VExp** %1, align 8, !tbaa !34
  %4 = getelementptr inbounds %struct.Value* %v, i64 0, i32 1, i32 0, i32 1
  %5 = load %struct.VContext** %4, align 8, !tbaa !36
  %6 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %5)
  store %struct.VContext* %context, %struct.VContext** %4, align 8, !tbaa !36
  ret void
}

; Function Attrs: nounwind uwtable
define void @setExceptionValue(%struct.Value* nocapture %v, i8* %message) #1 {
  %1 = getelementptr inbounds %struct.Value* %v, i64 0, i32 1, i32 0, i32 0
  %2 = load %struct.VExp** %1, align 8, !tbaa !34
  %3 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %2)
  store %struct.VExp* null, %struct.VExp** %1, align 8, !tbaa !34
  %4 = getelementptr inbounds %struct.Value* %v, i64 0, i32 1, i32 0, i32 1
  %5 = load %struct.VContext** %4, align 8, !tbaa !36
  %6 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %5)
  store %struct.VContext* null, %struct.VContext** %4, align 8, !tbaa !36
  %7 = getelementptr inbounds %struct.Value* %v, i64 0, i32 1, i32 0, i32 2
  %8 = load %struct.Continuation** %7, align 8, !tbaa !37
  %9 = icmp eq %struct.Continuation* %8, null
  br i1 %9, label %releaseContinuation.exit, label %.lr.ph.i

.lr.ph.i:                                         ; preds = %0, %releaseContinuationSingle.exit
  %.01.i = phi %struct.Continuation* [ %11, %releaseContinuationSingle.exit ], [ %8, %0 ]
  %10 = getelementptr inbounds %struct.Continuation* %.01.i, i64 0, i32 2
  %11 = load %struct.Continuation** %10, align 8, !tbaa !15
  %12 = icmp eq %struct.Continuation* %.01.i, null
  br i1 %12, label %releaseContinuationSingle.exit, label %13

; <label>:13                                      ; preds = %.lr.ph.i
  %14 = getelementptr inbounds %struct.Continuation* %.01.i, i64 0, i32 0
  %15 = load i32* %14, align 4, !tbaa !17
  switch i32 %15, label %allocateContinuation.exit.i [
    i32 0, label %16
    i32 1, label %23
  ]

; <label>:16                                      ; preds = %13
  %17 = getelementptr inbounds %struct.Continuation* %.01.i, i64 0, i32 1, i32 0, i32 0
  %18 = load %struct.VExp** %17, align 8, !tbaa !18
  %19 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %18) #7
  %20 = getelementptr inbounds %struct.Continuation* %.01.i, i64 0, i32 1, i32 0, i32 1
  %21 = load %struct.VContext** %20, align 8, !tbaa !20
  %22 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %21) #7
  br label %allocateContinuation.exit.i

; <label>:23                                      ; preds = %13
  %24 = getelementptr inbounds %struct.Continuation* %.01.i, i64 0, i32 1
  %25 = bitcast %union.anon.8* %24 to %struct.Value**
  %26 = load %struct.Value** %25, align 8, !tbaa !21
  %27 = tail call %struct.Value* @releaseValue(%struct.Value* %26) #7
  br label %allocateContinuation.exit.i

allocateContinuation.exit.i:                      ; preds = %23, %16, %13
  %28 = load %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  store %struct.Continuation* %28, %struct.Continuation** %10, align 8, !tbaa !15
  store %struct.Continuation* %.01.i, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  br label %releaseContinuationSingle.exit

releaseContinuationSingle.exit:                   ; preds = %.lr.ph.i, %allocateContinuation.exit.i
  %29 = icmp eq %struct.Continuation* %11, null
  br i1 %29, label %releaseContinuation.exit, label %.lr.ph.i

releaseContinuation.exit:                         ; preds = %releaseContinuationSingle.exit, %0
  store %struct.Continuation* null, %struct.Continuation** %7, align 8, !tbaa !37
  %30 = getelementptr inbounds %struct.Value* %v, i64 0, i32 0
  store i32 1, i32* %30, align 4, !tbaa !33
  %message.c = bitcast i8* %message to %struct.VExp*
  store %struct.VExp* %message.c, %struct.VExp** %1, align 8, !tbaa !1
  ret void
}

; Function Attrs: nounwind uwtable
define %struct.ValueStack* @allocateValueStack(%struct.ValueStack* %p) #1 {
  %1 = icmp eq %struct.ValueStack* %p, null
  %2 = load %struct.ValueStack** @allocateValueStack.pool, align 8, !tbaa !1
  br i1 %1, label %3, label %16

; <label>:3                                       ; preds = %0
  %4 = icmp eq %struct.ValueStack* %2, null
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %3
  %6 = tail call noalias i8* @malloc(i64 16000) #7
  %7 = bitcast i8* %6 to %struct.ValueStack*
  %scevgep = getelementptr i8* %6, i64 15984
  br label %8

; <label>:8                                       ; preds = %8, %5
  %indvars.iv = phi i64 [ 0, %5 ], [ %indvars.iv.next, %8 ]
  %9 = phi %struct.ValueStack* [ null, %5 ], [ %10, %8 ]
  %10 = getelementptr inbounds %struct.ValueStack* %7, i64 %indvars.iv
  %11 = getelementptr inbounds %struct.ValueStack* %10, i64 0, i32 0, i32 0, i32 0
  %.c = bitcast %struct.ValueStack* %9 to %struct.Value*
  store %struct.Value* %.c, %struct.Value** %11, align 8, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %.loopexit, label %8

.loopexit:                                        ; preds = %8
  %scevgep4 = bitcast i8* %scevgep to %struct.ValueStack*
  store %struct.ValueStack* %scevgep4, %struct.ValueStack** @allocateValueStack.pool, align 8, !tbaa !1
  br label %12

; <label>:12                                      ; preds = %.loopexit, %3
  %13 = phi %struct.ValueStack* [ %scevgep4, %.loopexit ], [ %2, %3 ]
  %14 = bitcast %struct.ValueStack* %13 to %struct.ValueStack**
  %15 = load %struct.ValueStack** %14, align 8, !tbaa !1
  br label %18

; <label>:16                                      ; preds = %0
  %17 = getelementptr inbounds %struct.ValueStack* %p, i64 0, i32 0, i32 0, i32 0
  %.c2 = bitcast %struct.ValueStack* %2 to %struct.Value*
  store %struct.Value* %.c2, %struct.Value** %17, align 8, !tbaa !1
  br label %18

; <label>:18                                      ; preds = %16, %12
  %storemerge = phi %struct.ValueStack* [ %15, %12 ], [ %p, %16 ]
  %.0 = phi %struct.ValueStack* [ %13, %12 ], [ null, %16 ]
  store %struct.ValueStack* %storemerge, %struct.ValueStack** @allocateValueStack.pool, align 8, !tbaa !1
  ret %struct.ValueStack* %.0
}

; Function Attrs: nounwind uwtable
define %struct.ValueStack* @pushValueStack(%struct.Value* %v, %struct.ValueStack* %r) #1 {
  %1 = load %struct.ValueStack** @allocateValueStack.pool, align 8, !tbaa !1
  %2 = icmp eq %struct.ValueStack* %1, null
  br i1 %2, label %3, label %allocateValueStack.exit

; <label>:3                                       ; preds = %0
  %4 = tail call noalias i8* @malloc(i64 16000) #7
  %5 = bitcast i8* %4 to %struct.ValueStack*
  br label %6

; <label>:6                                       ; preds = %6, %3
  %indvars.iv.i = phi i64 [ 0, %3 ], [ %indvars.iv.next.i, %6 ]
  %7 = phi %struct.ValueStack* [ null, %3 ], [ %8, %6 ]
  %8 = getelementptr inbounds %struct.ValueStack* %5, i64 %indvars.iv.i
  %9 = getelementptr inbounds %struct.ValueStack* %8, i64 0, i32 0, i32 0, i32 0
  %.c.i = bitcast %struct.ValueStack* %7 to %struct.Value*
  store %struct.Value* %.c.i, %struct.Value** %9, align 8, !tbaa !1
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 1000
  br i1 %exitcond.i, label %.loopexit.i, label %6

.loopexit.i:                                      ; preds = %6
  %scevgep.i = getelementptr i8* %4, i64 15984
  %scevgep4.i = bitcast i8* %scevgep.i to %struct.ValueStack*
  store %struct.ValueStack* %scevgep4.i, %struct.ValueStack** @allocateValueStack.pool, align 8, !tbaa !1
  br label %allocateValueStack.exit

allocateValueStack.exit:                          ; preds = %0, %.loopexit.i
  %10 = phi %struct.ValueStack* [ %scevgep4.i, %.loopexit.i ], [ %1, %0 ]
  %11 = bitcast %struct.ValueStack* %10 to %struct.ValueStack**
  %12 = load %struct.ValueStack** %11, align 8, !tbaa !1
  store %struct.ValueStack* %12, %struct.ValueStack** @allocateValueStack.pool, align 8, !tbaa !1
  %13 = getelementptr inbounds %struct.ValueStack* %10, i64 0, i32 0, i32 0, i32 1
  store %struct.ValueStack* %r, %struct.ValueStack** %13, align 8, !tbaa !20
  %14 = getelementptr inbounds %struct.ValueStack* %10, i64 0, i32 0, i32 0, i32 0
  store %struct.Value* %v, %struct.Value** %14, align 8, !tbaa !18
  ret %struct.ValueStack* %10
}

; Function Attrs: nounwind uwtable
define %struct.ValueStack* @popValueStack(%struct.ValueStack* %p) #1 {
  %1 = getelementptr inbounds %struct.ValueStack* %p, i64 0, i32 0, i32 0, i32 1
  %2 = load %struct.ValueStack** %1, align 8, !tbaa !20
  %3 = icmp eq %struct.ValueStack* %p, null
  %4 = load %struct.ValueStack** @allocateValueStack.pool, align 8, !tbaa !1
  br i1 %3, label %5, label %18

; <label>:5                                       ; preds = %0
  %6 = icmp eq %struct.ValueStack* %4, null
  br i1 %6, label %7, label %14

; <label>:7                                       ; preds = %5
  %8 = tail call noalias i8* @malloc(i64 16000) #7
  %9 = bitcast i8* %8 to %struct.ValueStack*
  br label %10

; <label>:10                                      ; preds = %10, %7
  %indvars.iv.i = phi i64 [ 0, %7 ], [ %indvars.iv.next.i, %10 ]
  %11 = phi %struct.ValueStack* [ null, %7 ], [ %12, %10 ]
  %12 = getelementptr inbounds %struct.ValueStack* %9, i64 %indvars.iv.i
  %13 = getelementptr inbounds %struct.ValueStack* %12, i64 0, i32 0, i32 0, i32 0
  %.c.i = bitcast %struct.ValueStack* %11 to %struct.Value*
  store %struct.Value* %.c.i, %struct.Value** %13, align 8, !tbaa !1
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 1000
  br i1 %exitcond.i, label %.loopexit.i, label %10

.loopexit.i:                                      ; preds = %10
  %scevgep.i = getelementptr i8* %8, i64 15984
  %scevgep4.i = bitcast i8* %scevgep.i to %struct.ValueStack*
  store %struct.ValueStack* %scevgep4.i, %struct.ValueStack** @allocateValueStack.pool, align 8, !tbaa !1
  br label %14

; <label>:14                                      ; preds = %.loopexit.i, %5
  %15 = phi %struct.ValueStack* [ %scevgep4.i, %.loopexit.i ], [ %4, %5 ]
  %16 = bitcast %struct.ValueStack* %15 to %struct.ValueStack**
  %17 = load %struct.ValueStack** %16, align 8, !tbaa !1
  br label %allocateValueStack.exit

; <label>:18                                      ; preds = %0
  %19 = getelementptr inbounds %struct.ValueStack* %p, i64 0, i32 0, i32 0, i32 0
  %.c2.i = bitcast %struct.ValueStack* %4 to %struct.Value*
  store %struct.Value* %.c2.i, %struct.Value** %19, align 8, !tbaa !1
  br label %allocateValueStack.exit

allocateValueStack.exit:                          ; preds = %14, %18
  %storemerge.i = phi %struct.ValueStack* [ %17, %14 ], [ %p, %18 ]
  store %struct.ValueStack* %storemerge.i, %struct.ValueStack** @allocateValueStack.pool, align 8, !tbaa !1
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
  store i32 1, i32* %12, align 4, !tbaa !23
  %13 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3
  %14 = bitcast %union.anon.1* %13 to %struct.VExp**
  %15 = load %struct.VExp** %14, align 8, !tbaa !1
  store %struct.VExp* %15, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %16 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 0
  store i32 0, i32* %16, align 4, !tbaa !25
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
  store i32 1, i32* %12, align 4, !tbaa !23
  %13 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3
  %14 = bitcast %union.anon.1* %13 to %struct.VExp**
  %15 = load %struct.VExp** %14, align 8, !tbaa !1
  store %struct.VExp* %15, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %16 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 0
  store i32 1, i32* %16, align 4, !tbaa !25
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
  store i32 1, i32* %12, align 4, !tbaa !23
  %13 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3
  %14 = bitcast %union.anon.1* %13 to %struct.VExp**
  %15 = load %struct.VExp** %14, align 8, !tbaa !1
  store %struct.VExp* %15, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %16 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 0
  store i32 7, i32* %16, align 4, !tbaa !25
  %17 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3, i32 0, i32 0
  store i32 %ref_val, i32* %17, align 4, !tbaa !29
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
  store i32 1, i32* %12, align 4, !tbaa !23
  %13 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3
  %14 = bitcast %union.anon.1* %13 to %struct.VExp**
  %15 = load %struct.VExp** %14, align 8, !tbaa !1
  store %struct.VExp* %15, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %16 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 0
  store i32 8, i32* %16, align 4, !tbaa !25
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
  store i32 1, i32* %12, align 4, !tbaa !23
  %13 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3
  %14 = bitcast %union.anon.1* %13 to %struct.VExp**
  %15 = load %struct.VExp** %14, align 8, !tbaa !1
  store %struct.VExp* %15, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %16 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 0
  store i32 2, i32* %16, align 4, !tbaa !25
  %17 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3, i32 0, i32 0
  store i32 %func_type, i32* %17, align 4, !tbaa !38
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
  store i32 1, i32* %12, align 4, !tbaa !23
  %13 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3
  %14 = bitcast %union.anon.1* %13 to %struct.VExp**
  %15 = load %struct.VExp** %14, align 8, !tbaa !1
  store %struct.VExp* %15, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %16 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 0
  store i32 3, i32* %16, align 4, !tbaa !25
  %17 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3, i32 0, i32 0
  store i32 %func1_type, i32* %17, align 4, !tbaa !40
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
  store i32 1, i32* %12, align 4, !tbaa !23
  %13 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3
  %14 = bitcast %union.anon.1* %13 to %struct.VExp**
  %15 = load %struct.VExp** %14, align 8, !tbaa !1
  store %struct.VExp* %15, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %16 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 0
  store i32 4, i32* %16, align 4, !tbaa !25
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
  store i32 1, i32* %12, align 4, !tbaa !23
  %13 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3
  %14 = bitcast %union.anon.1* %13 to %struct.VExp**
  %15 = load %struct.VExp** %14, align 8, !tbaa !1
  store %struct.VExp* %15, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %16 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 0
  store i32 5, i32* %16, align 4, !tbaa !25
  %17 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3, i32 0, i32 0
  store i32 %sys_type, i32* %17, align 4, !tbaa !28
  %18 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3, i32 0, i32 1
  store i32 0, i32* %18, align 4, !tbaa !26
  ret %struct.VExp* %11
}

; Function Attrs: nounwind uwtable
define %struct.VExp* @appendSyscallArg(%struct.VExp* nocapture readonly %exp, %struct.Value* %x, i8** nocapture %error_message, %struct.Value** nocapture %to_resolve) #1 {
  store i8* null, i8** %error_message, align 8, !tbaa !1
  store %struct.Value* null, %struct.Value** %to_resolve, align 8, !tbaa !1
  %1 = getelementptr inbounds %struct.VExp* %exp, i64 0, i32 3, i32 0, i32 0
  %2 = load i32* %1, align 4, !tbaa !28
  %3 = zext i32 %2 to i64
  %4 = getelementptr inbounds [8 x [4 x i32]]* @syscall_arginfo, i64 0, i64 %3, i64 0
  %5 = load i32* %4, align 16, !tbaa !29
  %6 = getelementptr inbounds %struct.VExp* %exp, i64 0, i32 3, i32 0, i32 1
  %7 = load i32* %6, align 4, !tbaa !26
  %8 = icmp sgt i32 %5, %7
  br i1 %8, label %10, label %9

; <label>:9                                       ; preds = %0
  store i8* getelementptr inbounds ([30 x i8]* @.str38, i64 0, i64 0), i8** %error_message, align 8, !tbaa !1
  br label %127

; <label>:10                                      ; preds = %0
  %11 = add nsw i32 %7, 1
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [8 x [4 x i32]]* @syscall_arginfo, i64 0, i64 %3, i64 %12
  %14 = load i32* %13, align 4, !tbaa !29
  %15 = icmp eq i32 %14, 2
  br i1 %15, label %.thread4, label %16

; <label>:16                                      ; preds = %10
  %17 = getelementptr inbounds %struct.Value* %x, i64 0, i32 0
  %18 = load i32* %17, align 4, !tbaa !33
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
  %25 = load i32* %24, align 4, !tbaa !25
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %31

; <label>:27                                      ; preds = %21
  %28 = getelementptr inbounds %struct.VExp* %23, i64 0, i32 3, i32 0, i32 0
  %29 = load i32* %28, align 4, !tbaa !44
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %.thread4, label %31

; <label>:31                                      ; preds = %27, %21
  store i8* getelementptr inbounds ([42 x i8]* @.str39, i64 0, i64 0), i8** %error_message, align 8, !tbaa !1
  br label %127

; <label>:32                                      ; preds = %20
  %33 = getelementptr inbounds %struct.Value* %x, i64 0, i32 1, i32 0, i32 0
  %34 = load %struct.VExp** %33, align 8, !tbaa !18
  %35 = getelementptr inbounds %struct.VExp* %34, i64 0, i32 0
  %36 = load i32* %35, align 4, !tbaa !25
  %37 = icmp eq i32 %36, 4
  br i1 %37, label %.thread4, label %38

; <label>:38                                      ; preds = %32
  store i8* getelementptr inbounds ([42 x i8]* @.str40, i64 0, i64 0), i8** %error_message, align 8, !tbaa !1
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
  store i32 1, i32* %51, align 4, !tbaa !23
  %52 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3
  %53 = bitcast %union.anon.1* %52 to %struct.VExp**
  %54 = load %struct.VExp** %53, align 8, !tbaa !1
  store %struct.VExp* %54, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %55 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 0
  store i32 5, i32* %55, align 4, !tbaa !25
  %56 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 0
  store i32 %2, i32* %56, align 4, !tbaa !28
  %57 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 1
  store i32 %11, i32* %57, align 4, !tbaa !26
  %58 = load i32* %6, align 4, !tbaa !26
  %59 = icmp sgt i32 %58, 0
  br i1 %59, label %60, label %.thread5

; <label>:60                                      ; preds = %allocateVExp.exit
  %61 = load i32* %1, align 4, !tbaa !28
  %62 = zext i32 %61 to i64
  %63 = lshr i64 61, %62
  %64 = and i64 %63, 1
  %65 = icmp eq i64 %64, 0
  br i1 %65, label %72, label %66

; <label>:66                                      ; preds = %60
  %67 = getelementptr inbounds %struct.VExp* %exp, i64 0, i32 3, i32 0, i32 2
  %68 = bitcast %union.SyscallArg* %67 to i32*
  %69 = load i32* %68, align 4, !tbaa !29
  %70 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 2
  %71 = bitcast %union.SyscallArg* %70 to i32*
  store i32 %69, i32* %71, align 4, !tbaa !29
  %.pr.pre = load i32* %6, align 4, !tbaa !26
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
  %87 = load i32* %86, align 4, !tbaa !43
  %88 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 3
  store i32 %87, i32* %88, align 4, !tbaa !43
  br label %.thread5

.thread5:                                         ; preds = %allocateVExp.exit, %84, %85, %82
  %89 = phi i32 [ %58, %allocateVExp.exit ], [ %.pr, %84 ], [ %.pr, %85 ], [ %.pr, %82 ]
  br i1 %15, label %90, label %97

; <label>:90                                      ; preds = %.thread5
  %91 = icmp eq %struct.Value* %x, null
  br i1 %91, label %retainValue.exit, label %92

; <label>:92                                      ; preds = %90
  %93 = getelementptr inbounds %struct.Value* %x, i64 0, i32 2
  %94 = load i32* %93, align 4, !tbaa !31
  %95 = add nsw i32 %94, 1
  store i32 %95, i32* %93, align 4, !tbaa !31
  br label %retainValue.exit

retainValue.exit:                                 ; preds = %90, %92
  %96 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 4
  store %struct.Value* %x, %struct.Value** %96, align 8, !tbaa !30
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
  %105 = load i32* %104, align 4, !tbaa !29
  %106 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 2
  %107 = bitcast %union.SyscallArg* %106 to i32*
  store i32 %105, i32* %107, align 4, !tbaa !29
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
  %125 = load i32* %124, align 4, !tbaa !29
  %126 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 3
  store i32 %125, i32* %126, align 4, !tbaa !43
  br label %127

; <label>:127                                     ; preds = %retainValue.exit, %118, %120, %102, %retainIntList.exit3, %38, %31, %19, %9
  %.0 = phi %struct.VExp* [ null, %9 ], [ null, %19 ], [ null, %31 ], [ null, %38 ], [ %50, %retainIntList.exit3 ], [ %50, %102 ], [ %50, %120 ], [ %50, %118 ], [ %50, %retainValue.exit ]
  ret %struct.VExp* %.0
}

; Function Attrs: nounwind uwtable
define void @incCounter() #1 {
  %1 = load i64* @incCounter.count, align 8, !tbaa !45
  %2 = add nsw i64 %1, 1
  store i64 %2, i64* @incCounter.count, align 8, !tbaa !45
  %3 = load i64* @incCounter.unit, align 8, !tbaa !45
  %4 = add nsw i64 %3, -1
  %5 = and i64 %4, %2
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %7, label %16

; <label>:7                                       ; preds = %0
  %8 = load %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([11 x i8]* @.str41, i64 0, i64 0), i64 %2) #8
  %10 = load i64* @incCounter.unit, align 8, !tbaa !45
  %11 = shl i64 %10, 4
  %12 = load i64* @incCounter.count, align 8, !tbaa !45
  %13 = icmp sgt i64 %11, %12
  br i1 %13, label %16, label %14

; <label>:14                                      ; preds = %7
  %15 = shl i64 %10, 1
  store i64 %15, i64* @incCounter.unit, align 8, !tbaa !45
  br label %16

; <label>:16                                      ; preds = %7, %0, %14
  ret void
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define %struct.Value* @resolveValue(%struct.Value* %v) #1 {
  %to_resolve = alloca %struct.Value*, align 8
  %error_message = alloca i8*, align 8
  %1 = getelementptr inbounds %struct.Value* %v, i64 0, i32 1, i32 0, i32 2
  %2 = load %struct.Continuation** %1, align 8, !tbaa !37
  %3 = icmp eq %struct.Continuation* %2, null
  br i1 %3, label %4, label %6

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %struct.Value* %v, i64 0, i32 0
  store i32 0, i32* %5, align 4, !tbaa !33
  br label %1128

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds %struct.Continuation* %2, i64 0, i32 0
  %8 = load i32* %7, align 4, !tbaa !17
  switch i32 %8, label %1128 [
    i32 0, label %9
    i32 1, label %276
  ]

; <label>:9                                       ; preds = %6
  %10 = getelementptr inbounds %struct.Continuation* %2, i64 0, i32 1, i32 0, i32 0
  %11 = load %struct.VExp** %10, align 8, !tbaa !18
  %12 = getelementptr inbounds %struct.Continuation* %2, i64 0, i32 1, i32 0, i32 1
  %13 = load %struct.VContext** %12, align 8, !tbaa !20
  %14 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 0
  %15 = load i32* %14, align 4, !tbaa !25
  %16 = icmp ult i32 %15, 6
  br i1 %16, label %17, label %54

; <label>:17                                      ; preds = %9
  %18 = icmp eq %struct.VExp* %11, null
  br i1 %18, label %retainVExp.exit, label %19

; <label>:19                                      ; preds = %17
  %20 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 4
  %21 = load i32* %20, align 4, !tbaa !23
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %20, align 4, !tbaa !23
  br label %retainVExp.exit

retainVExp.exit:                                  ; preds = %17, %19
  %23 = icmp eq %struct.VContext* %13, null
  br i1 %23, label %retainVContext.exit, label %24

; <label>:24                                      ; preds = %retainVExp.exit
  %25 = getelementptr inbounds %struct.VContext* %13, i64 0, i32 2
  %26 = load i32* %25, align 4, !tbaa !13
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %25, align 4, !tbaa !13
  br label %retainVContext.exit

retainVContext.exit:                              ; preds = %retainVExp.exit, %24
  %28 = getelementptr inbounds %struct.Value* %v, i64 0, i32 1, i32 0, i32 0
  %29 = load %struct.VExp** %28, align 8, !tbaa !34
  %30 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %29) #7
  store %struct.VExp* %11, %struct.VExp** %28, align 8, !tbaa !34
  %31 = getelementptr inbounds %struct.Value* %v, i64 0, i32 1, i32 0, i32 1
  %32 = load %struct.VContext** %31, align 8, !tbaa !36
  %33 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %32) #7
  store %struct.VContext* %13, %struct.VContext** %31, align 8, !tbaa !36
  %34 = load %struct.Continuation** %1, align 8, !tbaa !37
  %35 = getelementptr inbounds %struct.Continuation* %34, i64 0, i32 2
  %36 = load %struct.Continuation** %35, align 8, !tbaa !15
  %37 = icmp eq %struct.Continuation* %34, null
  br i1 %37, label %popContinuation.exit29, label %38

; <label>:38                                      ; preds = %retainVContext.exit
  %39 = getelementptr inbounds %struct.Continuation* %34, i64 0, i32 0
  %40 = load i32* %39, align 4, !tbaa !17
  switch i32 %40, label %allocateContinuation.exit.i.i28 [
    i32 0, label %41
    i32 1, label %48
  ]

; <label>:41                                      ; preds = %38
  %42 = getelementptr inbounds %struct.Continuation* %34, i64 0, i32 1, i32 0, i32 0
  %43 = load %struct.VExp** %42, align 8, !tbaa !18
  %44 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %43) #7
  %45 = getelementptr inbounds %struct.Continuation* %34, i64 0, i32 1, i32 0, i32 1
  %46 = load %struct.VContext** %45, align 8, !tbaa !20
  %47 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %46) #7
  br label %allocateContinuation.exit.i.i28

; <label>:48                                      ; preds = %38
  %49 = getelementptr inbounds %struct.Continuation* %34, i64 0, i32 1
  %50 = bitcast %union.anon.8* %49 to %struct.Value**
  %51 = load %struct.Value** %50, align 8, !tbaa !21
  %52 = tail call %struct.Value* @releaseValue(%struct.Value* %51) #7
  br label %allocateContinuation.exit.i.i28

allocateContinuation.exit.i.i28:                  ; preds = %48, %41, %38
  %53 = load %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  store %struct.Continuation* %53, %struct.Continuation** %35, align 8, !tbaa !15
  store %struct.Continuation* %34, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  br label %popContinuation.exit29

popContinuation.exit29:                           ; preds = %retainVContext.exit, %allocateContinuation.exit.i.i28
  store %struct.Continuation* %36, %struct.Continuation** %1, align 8, !tbaa !37
  %.pr = load i32* %14, align 4, !tbaa !25
  br label %54

; <label>:54                                      ; preds = %popContinuation.exit29, %9
  %55 = phi i32 [ %.pr, %popContinuation.exit29 ], [ %15, %9 ]
  switch i32 %55, label %1128 [
    i32 7, label %56
    i32 8, label %112
  ]

; <label>:56                                      ; preds = %54
  %57 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3, i32 0, i32 0
  %58 = load i32* %57, align 4, !tbaa !29
  %59 = icmp sgt i32 %58, 0
  br i1 %59, label %.lr.ph.i, label %lookUpRef.exit

.lr.ph.i:                                         ; preds = %56, %.lr.ph.i
  %i.02.i = phi i32 [ %62, %.lr.ph.i ], [ 0, %56 ]
  %.01.i = phi %struct.VContext* [ %61, %.lr.ph.i ], [ %13, %56 ]
  %60 = getelementptr inbounds %struct.VContext* %.01.i, i64 0, i32 1
  %61 = load %struct.VContext** %60, align 8, !tbaa !11
  %62 = add nsw i32 %i.02.i, 1
  %exitcond.i = icmp eq i32 %62, %58
  br i1 %exitcond.i, label %lookUpRef.exit, label %.lr.ph.i

lookUpRef.exit:                                   ; preds = %.lr.ph.i, %56
  %.0.lcssa.i = phi %struct.VContext* [ %13, %56 ], [ %61, %.lr.ph.i ]
  %63 = getelementptr inbounds %struct.VContext* %.0.lcssa.i, i64 0, i32 0
  %64 = load %struct.Value** %63, align 8, !tbaa !14
  %65 = getelementptr inbounds %struct.Value* %64, i64 0, i32 0
  %66 = load i32* %65, align 4, !tbaa !33
  switch i32 %66, label %1129 [
    i32 0, label %67
    i32 1, label %108
  ]

; <label>:67                                      ; preds = %lookUpRef.exit
  %68 = getelementptr inbounds %struct.Value* %64, i64 0, i32 1, i32 0, i32 0
  %69 = load %struct.VExp** %68, align 8, !tbaa !18
  %70 = icmp eq %struct.VExp* %69, null
  br i1 %70, label %retainVExp.exit30, label %71

; <label>:71                                      ; preds = %67
  %72 = getelementptr inbounds %struct.VExp* %69, i64 0, i32 4
  %73 = load i32* %72, align 4, !tbaa !23
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %72, align 4, !tbaa !23
  br label %retainVExp.exit30

retainVExp.exit30:                                ; preds = %67, %71
  %75 = getelementptr inbounds %struct.Value* %64, i64 0, i32 1, i32 0, i32 1
  %76 = load %struct.VContext** %75, align 8, !tbaa !20
  %77 = icmp eq %struct.VContext* %76, null
  br i1 %77, label %retainVContext.exit31, label %78

; <label>:78                                      ; preds = %retainVExp.exit30
  %79 = getelementptr inbounds %struct.VContext* %76, i64 0, i32 2
  %80 = load i32* %79, align 4, !tbaa !13
  %81 = add nsw i32 %80, 1
  store i32 %81, i32* %79, align 4, !tbaa !13
  br label %retainVContext.exit31

retainVContext.exit31:                            ; preds = %retainVExp.exit30, %78
  %82 = getelementptr inbounds %struct.Value* %v, i64 0, i32 1, i32 0, i32 0
  %83 = load %struct.VExp** %82, align 8, !tbaa !34
  %84 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %83) #7
  store %struct.VExp* %69, %struct.VExp** %82, align 8, !tbaa !34
  %85 = getelementptr inbounds %struct.Value* %v, i64 0, i32 1, i32 0, i32 1
  %86 = load %struct.VContext** %85, align 8, !tbaa !36
  %87 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %86) #7
  store %struct.VContext* %76, %struct.VContext** %85, align 8, !tbaa !36
  %88 = load %struct.Continuation** %1, align 8, !tbaa !37
  %89 = getelementptr inbounds %struct.Continuation* %88, i64 0, i32 2
  %90 = load %struct.Continuation** %89, align 8, !tbaa !15
  %91 = icmp eq %struct.Continuation* %88, null
  br i1 %91, label %popContinuation.exit33, label %92

; <label>:92                                      ; preds = %retainVContext.exit31
  %93 = getelementptr inbounds %struct.Continuation* %88, i64 0, i32 0
  %94 = load i32* %93, align 4, !tbaa !17
  switch i32 %94, label %allocateContinuation.exit.i.i32 [
    i32 0, label %95
    i32 1, label %102
  ]

; <label>:95                                      ; preds = %92
  %96 = getelementptr inbounds %struct.Continuation* %88, i64 0, i32 1, i32 0, i32 0
  %97 = load %struct.VExp** %96, align 8, !tbaa !18
  %98 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %97) #7
  %99 = getelementptr inbounds %struct.Continuation* %88, i64 0, i32 1, i32 0, i32 1
  %100 = load %struct.VContext** %99, align 8, !tbaa !20
  %101 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %100) #7
  br label %allocateContinuation.exit.i.i32

; <label>:102                                     ; preds = %92
  %103 = getelementptr inbounds %struct.Continuation* %88, i64 0, i32 1
  %104 = bitcast %union.anon.8* %103 to %struct.Value**
  %105 = load %struct.Value** %104, align 8, !tbaa !21
  %106 = tail call %struct.Value* @releaseValue(%struct.Value* %105) #7
  br label %allocateContinuation.exit.i.i32

allocateContinuation.exit.i.i32:                  ; preds = %102, %95, %92
  %107 = load %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  store %struct.Continuation* %107, %struct.Continuation** %89, align 8, !tbaa !15
  store %struct.Continuation* %88, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  br label %popContinuation.exit33

popContinuation.exit33:                           ; preds = %retainVContext.exit31, %allocateContinuation.exit.i.i32
  store %struct.Continuation* %90, %struct.Continuation** %1, align 8, !tbaa !37
  br label %1128

; <label>:108                                     ; preds = %lookUpRef.exit
  %109 = getelementptr inbounds %struct.Value* %64, i64 0, i32 1
  %110 = bitcast %union.anon.0* %109 to i8**
  %111 = load i8** %110, align 8, !tbaa !1
  tail call void @setExceptionValue(%struct.Value* %v, i8* %111)
  br label %1128

; <label>:112                                     ; preds = %54
  %113 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3
  %114 = bitcast %union.anon.1* %113 to %struct.VExp**
  %115 = load %struct.VExp** %114, align 8, !tbaa !18
  %116 = icmp eq %struct.VExp* %115, null
  br i1 %116, label %retainVExp.exit34, label %117

; <label>:117                                     ; preds = %112
  %118 = getelementptr inbounds %struct.VExp* %115, i64 0, i32 4
  %119 = load i32* %118, align 4, !tbaa !23
  %120 = add nsw i32 %119, 1
  store i32 %120, i32* %118, align 4, !tbaa !23
  br label %retainVExp.exit34

retainVExp.exit34:                                ; preds = %112, %117
  %121 = icmp eq %struct.VContext* %13, null
  br i1 %121, label %retainVContext.exit35, label %122

; <label>:122                                     ; preds = %retainVExp.exit34
  %123 = getelementptr inbounds %struct.VContext* %13, i64 0, i32 2
  %124 = load i32* %123, align 4, !tbaa !13
  %125 = add nsw i32 %124, 1
  store i32 %125, i32* %123, align 4, !tbaa !13
  br label %retainVContext.exit35

retainVContext.exit35:                            ; preds = %retainVExp.exit34, %122
  %126 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3, i32 0, i32 2
  %127 = bitcast %union.SyscallArg* %126 to %struct.VExp**
  %128 = load %struct.VExp** %127, align 8, !tbaa !20
  %129 = getelementptr inbounds %struct.VExp* %128, i64 0, i32 0
  %130 = load i32* %129, align 4, !tbaa !25
  %131 = icmp ult i32 %130, 6
  br i1 %131, label %132, label %159

; <label>:132                                     ; preds = %retainVContext.exit35
  %133 = icmp eq %struct.VExp* %128, null
  br i1 %133, label %retainVExp.exit36, label %134

; <label>:134                                     ; preds = %132
  %135 = getelementptr inbounds %struct.VExp* %128, i64 0, i32 4
  %136 = load i32* %135, align 4, !tbaa !23
  %137 = add nsw i32 %136, 1
  store i32 %137, i32* %135, align 4, !tbaa !23
  br label %retainVExp.exit36

retainVExp.exit36:                                ; preds = %132, %134
  br i1 %121, label %retainVContext.exit37, label %138

; <label>:138                                     ; preds = %retainVExp.exit36
  %139 = getelementptr inbounds %struct.VContext* %13, i64 0, i32 2
  %140 = load i32* %139, align 4, !tbaa !13
  %141 = add nsw i32 %140, 1
  store i32 %141, i32* %139, align 4, !tbaa !13
  br label %retainVContext.exit37

retainVContext.exit37:                            ; preds = %retainVExp.exit36, %138
  %142 = load %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %143 = icmp eq %struct.Value* %142, null
  br i1 %143, label %144, label %newResolvedValue.exit

; <label>:144                                     ; preds = %retainVContext.exit37
  %145 = tail call noalias i8* @malloc(i64 40000) #7
  %146 = bitcast i8* %145 to %struct.Value*
  br label %147

; <label>:147                                     ; preds = %147, %144
  %indvars.iv.i.i = phi i64 [ 0, %144 ], [ %indvars.iv.next.i.i, %147 ]
  %148 = phi %struct.Value* [ null, %144 ], [ %149, %147 ]
  %149 = getelementptr inbounds %struct.Value* %146, i64 %indvars.iv.i.i
  %150 = getelementptr inbounds %struct.Value* %146, i64 %indvars.iv.i.i, i32 1, i32 0, i32 0
  %.c.i.i = bitcast %struct.Value* %148 to %struct.VExp*
  store %struct.VExp* %.c.i.i, %struct.VExp** %150, align 8, !tbaa !1
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %exitcond.i.i = icmp eq i64 %indvars.iv.next.i.i, 1000
  br i1 %exitcond.i.i, label %.loopexit.i.i, label %147

.loopexit.i.i:                                    ; preds = %147
  %scevgep.i.i = getelementptr i8* %145, i64 39960
  %scevgep4.i.i = bitcast i8* %scevgep.i.i to %struct.Value*
  store %struct.Value* %scevgep4.i.i, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  br label %newResolvedValue.exit

newResolvedValue.exit:                            ; preds = %retainVContext.exit37, %.loopexit.i.i
  %151 = phi %struct.Value* [ %scevgep4.i.i, %.loopexit.i.i ], [ %142, %retainVContext.exit37 ]
  %152 = getelementptr inbounds %struct.Value* %151, i64 0, i32 2
  store i32 1, i32* %152, align 4, !tbaa !31
  %153 = getelementptr inbounds %struct.Value* %151, i64 0, i32 1
  %154 = bitcast %union.anon.0* %153 to %struct.Value**
  %155 = load %struct.Value** %154, align 8, !tbaa !1
  store %struct.Value* %155, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %156 = getelementptr inbounds %struct.Value* %151, i64 0, i32 0
  store i32 0, i32* %156, align 4, !tbaa !33
  %157 = getelementptr inbounds %struct.Value* %151, i64 0, i32 1, i32 0, i32 0
  store %struct.VExp* %128, %struct.VExp** %157, align 8, !tbaa !18
  %158 = getelementptr inbounds %struct.Value* %151, i64 0, i32 1, i32 0, i32 1
  store %struct.VContext* %13, %struct.VContext** %158, align 8, !tbaa !20
  br label %retainValue.exit

; <label>:159                                     ; preds = %retainVContext.exit35
  %160 = icmp eq i32 %130, 7
  br i1 %160, label %161, label %175

; <label>:161                                     ; preds = %159
  %162 = getelementptr inbounds %struct.VExp* %128, i64 0, i32 3, i32 0, i32 0
  %163 = load i32* %162, align 4, !tbaa !29
  %164 = icmp sgt i32 %163, 0
  br i1 %164, label %.lr.ph.i41, label %lookUpRef.exit43

.lr.ph.i41:                                       ; preds = %161, %.lr.ph.i41
  %i.02.i38 = phi i32 [ %167, %.lr.ph.i41 ], [ 0, %161 ]
  %.01.i39 = phi %struct.VContext* [ %166, %.lr.ph.i41 ], [ %13, %161 ]
  %165 = getelementptr inbounds %struct.VContext* %.01.i39, i64 0, i32 1
  %166 = load %struct.VContext** %165, align 8, !tbaa !11
  %167 = add nsw i32 %i.02.i38, 1
  %exitcond.i40 = icmp eq i32 %167, %163
  br i1 %exitcond.i40, label %lookUpRef.exit43, label %.lr.ph.i41

lookUpRef.exit43:                                 ; preds = %.lr.ph.i41, %161
  %.0.lcssa.i42 = phi %struct.VContext* [ %13, %161 ], [ %166, %.lr.ph.i41 ]
  %168 = getelementptr inbounds %struct.VContext* %.0.lcssa.i42, i64 0, i32 0
  %169 = load %struct.Value** %168, align 8, !tbaa !14
  %170 = icmp eq %struct.Value* %169, null
  br i1 %170, label %retainValue.exit, label %171

; <label>:171                                     ; preds = %lookUpRef.exit43
  %172 = getelementptr inbounds %struct.Value* %169, i64 0, i32 2
  %173 = load i32* %172, align 4, !tbaa !31
  %174 = add nsw i32 %173, 1
  store i32 %174, i32* %172, align 4, !tbaa !31
  br label %retainValue.exit

; <label>:175                                     ; preds = %159
  %176 = load %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %177 = icmp eq %struct.Value* %176, null
  br i1 %177, label %178, label %newRunningValue.exit

; <label>:178                                     ; preds = %175
  %179 = tail call noalias i8* @malloc(i64 40000) #7
  %180 = bitcast i8* %179 to %struct.Value*
  br label %181

; <label>:181                                     ; preds = %181, %178
  %indvars.iv.i.i44 = phi i64 [ 0, %178 ], [ %indvars.iv.next.i.i46, %181 ]
  %182 = phi %struct.Value* [ null, %178 ], [ %183, %181 ]
  %183 = getelementptr inbounds %struct.Value* %180, i64 %indvars.iv.i.i44
  %184 = getelementptr inbounds %struct.Value* %180, i64 %indvars.iv.i.i44, i32 1, i32 0, i32 0
  %.c.i.i45 = bitcast %struct.Value* %182 to %struct.VExp*
  store %struct.VExp* %.c.i.i45, %struct.VExp** %184, align 8, !tbaa !1
  %indvars.iv.next.i.i46 = add nuw nsw i64 %indvars.iv.i.i44, 1
  %exitcond.i.i47 = icmp eq i64 %indvars.iv.next.i.i46, 1000
  br i1 %exitcond.i.i47, label %.loopexit.i.i50, label %181

.loopexit.i.i50:                                  ; preds = %181
  %scevgep.i.i48 = getelementptr i8* %179, i64 39960
  %scevgep4.i.i49 = bitcast i8* %scevgep.i.i48 to %struct.Value*
  store %struct.Value* %scevgep4.i.i49, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  br label %newRunningValue.exit

newRunningValue.exit:                             ; preds = %175, %.loopexit.i.i50
  %185 = phi %struct.Value* [ %scevgep4.i.i49, %.loopexit.i.i50 ], [ %176, %175 ]
  %186 = getelementptr inbounds %struct.Value* %185, i64 0, i32 2
  store i32 1, i32* %186, align 4, !tbaa !31
  %187 = getelementptr inbounds %struct.Value* %185, i64 0, i32 1
  %188 = bitcast %union.anon.0* %187 to %struct.Value**
  %189 = load %struct.Value** %188, align 8, !tbaa !1
  store %struct.Value* %189, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %190 = getelementptr inbounds %struct.Value* %185, i64 0, i32 0
  store i32 2, i32* %190, align 4, !tbaa !33
  %191 = getelementptr inbounds %struct.Value* %185, i64 0, i32 1, i32 0, i32 0
  %192 = getelementptr inbounds %struct.Value* %185, i64 0, i32 1, i32 0, i32 2
  %193 = icmp eq %struct.VExp* %128, null
  %194 = bitcast %struct.VExp** %191 to i8*
  call void @llvm.memset.p0i8.i64(i8* %194, i8 0, i64 24, i32 8, i1 false)
  br i1 %193, label %retainVExp.exit51, label %195

; <label>:195                                     ; preds = %newRunningValue.exit
  %196 = getelementptr inbounds %struct.VExp* %128, i64 0, i32 4
  %197 = load i32* %196, align 4, !tbaa !23
  %198 = add nsw i32 %197, 1
  store i32 %198, i32* %196, align 4, !tbaa !23
  br label %retainVExp.exit51

retainVExp.exit51:                                ; preds = %newRunningValue.exit, %195
  br i1 %121, label %retainVContext.exit52, label %199

; <label>:199                                     ; preds = %retainVExp.exit51
  %200 = getelementptr inbounds %struct.VContext* %13, i64 0, i32 2
  %201 = load i32* %200, align 4, !tbaa !13
  %202 = add nsw i32 %201, 1
  store i32 %202, i32* %200, align 4, !tbaa !13
  br label %retainVContext.exit52

retainVContext.exit52:                            ; preds = %retainVExp.exit51, %199
  %203 = load %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  %204 = icmp eq %struct.Continuation* %203, null
  br i1 %204, label %205, label %pushEvalContinuation.exit

; <label>:205                                     ; preds = %retainVContext.exit52
  %206 = tail call noalias i8* @malloc(i64 32000) #7
  %207 = bitcast i8* %206 to %struct.Continuation*
  br label %208

; <label>:208                                     ; preds = %208, %205
  %indvars.iv.i.i55 = phi i64 [ 0, %205 ], [ %indvars.iv.next.i.i56, %208 ]
  %209 = phi %struct.Continuation* [ null, %205 ], [ %210, %208 ]
  %210 = getelementptr inbounds %struct.Continuation* %207, i64 %indvars.iv.i.i55
  %211 = getelementptr inbounds %struct.Continuation* %207, i64 %indvars.iv.i.i55, i32 2
  store %struct.Continuation* %209, %struct.Continuation** %211, align 8, !tbaa !15
  %indvars.iv.next.i.i56 = add nuw nsw i64 %indvars.iv.i.i55, 1
  %exitcond.i.i57 = icmp eq i64 %indvars.iv.next.i.i56, 1000
  br i1 %exitcond.i.i57, label %.loopexit.i.i59, label %208

.loopexit.i.i59:                                  ; preds = %208
  %scevgep.i.i58 = getelementptr i8* %206, i64 31968
  %scevgep3.i.i = bitcast i8* %scevgep.i.i58 to %struct.Continuation*
  store %struct.Continuation* %scevgep3.i.i, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  br label %pushEvalContinuation.exit

pushEvalContinuation.exit:                        ; preds = %retainVContext.exit52, %.loopexit.i.i59
  %212 = phi %struct.Continuation* [ %scevgep3.i.i, %.loopexit.i.i59 ], [ %203, %retainVContext.exit52 ]
  %213 = getelementptr inbounds %struct.Continuation* %212, i64 0, i32 2
  %214 = load %struct.Continuation** %213, align 8, !tbaa !15
  store %struct.Continuation* %214, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  %215 = getelementptr inbounds %struct.Continuation* %212, i64 0, i32 0
  store i32 0, i32* %215, align 4, !tbaa !17
  %216 = getelementptr inbounds %struct.Continuation* %212, i64 0, i32 1, i32 0, i32 0
  store %struct.VExp* %128, %struct.VExp** %216, align 8, !tbaa !18
  %217 = getelementptr inbounds %struct.Continuation* %212, i64 0, i32 1, i32 0, i32 1
  store %struct.VContext* %13, %struct.VContext** %217, align 8, !tbaa !20
  %218 = load %struct.Continuation** %192, align 8, !tbaa !37
  store %struct.Continuation* %218, %struct.Continuation** %213, align 8, !tbaa !15
  store %struct.Continuation* %212, %struct.Continuation** %192, align 8, !tbaa !37
  br label %retainValue.exit

retainValue.exit:                                 ; preds = %171, %lookUpRef.exit43, %pushEvalContinuation.exit, %newResolvedValue.exit
  %nvx.0 = phi %struct.Value* [ %151, %newResolvedValue.exit ], [ %185, %pushEvalContinuation.exit ], [ null, %lookUpRef.exit43 ], [ %169, %171 ]
  %219 = getelementptr inbounds %struct.Value* %v, i64 0, i32 1, i32 0, i32 0
  %220 = load %struct.VExp** %219, align 8, !tbaa !34
  %221 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %220) #7
  store %struct.VExp* null, %struct.VExp** %219, align 8, !tbaa !34
  %222 = getelementptr inbounds %struct.Value* %v, i64 0, i32 1, i32 0, i32 1
  %223 = load %struct.VContext** %222, align 8, !tbaa !36
  %224 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %223) #7
  store %struct.VContext* null, %struct.VContext** %222, align 8, !tbaa !36
  %225 = load %struct.Continuation** %1, align 8, !tbaa !37
  %226 = getelementptr inbounds %struct.Continuation* %225, i64 0, i32 2
  %227 = load %struct.Continuation** %226, align 8, !tbaa !15
  %228 = icmp eq %struct.Continuation* %225, null
  br i1 %228, label %popContinuation.exit61, label %229

; <label>:229                                     ; preds = %retainValue.exit
  %230 = getelementptr inbounds %struct.Continuation* %225, i64 0, i32 0
  %231 = load i32* %230, align 4, !tbaa !17
  switch i32 %231, label %allocateContinuation.exit.i.i60 [
    i32 0, label %232
    i32 1, label %239
  ]

; <label>:232                                     ; preds = %229
  %233 = getelementptr inbounds %struct.Continuation* %225, i64 0, i32 1, i32 0, i32 0
  %234 = load %struct.VExp** %233, align 8, !tbaa !18
  %235 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %234) #7
  %236 = getelementptr inbounds %struct.Continuation* %225, i64 0, i32 1, i32 0, i32 1
  %237 = load %struct.VContext** %236, align 8, !tbaa !20
  %238 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %237) #7
  br label %allocateContinuation.exit.i.i60

; <label>:239                                     ; preds = %229
  %240 = getelementptr inbounds %struct.Continuation* %225, i64 0, i32 1
  %241 = bitcast %union.anon.8* %240 to %struct.Value**
  %242 = load %struct.Value** %241, align 8, !tbaa !21
  %243 = tail call %struct.Value* @releaseValue(%struct.Value* %242) #7
  br label %allocateContinuation.exit.i.i60

allocateContinuation.exit.i.i60:                  ; preds = %239, %232, %229
  %244 = load %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  store %struct.Continuation* %244, %struct.Continuation** %226, align 8, !tbaa !15
  store %struct.Continuation* %225, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  br label %popContinuation.exit61

popContinuation.exit61:                           ; preds = %retainValue.exit, %allocateContinuation.exit.i.i60
  store %struct.Continuation* %227, %struct.Continuation** %1, align 8, !tbaa !37
  %245 = load %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  %246 = icmp eq %struct.Continuation* %245, null
  br i1 %246, label %247, label %pushApplyContinuation.exit

; <label>:247                                     ; preds = %popContinuation.exit61
  %248 = tail call noalias i8* @malloc(i64 32000) #7
  %249 = bitcast i8* %248 to %struct.Continuation*
  br label %250

; <label>:250                                     ; preds = %250, %247
  %indvars.iv.i.i62 = phi i64 [ 0, %247 ], [ %indvars.iv.next.i.i63, %250 ]
  %251 = phi %struct.Continuation* [ null, %247 ], [ %252, %250 ]
  %252 = getelementptr inbounds %struct.Continuation* %249, i64 %indvars.iv.i.i62
  %253 = getelementptr inbounds %struct.Continuation* %249, i64 %indvars.iv.i.i62, i32 2
  store %struct.Continuation* %251, %struct.Continuation** %253, align 8, !tbaa !15
  %indvars.iv.next.i.i63 = add nuw nsw i64 %indvars.iv.i.i62, 1
  %exitcond.i.i64 = icmp eq i64 %indvars.iv.next.i.i63, 1000
  br i1 %exitcond.i.i64, label %.loopexit.i.i67, label %250

.loopexit.i.i67:                                  ; preds = %250
  %scevgep.i.i65 = getelementptr i8* %248, i64 31968
  %scevgep3.i.i66 = bitcast i8* %scevgep.i.i65 to %struct.Continuation*
  store %struct.Continuation* %scevgep3.i.i66, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  br label %pushApplyContinuation.exit

pushApplyContinuation.exit:                       ; preds = %popContinuation.exit61, %.loopexit.i.i67
  %254 = phi %struct.Continuation* [ %scevgep3.i.i66, %.loopexit.i.i67 ], [ %245, %popContinuation.exit61 ]
  %255 = getelementptr inbounds %struct.Continuation* %254, i64 0, i32 2
  %256 = load %struct.Continuation** %255, align 8, !tbaa !15
  store %struct.Continuation* %256, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  %257 = getelementptr inbounds %struct.Continuation* %254, i64 0, i32 0
  store i32 1, i32* %257, align 4, !tbaa !17
  %258 = getelementptr inbounds %struct.Continuation* %254, i64 0, i32 1, i32 0, i32 0
  %ap_x.c.i = bitcast %struct.Value* %nvx.0 to %struct.VExp*
  store %struct.VExp* %ap_x.c.i, %struct.VExp** %258, align 8, !tbaa !21
  %259 = load %struct.Continuation** %1, align 8, !tbaa !37
  store %struct.Continuation* %259, %struct.Continuation** %255, align 8, !tbaa !15
  store %struct.Continuation* %254, %struct.Continuation** %1, align 8, !tbaa !37
  %260 = load %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  %261 = icmp eq %struct.Continuation* %260, null
  br i1 %261, label %262, label %pushEvalContinuation.exit74

; <label>:262                                     ; preds = %pushApplyContinuation.exit
  %263 = tail call noalias i8* @malloc(i64 32000) #7
  %264 = bitcast i8* %263 to %struct.Continuation*
  br label %265

; <label>:265                                     ; preds = %265, %262
  %indvars.iv.i.i68 = phi i64 [ 0, %262 ], [ %indvars.iv.next.i.i69, %265 ]
  %266 = phi %struct.Continuation* [ null, %262 ], [ %267, %265 ]
  %267 = getelementptr inbounds %struct.Continuation* %264, i64 %indvars.iv.i.i68
  %268 = getelementptr inbounds %struct.Continuation* %264, i64 %indvars.iv.i.i68, i32 2
  store %struct.Continuation* %266, %struct.Continuation** %268, align 8, !tbaa !15
  %indvars.iv.next.i.i69 = add nuw nsw i64 %indvars.iv.i.i68, 1
  %exitcond.i.i70 = icmp eq i64 %indvars.iv.next.i.i69, 1000
  br i1 %exitcond.i.i70, label %.loopexit.i.i73, label %265

.loopexit.i.i73:                                  ; preds = %265
  %scevgep.i.i71 = getelementptr i8* %263, i64 31968
  %scevgep3.i.i72 = bitcast i8* %scevgep.i.i71 to %struct.Continuation*
  store %struct.Continuation* %scevgep3.i.i72, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  br label %pushEvalContinuation.exit74

pushEvalContinuation.exit74:                      ; preds = %pushApplyContinuation.exit, %.loopexit.i.i73
  %269 = phi %struct.Continuation* [ %scevgep3.i.i72, %.loopexit.i.i73 ], [ %260, %pushApplyContinuation.exit ]
  %270 = getelementptr inbounds %struct.Continuation* %269, i64 0, i32 2
  %271 = load %struct.Continuation** %270, align 8, !tbaa !15
  store %struct.Continuation* %271, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  %272 = getelementptr inbounds %struct.Continuation* %269, i64 0, i32 0
  store i32 0, i32* %272, align 4, !tbaa !17
  %273 = getelementptr inbounds %struct.Continuation* %269, i64 0, i32 1, i32 0, i32 0
  store %struct.VExp* %115, %struct.VExp** %273, align 8, !tbaa !18
  %274 = getelementptr inbounds %struct.Continuation* %269, i64 0, i32 1, i32 0, i32 1
  store %struct.VContext* %13, %struct.VContext** %274, align 8, !tbaa !20
  %275 = load %struct.Continuation** %1, align 8, !tbaa !37
  store %struct.Continuation* %275, %struct.Continuation** %270, align 8, !tbaa !15
  store %struct.Continuation* %269, %struct.Continuation** %1, align 8, !tbaa !37
  br label %1128

; <label>:276                                     ; preds = %6
  %277 = getelementptr inbounds %struct.Value* %v, i64 0, i32 1, i32 0, i32 0
  %278 = load %struct.VExp** %277, align 8, !tbaa !34
  %279 = getelementptr inbounds %struct.Value* %v, i64 0, i32 1, i32 0, i32 1
  %280 = load %struct.VContext** %279, align 8, !tbaa !36
  %281 = getelementptr inbounds %struct.Continuation* %2, i64 0, i32 1
  %282 = bitcast %union.anon.8* %281 to %struct.Value**
  %283 = load %struct.Value** %282, align 8, !tbaa !21
  %284 = getelementptr inbounds %struct.VExp* %278, i64 0, i32 0
  %285 = load i32* %284, align 4, !tbaa !25
  switch i32 %285, label %1128 [
    i32 0, label %286
    i32 1, label %287
    i32 2, label %387
    i32 3, label %524
    i32 4, label %1006
    i32 5, label %1093
  ]

; <label>:286                                     ; preds = %276
  tail call void @setExceptionValue(%struct.Value* %v, i8* getelementptr inbounds ([37 x i8]* @.str42, i64 0, i64 0))
  br label %1128

; <label>:287                                     ; preds = %276
  %288 = icmp eq %struct.Value* %283, null
  br i1 %288, label %retainValue.exit75, label %289

; <label>:289                                     ; preds = %287
  %290 = getelementptr inbounds %struct.Value* %283, i64 0, i32 2
  %291 = load i32* %290, align 4, !tbaa !31
  %292 = add nsw i32 %291, 1
  store i32 %292, i32* %290, align 4, !tbaa !31
  br label %retainValue.exit75

retainValue.exit75:                               ; preds = %287, %289
  %293 = icmp eq %struct.VContext* %280, null
  br i1 %293, label %retainVContext.exit76, label %294

; <label>:294                                     ; preds = %retainValue.exit75
  %295 = getelementptr inbounds %struct.VContext* %280, i64 0, i32 2
  %296 = load i32* %295, align 4, !tbaa !13
  %297 = add nsw i32 %296, 1
  store i32 %297, i32* %295, align 4, !tbaa !13
  br label %retainVContext.exit76

retainVContext.exit76:                            ; preds = %retainValue.exit75, %294
  %298 = load %struct.VContext** @allocateVContext.pool, align 8, !tbaa !1
  %299 = icmp eq %struct.VContext* %298, null
  br i1 %299, label %300, label %insertRef.exit

; <label>:300                                     ; preds = %retainVContext.exit76
  %301 = tail call noalias i8* @malloc(i64 24000) #7
  %302 = bitcast i8* %301 to %struct.VContext*
  br label %303

; <label>:303                                     ; preds = %303, %300
  %indvars.iv.i.i77 = phi i64 [ 0, %300 ], [ %indvars.iv.next.i.i78, %303 ]
  %304 = phi %struct.VContext* [ null, %300 ], [ %305, %303 ]
  %305 = getelementptr inbounds %struct.VContext* %302, i64 %indvars.iv.i.i77
  %306 = getelementptr inbounds %struct.VContext* %302, i64 %indvars.iv.i.i77, i32 1
  store %struct.VContext* %304, %struct.VContext** %306, align 8, !tbaa !11
  %indvars.iv.next.i.i78 = add nuw nsw i64 %indvars.iv.i.i77, 1
  %exitcond.i.i79 = icmp eq i64 %indvars.iv.next.i.i78, 1000
  br i1 %exitcond.i.i79, label %.loopexit.i.i82, label %303

.loopexit.i.i82:                                  ; preds = %303
  %scevgep.i.i80 = getelementptr i8* %301, i64 23976
  %scevgep3.i.i81 = bitcast i8* %scevgep.i.i80 to %struct.VContext*
  store %struct.VContext* %scevgep3.i.i81, %struct.VContext** @allocateVContext.pool, align 8, !tbaa !1
  br label %insertRef.exit

insertRef.exit:                                   ; preds = %retainVContext.exit76, %.loopexit.i.i82
  %307 = phi %struct.VContext* [ %scevgep3.i.i81, %.loopexit.i.i82 ], [ %298, %retainVContext.exit76 ]
  %308 = getelementptr inbounds %struct.VContext* %307, i64 0, i32 2
  store i32 1, i32* %308, align 4, !tbaa !13
  %309 = getelementptr inbounds %struct.VContext* %307, i64 0, i32 1
  %310 = load %struct.VContext** %309, align 8, !tbaa !11
  store %struct.VContext* %310, %struct.VContext** @allocateVContext.pool, align 8, !tbaa !1
  %311 = getelementptr inbounds %struct.VContext* %307, i64 0, i32 0
  store %struct.Value* %283, %struct.Value** %311, align 8, !tbaa !14
  store %struct.VContext* %280, %struct.VContext** %309, align 8, !tbaa !11
  %312 = getelementptr inbounds %struct.VExp* %278, i64 0, i32 3
  %313 = bitcast %union.anon.1* %312 to %struct.VExp**
  %314 = load %struct.VExp** %313, align 8, !tbaa !1
  %315 = icmp eq %struct.VExp* %314, null
  br i1 %315, label %retainVExp.exit83, label %316

; <label>:316                                     ; preds = %insertRef.exit
  %317 = getelementptr inbounds %struct.VExp* %314, i64 0, i32 4
  %318 = load i32* %317, align 4, !tbaa !23
  %319 = add nsw i32 %318, 1
  store i32 %319, i32* %317, align 4, !tbaa !23
  br label %retainVExp.exit83

retainVExp.exit83:                                ; preds = %insertRef.exit, %316
  %320 = getelementptr inbounds %struct.VExp* %314, i64 0, i32 0
  %321 = load i32* %320, align 4, !tbaa !25
  %322 = icmp ult i32 %321, 6
  %323 = load %struct.VExp** %277, align 8, !tbaa !34
  %324 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %323) #7
  br i1 %322, label %325, label %348

; <label>:325                                     ; preds = %retainVExp.exit83
  store %struct.VExp* %314, %struct.VExp** %277, align 8, !tbaa !34
  %326 = load %struct.VContext** %279, align 8, !tbaa !36
  %327 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %326) #7
  store %struct.VContext* %307, %struct.VContext** %279, align 8, !tbaa !36
  %328 = load %struct.Continuation** %1, align 8, !tbaa !37
  %329 = getelementptr inbounds %struct.Continuation* %328, i64 0, i32 2
  %330 = load %struct.Continuation** %329, align 8, !tbaa !15
  %331 = icmp eq %struct.Continuation* %328, null
  br i1 %331, label %popContinuation.exit85, label %332

; <label>:332                                     ; preds = %325
  %333 = getelementptr inbounds %struct.Continuation* %328, i64 0, i32 0
  %334 = load i32* %333, align 4, !tbaa !17
  switch i32 %334, label %allocateContinuation.exit.i.i84 [
    i32 0, label %335
    i32 1, label %342
  ]

; <label>:335                                     ; preds = %332
  %336 = getelementptr inbounds %struct.Continuation* %328, i64 0, i32 1, i32 0, i32 0
  %337 = load %struct.VExp** %336, align 8, !tbaa !18
  %338 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %337) #7
  %339 = getelementptr inbounds %struct.Continuation* %328, i64 0, i32 1, i32 0, i32 1
  %340 = load %struct.VContext** %339, align 8, !tbaa !20
  %341 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %340) #7
  br label %allocateContinuation.exit.i.i84

; <label>:342                                     ; preds = %332
  %343 = getelementptr inbounds %struct.Continuation* %328, i64 0, i32 1
  %344 = bitcast %union.anon.8* %343 to %struct.Value**
  %345 = load %struct.Value** %344, align 8, !tbaa !21
  %346 = tail call %struct.Value* @releaseValue(%struct.Value* %345) #7
  br label %allocateContinuation.exit.i.i84

allocateContinuation.exit.i.i84:                  ; preds = %342, %335, %332
  %347 = load %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  store %struct.Continuation* %347, %struct.Continuation** %329, align 8, !tbaa !15
  store %struct.Continuation* %328, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  br label %popContinuation.exit85

popContinuation.exit85:                           ; preds = %325, %allocateContinuation.exit.i.i84
  store %struct.Continuation* %330, %struct.Continuation** %1, align 8, !tbaa !37
  br label %1128

; <label>:348                                     ; preds = %retainVExp.exit83
  store %struct.VExp* null, %struct.VExp** %277, align 8, !tbaa !34
  %349 = load %struct.VContext** %279, align 8, !tbaa !36
  %350 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %349) #7
  store %struct.VContext* null, %struct.VContext** %279, align 8, !tbaa !36
  %351 = load %struct.Continuation** %1, align 8, !tbaa !37
  %352 = getelementptr inbounds %struct.Continuation* %351, i64 0, i32 2
  %353 = load %struct.Continuation** %352, align 8, !tbaa !15
  %354 = icmp eq %struct.Continuation* %351, null
  br i1 %354, label %popContinuation.exit87, label %355

; <label>:355                                     ; preds = %348
  %356 = getelementptr inbounds %struct.Continuation* %351, i64 0, i32 0
  %357 = load i32* %356, align 4, !tbaa !17
  switch i32 %357, label %allocateContinuation.exit.i.i86 [
    i32 0, label %358
    i32 1, label %365
  ]

; <label>:358                                     ; preds = %355
  %359 = getelementptr inbounds %struct.Continuation* %351, i64 0, i32 1, i32 0, i32 0
  %360 = load %struct.VExp** %359, align 8, !tbaa !18
  %361 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %360) #7
  %362 = getelementptr inbounds %struct.Continuation* %351, i64 0, i32 1, i32 0, i32 1
  %363 = load %struct.VContext** %362, align 8, !tbaa !20
  %364 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %363) #7
  br label %allocateContinuation.exit.i.i86

; <label>:365                                     ; preds = %355
  %366 = getelementptr inbounds %struct.Continuation* %351, i64 0, i32 1
  %367 = bitcast %union.anon.8* %366 to %struct.Value**
  %368 = load %struct.Value** %367, align 8, !tbaa !21
  %369 = tail call %struct.Value* @releaseValue(%struct.Value* %368) #7
  br label %allocateContinuation.exit.i.i86

allocateContinuation.exit.i.i86:                  ; preds = %365, %358, %355
  %370 = load %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  store %struct.Continuation* %370, %struct.Continuation** %352, align 8, !tbaa !15
  store %struct.Continuation* %351, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  br label %popContinuation.exit87

popContinuation.exit87:                           ; preds = %348, %allocateContinuation.exit.i.i86
  store %struct.Continuation* %353, %struct.Continuation** %1, align 8, !tbaa !37
  %371 = load %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  %372 = icmp eq %struct.Continuation* %371, null
  br i1 %372, label %373, label %pushEvalContinuation.exit94

; <label>:373                                     ; preds = %popContinuation.exit87
  %374 = tail call noalias i8* @malloc(i64 32000) #7
  %375 = bitcast i8* %374 to %struct.Continuation*
  br label %376

; <label>:376                                     ; preds = %376, %373
  %indvars.iv.i.i88 = phi i64 [ 0, %373 ], [ %indvars.iv.next.i.i89, %376 ]
  %377 = phi %struct.Continuation* [ null, %373 ], [ %378, %376 ]
  %378 = getelementptr inbounds %struct.Continuation* %375, i64 %indvars.iv.i.i88
  %379 = getelementptr inbounds %struct.Continuation* %375, i64 %indvars.iv.i.i88, i32 2
  store %struct.Continuation* %377, %struct.Continuation** %379, align 8, !tbaa !15
  %indvars.iv.next.i.i89 = add nuw nsw i64 %indvars.iv.i.i88, 1
  %exitcond.i.i90 = icmp eq i64 %indvars.iv.next.i.i89, 1000
  br i1 %exitcond.i.i90, label %.loopexit.i.i93, label %376

.loopexit.i.i93:                                  ; preds = %376
  %scevgep.i.i91 = getelementptr i8* %374, i64 31968
  %scevgep3.i.i92 = bitcast i8* %scevgep.i.i91 to %struct.Continuation*
  store %struct.Continuation* %scevgep3.i.i92, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  br label %pushEvalContinuation.exit94

pushEvalContinuation.exit94:                      ; preds = %popContinuation.exit87, %.loopexit.i.i93
  %380 = phi %struct.Continuation* [ %scevgep3.i.i92, %.loopexit.i.i93 ], [ %371, %popContinuation.exit87 ]
  %381 = getelementptr inbounds %struct.Continuation* %380, i64 0, i32 2
  %382 = load %struct.Continuation** %381, align 8, !tbaa !15
  store %struct.Continuation* %382, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  %383 = getelementptr inbounds %struct.Continuation* %380, i64 0, i32 0
  store i32 0, i32* %383, align 4, !tbaa !17
  %384 = getelementptr inbounds %struct.Continuation* %380, i64 0, i32 1, i32 0, i32 0
  store %struct.VExp* %314, %struct.VExp** %384, align 8, !tbaa !18
  %385 = getelementptr inbounds %struct.Continuation* %380, i64 0, i32 1, i32 0, i32 1
  store %struct.VContext* %307, %struct.VContext** %385, align 8, !tbaa !20
  %386 = load %struct.Continuation** %1, align 8, !tbaa !37
  store %struct.Continuation* %386, %struct.Continuation** %381, align 8, !tbaa !15
  store %struct.Continuation* %380, %struct.Continuation** %1, align 8, !tbaa !37
  br label %1128

; <label>:387                                     ; preds = %276
  %388 = getelementptr inbounds %struct.Value* %283, i64 0, i32 0
  %389 = load i32* %388, align 4, !tbaa !33
  %switch = icmp ult i32 %389, 2
  br i1 %switch, label %390, label %1129

; <label>:390                                     ; preds = %387
  %391 = icmp eq i32 %389, 1
  br i1 %391, label %392, label %396

; <label>:392                                     ; preds = %390
  %393 = getelementptr inbounds %struct.Value* %283, i64 0, i32 1
  %394 = bitcast %union.anon.0* %393 to i8**
  %395 = load i8** %394, align 8, !tbaa !1
  tail call void @setExceptionValue(%struct.Value* %v, i8* %395)
  br label %1128

; <label>:396                                     ; preds = %390
  %397 = getelementptr inbounds %struct.Value* %283, i64 0, i32 1, i32 0, i32 0
  %398 = load %struct.VExp** %397, align 8, !tbaa !18
  %399 = getelementptr inbounds %struct.VExp* %398, i64 0, i32 0
  %400 = load i32* %399, align 4, !tbaa !25
  %401 = icmp eq i32 %400, 0
  br i1 %401, label %403, label %402

; <label>:402                                     ; preds = %396
  tail call void @setExceptionValue(%struct.Value* %v, i8* getelementptr inbounds ([52 x i8]* @.str43, i64 0, i64 0))
  br label %1128

; <label>:403                                     ; preds = %396
  %404 = getelementptr inbounds %struct.VExp* %278, i64 0, i32 3, i32 0, i32 0
  %405 = load i32* %404, align 4, !tbaa !38
  %406 = icmp ult i32 %405, 11
  br i1 %406, label %407, label %433

; <label>:407                                     ; preds = %403
  %408 = getelementptr inbounds %struct.VExp* %398, i64 0, i32 3, i32 0, i32 0
  %409 = load i32* %408, align 1
  %410 = getelementptr %struct.VExp* %398, i64 0, i32 3, i32 0, i32 2
  %411 = bitcast %union.SyscallArg* %410 to i64*
  %412 = load i64* %411, align 1
  %413 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %414 = icmp eq %struct.VExp* %413, null
  br i1 %414, label %415, label %newVExpNumfunc1.exit

; <label>:415                                     ; preds = %407
  %416 = tail call noalias i8* @malloc(i64 56000) #7
  %417 = bitcast i8* %416 to %struct.VExp*
  br label %418

; <label>:418                                     ; preds = %418, %415
  %indvars.iv.i.i95 = phi i64 [ 0, %415 ], [ %indvars.iv.next.i.i96, %418 ]
  %419 = phi %struct.VExp* [ null, %415 ], [ %420, %418 ]
  %420 = getelementptr inbounds %struct.VExp* %417, i64 %indvars.iv.i.i95
  %421 = getelementptr inbounds %struct.VExp* %417, i64 %indvars.iv.i.i95, i32 3
  %422 = bitcast %union.anon.1* %421 to %struct.VExp**
  store %struct.VExp* %419, %struct.VExp** %422, align 8, !tbaa !1
  %indvars.iv.next.i.i96 = add nuw nsw i64 %indvars.iv.i.i95, 1
  %exitcond.i.i97 = icmp eq i64 %indvars.iv.next.i.i96, 1000
  br i1 %exitcond.i.i97, label %.loopexit.i.i100, label %418

.loopexit.i.i100:                                 ; preds = %418
  %scevgep.i.i98 = getelementptr i8* %416, i64 55944
  %scevgep3.i.i99 = bitcast i8* %scevgep.i.i98 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i99, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNumfunc1.exit

newVExpNumfunc1.exit:                             ; preds = %407, %.loopexit.i.i100
  %423 = phi %struct.VExp* [ %scevgep3.i.i99, %.loopexit.i.i100 ], [ %413, %407 ]
  %424 = getelementptr inbounds %struct.VExp* %423, i64 0, i32 4
  store i32 1, i32* %424, align 4, !tbaa !23
  %425 = getelementptr inbounds %struct.VExp* %423, i64 0, i32 3
  %426 = bitcast %union.anon.1* %425 to %struct.VExp**
  %427 = load %struct.VExp** %426, align 8, !tbaa !1
  store %struct.VExp* %427, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %428 = getelementptr inbounds %struct.VExp* %423, i64 0, i32 0
  store i32 3, i32* %428, align 4, !tbaa !25
  %429 = getelementptr inbounds %struct.VExp* %423, i64 0, i32 3, i32 0, i32 0
  store i32 %405, i32* %429, align 4, !tbaa !40
  %430 = getelementptr inbounds %struct.VExp* %423, i64 0, i32 3, i32 0, i32 2
  %431 = bitcast %union.SyscallArg* %430 to i32*
  store i32 %409, i32* %431, align 8
  %432 = getelementptr inbounds %union.SyscallArg* %430, i64 1, i32 0
  %func1_opa.coerce1.c.i = inttoptr i64 %412 to %struct.IntList*
  store %struct.IntList* %func1_opa.coerce1.c.i, %struct.IntList** %432, align 8
  br label %retainVExp.exit101

; <label>:433                                     ; preds = %403
  switch i32 %405, label %retainVExp.exit101 [
    i32 13, label %434
    i32 12, label %469
  ]

; <label>:434                                     ; preds = %433
  %435 = getelementptr inbounds %struct.VExp* %398, i64 0, i32 3, i32 0, i32 0
  %436 = load i32* %435, align 4, !tbaa !44
  %437 = icmp eq i32 %436, 0
  br i1 %437, label %438, label %444

; <label>:438                                     ; preds = %434
  %439 = icmp eq %struct.VExp* %398, null
  br i1 %439, label %retainVExp.exit101, label %440

; <label>:440                                     ; preds = %438
  %441 = getelementptr inbounds %struct.VExp* %398, i64 0, i32 4
  %442 = load i32* %441, align 4, !tbaa !23
  %443 = add nsw i32 %442, 1
  store i32 %443, i32* %441, align 4, !tbaa !23
  br label %retainVExp.exit101

; <label>:444                                     ; preds = %434
  %445 = getelementptr inbounds %struct.VExp* %398, i64 0, i32 3, i32 0, i32 2
  %446 = bitcast %union.SyscallArg* %445 to double*
  %447 = load double* %446, align 8, !tbaa !47
  %448 = tail call double @floor(double %447) #9
  %449 = fptosi double %448 to i32
  %450 = zext i32 %449 to i64
  %451 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %452 = icmp eq %struct.VExp* %451, null
  br i1 %452, label %453, label %newVExpNum.exit

; <label>:453                                     ; preds = %444
  %454 = tail call noalias i8* @malloc(i64 56000) #7
  %455 = bitcast i8* %454 to %struct.VExp*
  br label %456

; <label>:456                                     ; preds = %456, %453
  %indvars.iv.i.i102 = phi i64 [ 0, %453 ], [ %indvars.iv.next.i.i103, %456 ]
  %457 = phi %struct.VExp* [ null, %453 ], [ %458, %456 ]
  %458 = getelementptr inbounds %struct.VExp* %455, i64 %indvars.iv.i.i102
  %459 = getelementptr inbounds %struct.VExp* %455, i64 %indvars.iv.i.i102, i32 3
  %460 = bitcast %union.anon.1* %459 to %struct.VExp**
  store %struct.VExp* %457, %struct.VExp** %460, align 8, !tbaa !1
  %indvars.iv.next.i.i103 = add nuw nsw i64 %indvars.iv.i.i102, 1
  %exitcond.i.i104 = icmp eq i64 %indvars.iv.next.i.i103, 1000
  br i1 %exitcond.i.i104, label %.loopexit.i.i107, label %456

.loopexit.i.i107:                                 ; preds = %456
  %scevgep.i.i105 = getelementptr i8* %454, i64 55944
  %scevgep3.i.i106 = bitcast i8* %scevgep.i.i105 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i106, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNum.exit

newVExpNum.exit:                                  ; preds = %444, %.loopexit.i.i107
  %461 = phi %struct.VExp* [ %scevgep3.i.i106, %.loopexit.i.i107 ], [ %451, %444 ]
  %462 = getelementptr inbounds %struct.VExp* %461, i64 0, i32 4
  store i32 1, i32* %462, align 4, !tbaa !23
  %463 = getelementptr inbounds %struct.VExp* %461, i64 0, i32 3
  %464 = bitcast %union.anon.1* %463 to %struct.VExp**
  %465 = load %struct.VExp** %464, align 8, !tbaa !1
  store %struct.VExp* %465, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %466 = getelementptr inbounds %struct.VExp* %461, i64 0, i32 0
  store i32 0, i32* %466, align 4, !tbaa !25
  %467 = getelementptr inbounds %struct.VExp* %461, i64 0, i32 3, i32 0, i32 0
  store i32 0, i32* %467, align 8
  %468 = getelementptr inbounds %struct.VExp* %461, i64 0, i32 3, i32 0, i32 2, i32 0
  %num_val.coerce1.c.i = inttoptr i64 %450 to %struct.IntList*
  store %struct.IntList* %num_val.coerce1.c.i, %struct.IntList** %468, align 8
  br label %retainVExp.exit101

; <label>:469                                     ; preds = %433
  %470 = getelementptr inbounds %struct.VExp* %398, i64 0, i32 3, i32 0, i32 0
  %471 = load i32* %470, align 4, !tbaa !44
  %472 = icmp eq i32 %471, 1
  br i1 %472, label %retainVExp.exit108, label %476

retainVExp.exit108:                               ; preds = %469
  %473 = getelementptr inbounds %struct.VExp* %398, i64 0, i32 4
  %474 = load i32* %473, align 4, !tbaa !23
  %475 = add nsw i32 %474, 1
  store i32 %475, i32* %473, align 4, !tbaa !23
  br label %retainVExp.exit101

; <label>:476                                     ; preds = %469
  %477 = getelementptr inbounds %struct.VExp* %398, i64 0, i32 3, i32 0, i32 2
  %478 = bitcast %union.SyscallArg* %477 to i32*
  %479 = load i32* %478, align 4, !tbaa !29
  %480 = sitofp i32 %479 to double
  %481 = bitcast double %480 to i64
  %482 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %483 = icmp eq %struct.VExp* %482, null
  br i1 %483, label %484, label %newVExpNum.exit116

; <label>:484                                     ; preds = %476
  %485 = tail call noalias i8* @malloc(i64 56000) #7
  %486 = bitcast i8* %485 to %struct.VExp*
  br label %487

; <label>:487                                     ; preds = %487, %484
  %indvars.iv.i.i109 = phi i64 [ 0, %484 ], [ %indvars.iv.next.i.i110, %487 ]
  %488 = phi %struct.VExp* [ null, %484 ], [ %489, %487 ]
  %489 = getelementptr inbounds %struct.VExp* %486, i64 %indvars.iv.i.i109
  %490 = getelementptr inbounds %struct.VExp* %486, i64 %indvars.iv.i.i109, i32 3
  %491 = bitcast %union.anon.1* %490 to %struct.VExp**
  store %struct.VExp* %488, %struct.VExp** %491, align 8, !tbaa !1
  %indvars.iv.next.i.i110 = add nuw nsw i64 %indvars.iv.i.i109, 1
  %exitcond.i.i111 = icmp eq i64 %indvars.iv.next.i.i110, 1000
  br i1 %exitcond.i.i111, label %.loopexit.i.i114, label %487

.loopexit.i.i114:                                 ; preds = %487
  %scevgep.i.i112 = getelementptr i8* %485, i64 55944
  %scevgep3.i.i113 = bitcast i8* %scevgep.i.i112 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i113, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNum.exit116

newVExpNum.exit116:                               ; preds = %476, %.loopexit.i.i114
  %492 = phi %struct.VExp* [ %scevgep3.i.i113, %.loopexit.i.i114 ], [ %482, %476 ]
  %493 = getelementptr inbounds %struct.VExp* %492, i64 0, i32 4
  store i32 1, i32* %493, align 4, !tbaa !23
  %494 = getelementptr inbounds %struct.VExp* %492, i64 0, i32 3
  %495 = bitcast %union.anon.1* %494 to %struct.VExp**
  %496 = load %struct.VExp** %495, align 8, !tbaa !1
  store %struct.VExp* %496, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %497 = getelementptr inbounds %struct.VExp* %492, i64 0, i32 0
  store i32 0, i32* %497, align 4, !tbaa !25
  %498 = getelementptr inbounds %struct.VExp* %492, i64 0, i32 3, i32 0, i32 0
  store i32 1, i32* %498, align 8
  %499 = getelementptr inbounds %struct.VExp* %492, i64 0, i32 3, i32 0, i32 2, i32 0
  %num_val.coerce1.c.i115 = inttoptr i64 %481 to %struct.IntList*
  store %struct.IntList* %num_val.coerce1.c.i115, %struct.IntList** %499, align 8
  br label %retainVExp.exit101

retainVExp.exit101:                               ; preds = %440, %438, %433, %newVExpNum.exit, %retainVExp.exit108, %newVExpNum.exit116, %newVExpNumfunc1.exit
  %nexp4.0 = phi %struct.VExp* [ %423, %newVExpNumfunc1.exit ], [ %461, %newVExpNum.exit ], [ %398, %retainVExp.exit108 ], [ %492, %newVExpNum.exit116 ], [ null, %433 ], [ null, %438 ], [ %398, %440 ]
  %500 = load %struct.VExp** %277, align 8, !tbaa !34
  %501 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %500) #7
  store %struct.VExp* %nexp4.0, %struct.VExp** %277, align 8, !tbaa !34
  %502 = load %struct.VContext** %279, align 8, !tbaa !36
  %503 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %502) #7
  store %struct.VContext* null, %struct.VContext** %279, align 8, !tbaa !36
  %504 = load %struct.Continuation** %1, align 8, !tbaa !37
  %505 = getelementptr inbounds %struct.Continuation* %504, i64 0, i32 2
  %506 = load %struct.Continuation** %505, align 8, !tbaa !15
  %507 = icmp eq %struct.Continuation* %504, null
  br i1 %507, label %popContinuation.exit118, label %508

; <label>:508                                     ; preds = %retainVExp.exit101
  %509 = getelementptr inbounds %struct.Continuation* %504, i64 0, i32 0
  %510 = load i32* %509, align 4, !tbaa !17
  switch i32 %510, label %allocateContinuation.exit.i.i117 [
    i32 0, label %511
    i32 1, label %518
  ]

; <label>:511                                     ; preds = %508
  %512 = getelementptr inbounds %struct.Continuation* %504, i64 0, i32 1, i32 0, i32 0
  %513 = load %struct.VExp** %512, align 8, !tbaa !18
  %514 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %513) #7
  %515 = getelementptr inbounds %struct.Continuation* %504, i64 0, i32 1, i32 0, i32 1
  %516 = load %struct.VContext** %515, align 8, !tbaa !20
  %517 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %516) #7
  br label %allocateContinuation.exit.i.i117

; <label>:518                                     ; preds = %508
  %519 = getelementptr inbounds %struct.Continuation* %504, i64 0, i32 1
  %520 = bitcast %union.anon.8* %519 to %struct.Value**
  %521 = load %struct.Value** %520, align 8, !tbaa !21
  %522 = tail call %struct.Value* @releaseValue(%struct.Value* %521) #7
  br label %allocateContinuation.exit.i.i117

allocateContinuation.exit.i.i117:                 ; preds = %518, %511, %508
  %523 = load %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  store %struct.Continuation* %523, %struct.Continuation** %505, align 8, !tbaa !15
  store %struct.Continuation* %504, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  br label %popContinuation.exit118

popContinuation.exit118:                          ; preds = %retainVExp.exit101, %allocateContinuation.exit.i.i117
  store %struct.Continuation* %506, %struct.Continuation** %1, align 8, !tbaa !37
  br label %1128

; <label>:524                                     ; preds = %276
  %525 = getelementptr inbounds %struct.Value* %283, i64 0, i32 0
  %526 = load i32* %525, align 4, !tbaa !33
  %switch26 = icmp ult i32 %526, 2
  br i1 %switch26, label %527, label %1129

; <label>:527                                     ; preds = %524
  %528 = icmp eq i32 %526, 1
  br i1 %528, label %529, label %533

; <label>:529                                     ; preds = %527
  %530 = getelementptr inbounds %struct.Value* %283, i64 0, i32 1
  %531 = bitcast %union.anon.0* %530 to i8**
  %532 = load i8** %531, align 8, !tbaa !1
  tail call void @setExceptionValue(%struct.Value* %v, i8* %532)
  br label %1128

; <label>:533                                     ; preds = %527
  %534 = getelementptr inbounds %struct.Value* %283, i64 0, i32 1, i32 0, i32 0
  %535 = load %struct.VExp** %534, align 8, !tbaa !18
  %536 = getelementptr inbounds %struct.VExp* %535, i64 0, i32 0
  %537 = load i32* %536, align 4, !tbaa !25
  %538 = icmp eq i32 %537, 0
  br i1 %538, label %540, label %539

; <label>:539                                     ; preds = %533
  tail call void @setExceptionValue(%struct.Value* %v, i8* getelementptr inbounds ([52 x i8]* @.str43, i64 0, i64 0))
  br label %1128

; <label>:540                                     ; preds = %533
  %541 = getelementptr inbounds %struct.VExp* %278, i64 0, i32 3, i32 0, i32 0
  %542 = load i32* %541, align 4, !tbaa !40
  switch i32 %542, label %914 [
    i32 0, label %543
    i32 1, label %578
    i32 2, label %613
    i32 3, label %648
    i32 4, label %691
    i32 6, label %711
    i32 5, label %744
    i32 8, label %777
    i32 7, label %810
    i32 9, label %843
    i32 10, label %876
  ]

; <label>:543                                     ; preds = %540
  %544 = getelementptr inbounds %struct.VExp* %278, i64 0, i32 3, i32 0, i32 2
  %545 = bitcast %union.SyscallArg* %544 to i32*
  %546 = load i32* %545, align 1
  %547 = getelementptr %union.SyscallArg* %544, i64 1
  %548 = bitcast %union.SyscallArg* %547 to i64*
  %549 = load i64* %548, align 1
  %550 = getelementptr inbounds %struct.VExp* %535, i64 0, i32 3, i32 0, i32 0
  %551 = load i32* %550, align 1
  %552 = getelementptr %struct.VExp* %535, i64 0, i32 3, i32 0, i32 2
  %553 = bitcast %union.SyscallArg* %552 to i64*
  %554 = load i64* %553, align 1
  %555 = icmp eq i32 %546, 0
  %556 = icmp eq i32 %551, 0
  br i1 %555, label %557, label %567

; <label>:557                                     ; preds = %543
  br i1 %556, label %558, label %561

; <label>:558                                     ; preds = %557
  %559 = add i64 %554, %549
  %560 = and i64 %559, 4294967295
  br label %.thread175

; <label>:561                                     ; preds = %557
  %562 = trunc i64 %549 to i32
  %563 = sitofp i32 %562 to double
  %564 = bitcast i64 %554 to double
  %565 = fadd double %563, %564
  %566 = bitcast double %565 to i64
  br label %.thread175

; <label>:567                                     ; preds = %543
  %568 = bitcast i64 %549 to double
  br i1 %556, label %569, label %574

; <label>:569                                     ; preds = %567
  %570 = trunc i64 %554 to i32
  %571 = sitofp i32 %570 to double
  %572 = fadd double %568, %571
  %573 = bitcast double %572 to i64
  br label %.thread175

; <label>:574                                     ; preds = %567
  %575 = bitcast i64 %554 to double
  %576 = fadd double %568, %575
  %577 = bitcast double %576 to i64
  br label %.thread175

; <label>:578                                     ; preds = %540
  %579 = getelementptr inbounds %struct.VExp* %278, i64 0, i32 3, i32 0, i32 2
  %580 = bitcast %union.SyscallArg* %579 to i32*
  %581 = load i32* %580, align 1
  %582 = getelementptr %union.SyscallArg* %579, i64 1
  %583 = bitcast %union.SyscallArg* %582 to i64*
  %584 = load i64* %583, align 1
  %585 = getelementptr inbounds %struct.VExp* %535, i64 0, i32 3, i32 0, i32 0
  %586 = load i32* %585, align 1
  %587 = getelementptr %struct.VExp* %535, i64 0, i32 3, i32 0, i32 2
  %588 = bitcast %union.SyscallArg* %587 to i64*
  %589 = load i64* %588, align 1
  %590 = icmp eq i32 %581, 0
  %591 = icmp eq i32 %586, 0
  br i1 %590, label %592, label %602

; <label>:592                                     ; preds = %578
  br i1 %591, label %593, label %596

; <label>:593                                     ; preds = %592
  %594 = sub i64 %584, %589
  %595 = and i64 %594, 4294967295
  br label %.thread175

; <label>:596                                     ; preds = %592
  %597 = trunc i64 %584 to i32
  %598 = sitofp i32 %597 to double
  %599 = bitcast i64 %589 to double
  %600 = fsub double %598, %599
  %601 = bitcast double %600 to i64
  br label %.thread175

; <label>:602                                     ; preds = %578
  %603 = bitcast i64 %584 to double
  br i1 %591, label %604, label %609

; <label>:604                                     ; preds = %602
  %605 = trunc i64 %589 to i32
  %606 = sitofp i32 %605 to double
  %607 = fsub double %603, %606
  %608 = bitcast double %607 to i64
  br label %.thread175

; <label>:609                                     ; preds = %602
  %610 = bitcast i64 %589 to double
  %611 = fsub double %603, %610
  %612 = bitcast double %611 to i64
  br label %.thread175

; <label>:613                                     ; preds = %540
  %614 = getelementptr inbounds %struct.VExp* %278, i64 0, i32 3, i32 0, i32 2
  %615 = bitcast %union.SyscallArg* %614 to i32*
  %616 = load i32* %615, align 1
  %617 = getelementptr %union.SyscallArg* %614, i64 1
  %618 = bitcast %union.SyscallArg* %617 to i64*
  %619 = load i64* %618, align 1
  %620 = getelementptr inbounds %struct.VExp* %535, i64 0, i32 3, i32 0, i32 0
  %621 = load i32* %620, align 1
  %622 = getelementptr %struct.VExp* %535, i64 0, i32 3, i32 0, i32 2
  %623 = bitcast %union.SyscallArg* %622 to i64*
  %624 = load i64* %623, align 1
  %625 = icmp eq i32 %616, 0
  %626 = icmp eq i32 %621, 0
  br i1 %625, label %627, label %637

; <label>:627                                     ; preds = %613
  br i1 %626, label %628, label %631

; <label>:628                                     ; preds = %627
  %629 = mul i64 %624, %619
  %630 = and i64 %629, 4294967295
  br label %.thread175

; <label>:631                                     ; preds = %627
  %632 = trunc i64 %619 to i32
  %633 = sitofp i32 %632 to double
  %634 = bitcast i64 %624 to double
  %635 = fmul double %633, %634
  %636 = bitcast double %635 to i64
  br label %.thread175

; <label>:637                                     ; preds = %613
  %638 = bitcast i64 %619 to double
  br i1 %626, label %639, label %644

; <label>:639                                     ; preds = %637
  %640 = trunc i64 %624 to i32
  %641 = sitofp i32 %640 to double
  %642 = fmul double %638, %641
  %643 = bitcast double %642 to i64
  br label %.thread175

; <label>:644                                     ; preds = %637
  %645 = bitcast i64 %624 to double
  %646 = fmul double %638, %645
  %647 = bitcast double %646 to i64
  br label %.thread175

; <label>:648                                     ; preds = %540
  %649 = getelementptr inbounds %struct.VExp* %278, i64 0, i32 3, i32 0, i32 2
  %650 = bitcast %union.SyscallArg* %649 to i32*
  %651 = load i32* %650, align 1
  %652 = getelementptr %union.SyscallArg* %649, i64 1
  %653 = bitcast %union.SyscallArg* %652 to i64*
  %654 = load i64* %653, align 1
  %655 = getelementptr inbounds %struct.VExp* %535, i64 0, i32 3, i32 0, i32 0
  %656 = load i32* %655, align 1
  %657 = getelementptr %struct.VExp* %535, i64 0, i32 3, i32 0, i32 2
  %658 = bitcast %union.SyscallArg* %657 to i64*
  %659 = load i64* %658, align 1
  %660 = icmp eq i32 %651, 0
  %661 = icmp eq i32 %656, 0
  br i1 %660, label %662, label %675

; <label>:662                                     ; preds = %648
  br i1 %661, label %663, label %669

; <label>:663                                     ; preds = %662
  %664 = trunc i64 %659 to i32
  %665 = icmp eq i32 %664, 0
  br i1 %665, label %divNumber.exit, label %666

; <label>:666                                     ; preds = %663
  %667 = trunc i64 %654 to i32
  %668 = sdiv i32 %667, %664
  %phitmp8.i = zext i32 %668 to i64
  br label %divNumber.exit

; <label>:669                                     ; preds = %662
  %670 = trunc i64 %654 to i32
  %671 = sitofp i32 %670 to double
  %672 = bitcast i64 %659 to double
  %673 = fdiv double %671, %672
  %674 = bitcast double %673 to i64
  br label %divNumber.exit

; <label>:675                                     ; preds = %648
  br i1 %661, label %676, label %683

; <label>:676                                     ; preds = %675
  %677 = trunc i64 %659 to i32
  %678 = icmp eq i32 %677, 0
  br i1 %678, label %divNumber.exit, label %679

; <label>:679                                     ; preds = %676
  %680 = bitcast i64 %654 to double
  %681 = sitofp i32 %677 to double
  %682 = fdiv double %680, %681
  %phitmp.i = bitcast double %682 to i64
  br label %divNumber.exit

; <label>:683                                     ; preds = %675
  %684 = bitcast i64 %654 to double
  %685 = bitcast i64 %659 to double
  %686 = fdiv double %684, %685
  %687 = bitcast double %686 to i64
  br label %divNumber.exit

divNumber.exit:                                   ; preds = %676, %663, %666, %669, %679, %683
  %688 = phi i8* [ null, %669 ], [ null, %683 ], [ null, %666 ], [ null, %679 ], [ getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), %663 ], [ getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), %676 ]
  %.sroa.0.0.i123 = phi i32 [ 1, %669 ], [ 1, %683 ], [ 0, %666 ], [ 1, %679 ], [ 0, %663 ], [ 1, %676 ]
  %.sroa.9.0.i = phi i64 [ %674, %669 ], [ %687, %683 ], [ %phitmp8.i, %666 ], [ %phitmp.i, %679 ], [ 0, %663 ], [ undef, %676 ]
  %689 = insertvalue { i32, i64 } undef, i32 %.sroa.0.0.i123, 0
  %690 = insertvalue { i32, i64 } %689, i64 %.sroa.9.0.i, 1
  br label %909

; <label>:691                                     ; preds = %540
  %692 = getelementptr inbounds %struct.VExp* %278, i64 0, i32 3, i32 0, i32 2
  %693 = bitcast %union.SyscallArg* %692 to i32*
  %694 = load i32* %693, align 1
  %695 = getelementptr inbounds %struct.VExp* %535, i64 0, i32 3, i32 0, i32 0
  %696 = load i32* %695, align 1
  %697 = or i32 %696, %694
  %698 = icmp eq i32 %697, 0
  br i1 %698, label %699, label %modNumber.exit

; <label>:699                                     ; preds = %691
  %700 = getelementptr %struct.VExp* %535, i64 0, i32 3, i32 0, i32 2
  %701 = getelementptr %union.SyscallArg* %692, i64 1
  %702 = bitcast %union.SyscallArg* %700 to i64*
  %703 = bitcast %union.SyscallArg* %701 to i64*
  %704 = load i64* %702, align 1
  %705 = load i64* %703, align 1
  %706 = trunc i64 %705 to i32
  %707 = trunc i64 %704 to i32
  %708 = srem i32 %706, %707
  %phitmp.i124 = zext i32 %708 to i64
  br label %modNumber.exit

modNumber.exit:                                   ; preds = %691, %699
  %709 = phi i8* [ null, %699 ], [ getelementptr inbounds ([36 x i8]* @.str1, i64 0, i64 0), %691 ]
  %c.sroa.21.0.i = phi i64 [ %phitmp.i124, %699 ], [ 0, %691 ]
  %710 = insertvalue { i32, i64 } { i32 0, i64 undef }, i64 %c.sroa.21.0.i, 1
  br label %909

; <label>:711                                     ; preds = %540
  %712 = getelementptr inbounds %struct.VExp* %278, i64 0, i32 3, i32 0, i32 2
  %713 = bitcast %union.SyscallArg* %712 to i32*
  %714 = load i32* %713, align 1
  %715 = getelementptr %union.SyscallArg* %712, i64 1
  %716 = bitcast %union.SyscallArg* %715 to i64*
  %717 = load i64* %716, align 1
  %718 = getelementptr inbounds %struct.VExp* %535, i64 0, i32 3, i32 0, i32 0
  %719 = load i32* %718, align 1
  %720 = getelementptr %struct.VExp* %535, i64 0, i32 3, i32 0, i32 2
  %721 = bitcast %union.SyscallArg* %720 to i64*
  %722 = load i64* %721, align 1
  %723 = icmp eq i32 %714, 0
  %724 = icmp eq i32 %719, 0
  br i1 %723, label %725, label %734

; <label>:725                                     ; preds = %711
  %726 = trunc i64 %717 to i32
  br i1 %724, label %727, label %730

; <label>:727                                     ; preds = %725
  %728 = trunc i64 %722 to i32
  %729 = icmp slt i32 %726, %728
  br label %leNumber.exit

; <label>:730                                     ; preds = %725
  %731 = sitofp i32 %726 to double
  %732 = bitcast i64 %722 to double
  %733 = fcmp olt double %731, %732
  br label %leNumber.exit

; <label>:734                                     ; preds = %711
  %735 = bitcast i64 %717 to double
  br i1 %724, label %736, label %740

; <label>:736                                     ; preds = %734
  %737 = trunc i64 %722 to i32
  %738 = sitofp i32 %737 to double
  %739 = fcmp olt double %735, %738
  br label %leNumber.exit

; <label>:740                                     ; preds = %734
  %741 = bitcast i64 %722 to double
  %742 = fcmp olt double %735, %741
  br label %leNumber.exit

leNumber.exit:                                    ; preds = %727, %730, %736, %740
  %.0.i = phi i1 [ %729, %727 ], [ %733, %730 ], [ %739, %736 ], [ %742, %740 ]
  %743 = zext i1 %.0.i to i32
  br label %914

; <label>:744                                     ; preds = %540
  %745 = getelementptr inbounds %struct.VExp* %278, i64 0, i32 3, i32 0, i32 2
  %746 = bitcast %union.SyscallArg* %745 to i32*
  %747 = load i32* %746, align 1
  %748 = getelementptr %union.SyscallArg* %745, i64 1
  %749 = bitcast %union.SyscallArg* %748 to i64*
  %750 = load i64* %749, align 1
  %751 = getelementptr inbounds %struct.VExp* %535, i64 0, i32 3, i32 0, i32 0
  %752 = load i32* %751, align 1
  %753 = getelementptr %struct.VExp* %535, i64 0, i32 3, i32 0, i32 2
  %754 = bitcast %union.SyscallArg* %753 to i64*
  %755 = load i64* %754, align 1
  %756 = icmp eq i32 %747, 0
  %757 = icmp eq i32 %752, 0
  br i1 %756, label %758, label %767

; <label>:758                                     ; preds = %744
  %759 = trunc i64 %750 to i32
  br i1 %757, label %760, label %763

; <label>:760                                     ; preds = %758
  %761 = trunc i64 %755 to i32
  %762 = icmp sgt i32 %759, %761
  br label %geNumber.exit

; <label>:763                                     ; preds = %758
  %764 = sitofp i32 %759 to double
  %765 = bitcast i64 %755 to double
  %766 = fcmp ogt double %764, %765
  br label %geNumber.exit

; <label>:767                                     ; preds = %744
  %768 = bitcast i64 %750 to double
  br i1 %757, label %769, label %773

; <label>:769                                     ; preds = %767
  %770 = trunc i64 %755 to i32
  %771 = sitofp i32 %770 to double
  %772 = fcmp ogt double %768, %771
  br label %geNumber.exit

; <label>:773                                     ; preds = %767
  %774 = bitcast i64 %755 to double
  %775 = fcmp ogt double %768, %774
  br label %geNumber.exit

geNumber.exit:                                    ; preds = %760, %763, %769, %773
  %.0.i125 = phi i1 [ %762, %760 ], [ %766, %763 ], [ %772, %769 ], [ %775, %773 ]
  %776 = zext i1 %.0.i125 to i32
  br label %914

; <label>:777                                     ; preds = %540
  %778 = getelementptr inbounds %struct.VExp* %278, i64 0, i32 3, i32 0, i32 2
  %779 = bitcast %union.SyscallArg* %778 to i32*
  %780 = load i32* %779, align 1
  %781 = getelementptr %union.SyscallArg* %778, i64 1
  %782 = bitcast %union.SyscallArg* %781 to i64*
  %783 = load i64* %782, align 1
  %784 = getelementptr inbounds %struct.VExp* %535, i64 0, i32 3, i32 0, i32 0
  %785 = load i32* %784, align 1
  %786 = getelementptr %struct.VExp* %535, i64 0, i32 3, i32 0, i32 2
  %787 = bitcast %union.SyscallArg* %786 to i64*
  %788 = load i64* %787, align 1
  %789 = icmp eq i32 %780, 0
  %790 = icmp eq i32 %785, 0
  br i1 %789, label %791, label %800

; <label>:791                                     ; preds = %777
  %792 = trunc i64 %783 to i32
  br i1 %790, label %793, label %796

; <label>:793                                     ; preds = %791
  %794 = trunc i64 %788 to i32
  %795 = icmp sge i32 %792, %794
  br label %nleNumber.exit

; <label>:796                                     ; preds = %791
  %797 = sitofp i32 %792 to double
  %798 = bitcast i64 %788 to double
  %799 = fcmp oge double %797, %798
  br label %nleNumber.exit

; <label>:800                                     ; preds = %777
  %801 = bitcast i64 %783 to double
  br i1 %790, label %802, label %806

; <label>:802                                     ; preds = %800
  %803 = trunc i64 %788 to i32
  %804 = sitofp i32 %803 to double
  %805 = fcmp oge double %801, %804
  br label %nleNumber.exit

; <label>:806                                     ; preds = %800
  %807 = bitcast i64 %788 to double
  %808 = fcmp oge double %801, %807
  br label %nleNumber.exit

nleNumber.exit:                                   ; preds = %793, %796, %802, %806
  %.0.i126 = phi i1 [ %795, %793 ], [ %799, %796 ], [ %805, %802 ], [ %808, %806 ]
  %809 = zext i1 %.0.i126 to i32
  br label %914

; <label>:810                                     ; preds = %540
  %811 = getelementptr inbounds %struct.VExp* %278, i64 0, i32 3, i32 0, i32 2
  %812 = bitcast %union.SyscallArg* %811 to i32*
  %813 = load i32* %812, align 1
  %814 = getelementptr %union.SyscallArg* %811, i64 1
  %815 = bitcast %union.SyscallArg* %814 to i64*
  %816 = load i64* %815, align 1
  %817 = getelementptr inbounds %struct.VExp* %535, i64 0, i32 3, i32 0, i32 0
  %818 = load i32* %817, align 1
  %819 = getelementptr %struct.VExp* %535, i64 0, i32 3, i32 0, i32 2
  %820 = bitcast %union.SyscallArg* %819 to i64*
  %821 = load i64* %820, align 1
  %822 = icmp eq i32 %813, 0
  %823 = icmp eq i32 %818, 0
  br i1 %822, label %824, label %833

; <label>:824                                     ; preds = %810
  %825 = trunc i64 %816 to i32
  br i1 %823, label %826, label %829

; <label>:826                                     ; preds = %824
  %827 = trunc i64 %821 to i32
  %828 = icmp sle i32 %825, %827
  br label %ngeNumber.exit

; <label>:829                                     ; preds = %824
  %830 = sitofp i32 %825 to double
  %831 = bitcast i64 %821 to double
  %832 = fcmp ole double %830, %831
  br label %ngeNumber.exit

; <label>:833                                     ; preds = %810
  %834 = bitcast i64 %816 to double
  br i1 %823, label %835, label %839

; <label>:835                                     ; preds = %833
  %836 = trunc i64 %821 to i32
  %837 = sitofp i32 %836 to double
  %838 = fcmp ole double %834, %837
  br label %ngeNumber.exit

; <label>:839                                     ; preds = %833
  %840 = bitcast i64 %821 to double
  %841 = fcmp ole double %834, %840
  br label %ngeNumber.exit

ngeNumber.exit:                                   ; preds = %826, %829, %835, %839
  %.0.i127 = phi i1 [ %828, %826 ], [ %832, %829 ], [ %838, %835 ], [ %841, %839 ]
  %842 = zext i1 %.0.i127 to i32
  br label %914

; <label>:843                                     ; preds = %540
  %844 = getelementptr inbounds %struct.VExp* %278, i64 0, i32 3, i32 0, i32 2
  %845 = bitcast %union.SyscallArg* %844 to i32*
  %846 = load i32* %845, align 1
  %847 = getelementptr %union.SyscallArg* %844, i64 1
  %848 = bitcast %union.SyscallArg* %847 to i64*
  %849 = load i64* %848, align 1
  %850 = getelementptr inbounds %struct.VExp* %535, i64 0, i32 3, i32 0, i32 0
  %851 = load i32* %850, align 1
  %852 = getelementptr %struct.VExp* %535, i64 0, i32 3, i32 0, i32 2
  %853 = bitcast %union.SyscallArg* %852 to i64*
  %854 = load i64* %853, align 1
  %855 = icmp eq i32 %846, 0
  %856 = icmp eq i32 %851, 0
  br i1 %855, label %857, label %866

; <label>:857                                     ; preds = %843
  %858 = trunc i64 %849 to i32
  br i1 %856, label %859, label %862

; <label>:859                                     ; preds = %857
  %860 = trunc i64 %854 to i32
  %861 = icmp eq i32 %858, %860
  br label %eqNumber.exit

; <label>:862                                     ; preds = %857
  %863 = sitofp i32 %858 to double
  %864 = bitcast i64 %854 to double
  %865 = fcmp oeq double %863, %864
  br label %eqNumber.exit

; <label>:866                                     ; preds = %843
  %867 = bitcast i64 %849 to double
  br i1 %856, label %868, label %872

; <label>:868                                     ; preds = %866
  %869 = trunc i64 %854 to i32
  %870 = sitofp i32 %869 to double
  %871 = fcmp oeq double %867, %870
  br label %eqNumber.exit

; <label>:872                                     ; preds = %866
  %873 = bitcast i64 %854 to double
  %874 = fcmp oeq double %867, %873
  br label %eqNumber.exit

eqNumber.exit:                                    ; preds = %859, %862, %868, %872
  %.0.i128 = phi i1 [ %861, %859 ], [ %865, %862 ], [ %871, %868 ], [ %874, %872 ]
  %875 = zext i1 %.0.i128 to i32
  br label %914

; <label>:876                                     ; preds = %540
  %877 = getelementptr inbounds %struct.VExp* %278, i64 0, i32 3, i32 0, i32 2
  %878 = bitcast %union.SyscallArg* %877 to i32*
  %879 = load i32* %878, align 1
  %880 = getelementptr %union.SyscallArg* %877, i64 1
  %881 = bitcast %union.SyscallArg* %880 to i64*
  %882 = load i64* %881, align 1
  %883 = getelementptr inbounds %struct.VExp* %535, i64 0, i32 3, i32 0, i32 0
  %884 = load i32* %883, align 1
  %885 = getelementptr %struct.VExp* %535, i64 0, i32 3, i32 0, i32 2
  %886 = bitcast %union.SyscallArg* %885 to i64*
  %887 = load i64* %886, align 1
  %888 = icmp eq i32 %879, 0
  %889 = icmp eq i32 %884, 0
  br i1 %888, label %890, label %899

; <label>:890                                     ; preds = %876
  %891 = trunc i64 %882 to i32
  br i1 %889, label %892, label %895

; <label>:892                                     ; preds = %890
  %893 = trunc i64 %887 to i32
  %894 = icmp ne i32 %891, %893
  br label %neqNumber.exit

; <label>:895                                     ; preds = %890
  %896 = sitofp i32 %891 to double
  %897 = bitcast i64 %887 to double
  %898 = fcmp une double %896, %897
  br label %neqNumber.exit

; <label>:899                                     ; preds = %876
  %900 = bitcast i64 %882 to double
  br i1 %889, label %901, label %905

; <label>:901                                     ; preds = %899
  %902 = trunc i64 %887 to i32
  %903 = sitofp i32 %902 to double
  %904 = fcmp une double %900, %903
  br label %neqNumber.exit

; <label>:905                                     ; preds = %899
  %906 = bitcast i64 %887 to double
  %907 = fcmp une double %900, %906
  br label %neqNumber.exit

neqNumber.exit:                                   ; preds = %892, %895, %901, %905
  %.0.i135 = phi i1 [ %894, %892 ], [ %898, %895 ], [ %904, %901 ], [ %907, %905 ]
  %908 = zext i1 %.0.i135 to i32
  br label %914

; <label>:909                                     ; preds = %divNumber.exit, %modNumber.exit
  %.sink = phi { i32, i64 } [ %690, %divNumber.exit ], [ %710, %modNumber.exit ]
  %910 = phi i8* [ %688, %divNumber.exit ], [ %709, %modNumber.exit ]
  %result.sroa.0.0 = phi i32 [ %.sroa.0.0.i123, %divNumber.exit ], [ 0, %modNumber.exit ]
  %911 = extractvalue { i32, i64 } %.sink, 1
  %912 = icmp eq i8* %910, null
  br i1 %912, label %.thread175, label %913

; <label>:913                                     ; preds = %909
  tail call void @setExceptionValue(%struct.Value* %v, i8* %910)
  br label %1128

; <label>:914                                     ; preds = %leNumber.exit, %geNumber.exit, %nleNumber.exit, %ngeNumber.exit, %eqNumber.exit, %neqNumber.exit, %540
  %result_bool.0.ph.ph = phi i32 [ %743, %leNumber.exit ], [ %776, %geNumber.exit ], [ %809, %nleNumber.exit ], [ %842, %ngeNumber.exit ], [ %875, %eqNumber.exit ], [ %908, %neqNumber.exit ], [ 0, %540 ]
  %915 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %916 = icmp eq %struct.VExp* %915, null
  br i1 %916, label %917, label %newVExpRef.exit

; <label>:917                                     ; preds = %914
  %918 = tail call noalias i8* @malloc(i64 56000) #7
  %919 = bitcast i8* %918 to %struct.VExp*
  br label %920

; <label>:920                                     ; preds = %920, %917
  %indvars.iv.i.i142 = phi i64 [ 0, %917 ], [ %indvars.iv.next.i.i143, %920 ]
  %921 = phi %struct.VExp* [ null, %917 ], [ %922, %920 ]
  %922 = getelementptr inbounds %struct.VExp* %919, i64 %indvars.iv.i.i142
  %923 = getelementptr inbounds %struct.VExp* %919, i64 %indvars.iv.i.i142, i32 3
  %924 = bitcast %union.anon.1* %923 to %struct.VExp**
  store %struct.VExp* %921, %struct.VExp** %924, align 8, !tbaa !1
  %indvars.iv.next.i.i143 = add nuw nsw i64 %indvars.iv.i.i142, 1
  %exitcond.i.i144 = icmp eq i64 %indvars.iv.next.i.i143, 1000
  br i1 %exitcond.i.i144, label %.loopexit.i.i147, label %920

.loopexit.i.i147:                                 ; preds = %920
  %scevgep.i.i145 = getelementptr i8* %918, i64 55944
  %scevgep3.i.i146 = bitcast i8* %scevgep.i.i145 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i146, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpRef.exit

newVExpRef.exit:                                  ; preds = %914, %.loopexit.i.i147
  %925 = phi %struct.VExp* [ %scevgep3.i.i146, %.loopexit.i.i147 ], [ %915, %914 ]
  %926 = getelementptr inbounds %struct.VExp* %925, i64 0, i32 4
  store i32 1, i32* %926, align 4, !tbaa !23
  %927 = getelementptr inbounds %struct.VExp* %925, i64 0, i32 3
  %928 = bitcast %union.anon.1* %927 to %struct.VExp**
  %929 = load %struct.VExp** %928, align 8, !tbaa !1
  store %struct.VExp* %929, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %930 = getelementptr inbounds %struct.VExp* %925, i64 0, i32 0
  store i32 7, i32* %930, align 4, !tbaa !25
  %931 = getelementptr inbounds %struct.VExp* %925, i64 0, i32 3, i32 0, i32 0
  store i32 %result_bool.0.ph.ph, i32* %931, align 4, !tbaa !29
  %932 = icmp eq %struct.VExp* %929, null
  br i1 %932, label %933, label %newVExpAbs.exit

; <label>:933                                     ; preds = %newVExpRef.exit
  %934 = tail call noalias i8* @malloc(i64 56000) #7
  %935 = bitcast i8* %934 to %struct.VExp*
  br label %936

; <label>:936                                     ; preds = %936, %933
  %indvars.iv.i.i148 = phi i64 [ 0, %933 ], [ %indvars.iv.next.i.i149, %936 ]
  %937 = phi %struct.VExp* [ null, %933 ], [ %938, %936 ]
  %938 = getelementptr inbounds %struct.VExp* %935, i64 %indvars.iv.i.i148
  %939 = getelementptr inbounds %struct.VExp* %935, i64 %indvars.iv.i.i148, i32 3
  %940 = bitcast %union.anon.1* %939 to %struct.VExp**
  store %struct.VExp* %937, %struct.VExp** %940, align 8, !tbaa !1
  %indvars.iv.next.i.i149 = add nuw nsw i64 %indvars.iv.i.i148, 1
  %exitcond.i.i150 = icmp eq i64 %indvars.iv.next.i.i149, 1000
  br i1 %exitcond.i.i150, label %.loopexit.i.i153, label %936

.loopexit.i.i153:                                 ; preds = %936
  %scevgep.i.i151 = getelementptr i8* %934, i64 55944
  %scevgep3.i.i152 = bitcast i8* %scevgep.i.i151 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i152, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpAbs.exit

newVExpAbs.exit:                                  ; preds = %newVExpRef.exit, %.loopexit.i.i153
  %941 = phi %struct.VExp* [ %scevgep3.i.i152, %.loopexit.i.i153 ], [ %929, %newVExpRef.exit ]
  %942 = getelementptr inbounds %struct.VExp* %941, i64 0, i32 4
  store i32 1, i32* %942, align 4, !tbaa !23
  %943 = getelementptr inbounds %struct.VExp* %941, i64 0, i32 3
  %944 = bitcast %union.anon.1* %943 to %struct.VExp**
  %945 = load %struct.VExp** %944, align 8, !tbaa !1
  store %struct.VExp* %945, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %946 = getelementptr inbounds %struct.VExp* %941, i64 0, i32 0
  store i32 1, i32* %946, align 4, !tbaa !25
  store %struct.VExp* %925, %struct.VExp** %944, align 8, !tbaa !1
  %947 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %948 = icmp eq %struct.VExp* %947, null
  br i1 %948, label %949, label %newVExpAbs.exit160

; <label>:949                                     ; preds = %newVExpAbs.exit
  %950 = tail call noalias i8* @malloc(i64 56000) #7
  %951 = bitcast i8* %950 to %struct.VExp*
  br label %952

; <label>:952                                     ; preds = %952, %949
  %indvars.iv.i.i154 = phi i64 [ 0, %949 ], [ %indvars.iv.next.i.i155, %952 ]
  %953 = phi %struct.VExp* [ null, %949 ], [ %954, %952 ]
  %954 = getelementptr inbounds %struct.VExp* %951, i64 %indvars.iv.i.i154
  %955 = getelementptr inbounds %struct.VExp* %951, i64 %indvars.iv.i.i154, i32 3
  %956 = bitcast %union.anon.1* %955 to %struct.VExp**
  store %struct.VExp* %953, %struct.VExp** %956, align 8, !tbaa !1
  %indvars.iv.next.i.i155 = add nuw nsw i64 %indvars.iv.i.i154, 1
  %exitcond.i.i156 = icmp eq i64 %indvars.iv.next.i.i155, 1000
  br i1 %exitcond.i.i156, label %.loopexit.i.i159, label %952

.loopexit.i.i159:                                 ; preds = %952
  %scevgep.i.i157 = getelementptr i8* %950, i64 55944
  %scevgep3.i.i158 = bitcast i8* %scevgep.i.i157 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i158, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpAbs.exit160

newVExpAbs.exit160:                               ; preds = %newVExpAbs.exit, %.loopexit.i.i159
  %957 = phi %struct.VExp* [ %scevgep3.i.i158, %.loopexit.i.i159 ], [ %947, %newVExpAbs.exit ]
  %958 = getelementptr inbounds %struct.VExp* %957, i64 0, i32 4
  store i32 1, i32* %958, align 4, !tbaa !23
  %959 = getelementptr inbounds %struct.VExp* %957, i64 0, i32 3
  %960 = bitcast %union.anon.1* %959 to %struct.VExp**
  %961 = load %struct.VExp** %960, align 8, !tbaa !1
  store %struct.VExp* %961, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %962 = getelementptr inbounds %struct.VExp* %957, i64 0, i32 0
  store i32 1, i32* %962, align 4, !tbaa !25
  store %struct.VExp* %941, %struct.VExp** %960, align 8, !tbaa !1
  br label %981

.thread175:                                       ; preds = %644, %639, %631, %628, %609, %604, %596, %593, %574, %569, %561, %558, %909
  %result.sroa.0.0173177 = phi i32 [ %result.sroa.0.0, %909 ], [ 0, %558 ], [ 1, %561 ], [ 1, %569 ], [ 1, %574 ], [ 0, %593 ], [ 1, %596 ], [ 1, %604 ], [ 1, %609 ], [ 0, %628 ], [ 1, %631 ], [ 1, %639 ], [ 1, %644 ]
  %result.sroa.11.0174176 = phi i64 [ %911, %909 ], [ %560, %558 ], [ %566, %561 ], [ %573, %569 ], [ %577, %574 ], [ %595, %593 ], [ %601, %596 ], [ %608, %604 ], [ %612, %609 ], [ %630, %628 ], [ %636, %631 ], [ %643, %639 ], [ %647, %644 ]
  %963 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %964 = icmp eq %struct.VExp* %963, null
  br i1 %964, label %965, label %newVExpNum.exit168

; <label>:965                                     ; preds = %.thread175
  %966 = tail call noalias i8* @malloc(i64 56000) #7
  %967 = bitcast i8* %966 to %struct.VExp*
  br label %968

; <label>:968                                     ; preds = %968, %965
  %indvars.iv.i.i161 = phi i64 [ 0, %965 ], [ %indvars.iv.next.i.i162, %968 ]
  %969 = phi %struct.VExp* [ null, %965 ], [ %970, %968 ]
  %970 = getelementptr inbounds %struct.VExp* %967, i64 %indvars.iv.i.i161
  %971 = getelementptr inbounds %struct.VExp* %967, i64 %indvars.iv.i.i161, i32 3
  %972 = bitcast %union.anon.1* %971 to %struct.VExp**
  store %struct.VExp* %969, %struct.VExp** %972, align 8, !tbaa !1
  %indvars.iv.next.i.i162 = add nuw nsw i64 %indvars.iv.i.i161, 1
  %exitcond.i.i163 = icmp eq i64 %indvars.iv.next.i.i162, 1000
  br i1 %exitcond.i.i163, label %.loopexit.i.i166, label %968

.loopexit.i.i166:                                 ; preds = %968
  %scevgep.i.i164 = getelementptr i8* %966, i64 55944
  %scevgep3.i.i165 = bitcast i8* %scevgep.i.i164 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i165, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNum.exit168

newVExpNum.exit168:                               ; preds = %.thread175, %.loopexit.i.i166
  %973 = phi %struct.VExp* [ %scevgep3.i.i165, %.loopexit.i.i166 ], [ %963, %.thread175 ]
  %974 = getelementptr inbounds %struct.VExp* %973, i64 0, i32 4
  store i32 1, i32* %974, align 4, !tbaa !23
  %975 = getelementptr inbounds %struct.VExp* %973, i64 0, i32 3
  %976 = bitcast %union.anon.1* %975 to %struct.VExp**
  %977 = load %struct.VExp** %976, align 8, !tbaa !1
  store %struct.VExp* %977, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %978 = getelementptr inbounds %struct.VExp* %973, i64 0, i32 0
  store i32 0, i32* %978, align 4, !tbaa !25
  %979 = getelementptr inbounds %struct.VExp* %973, i64 0, i32 3, i32 0, i32 0
  store i32 %result.sroa.0.0173177, i32* %979, align 8
  %980 = getelementptr inbounds %struct.VExp* %973, i64 0, i32 3, i32 0, i32 2, i32 0
  %num_val.coerce1.c.i167 = inttoptr i64 %result.sroa.11.0174176 to %struct.IntList*
  store %struct.IntList* %num_val.coerce1.c.i167, %struct.IntList** %980, align 8
  br label %981

; <label>:981                                     ; preds = %newVExpNum.exit168, %newVExpAbs.exit160
  %nexp5.0 = phi %struct.VExp* [ %957, %newVExpAbs.exit160 ], [ %973, %newVExpNum.exit168 ]
  %982 = load %struct.VExp** %277, align 8, !tbaa !34
  %983 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %982) #7
  store %struct.VExp* %nexp5.0, %struct.VExp** %277, align 8, !tbaa !34
  %984 = load %struct.VContext** %279, align 8, !tbaa !36
  %985 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %984) #7
  store %struct.VContext* null, %struct.VContext** %279, align 8, !tbaa !36
  %986 = load %struct.Continuation** %1, align 8, !tbaa !37
  %987 = getelementptr inbounds %struct.Continuation* %986, i64 0, i32 2
  %988 = load %struct.Continuation** %987, align 8, !tbaa !15
  %989 = icmp eq %struct.Continuation* %986, null
  br i1 %989, label %popContinuation.exit170, label %990

; <label>:990                                     ; preds = %981
  %991 = getelementptr inbounds %struct.Continuation* %986, i64 0, i32 0
  %992 = load i32* %991, align 4, !tbaa !17
  switch i32 %992, label %allocateContinuation.exit.i.i169 [
    i32 0, label %993
    i32 1, label %1000
  ]

; <label>:993                                     ; preds = %990
  %994 = getelementptr inbounds %struct.Continuation* %986, i64 0, i32 1, i32 0, i32 0
  %995 = load %struct.VExp** %994, align 8, !tbaa !18
  %996 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %995) #7
  %997 = getelementptr inbounds %struct.Continuation* %986, i64 0, i32 1, i32 0, i32 1
  %998 = load %struct.VContext** %997, align 8, !tbaa !20
  %999 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %998) #7
  br label %allocateContinuation.exit.i.i169

; <label>:1000                                    ; preds = %990
  %1001 = getelementptr inbounds %struct.Continuation* %986, i64 0, i32 1
  %1002 = bitcast %union.anon.8* %1001 to %struct.Value**
  %1003 = load %struct.Value** %1002, align 8, !tbaa !21
  %1004 = tail call %struct.Value* @releaseValue(%struct.Value* %1003) #7
  br label %allocateContinuation.exit.i.i169

allocateContinuation.exit.i.i169:                 ; preds = %1000, %993, %990
  %1005 = load %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  store %struct.Continuation* %1005, %struct.Continuation** %987, align 8, !tbaa !15
  store %struct.Continuation* %986, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  br label %popContinuation.exit170

popContinuation.exit170:                          ; preds = %981, %allocateContinuation.exit.i.i169
  store %struct.Continuation* %988, %struct.Continuation** %1, align 8, !tbaa !37
  br label %1128

; <label>:1006                                    ; preds = %276
  %1007 = getelementptr inbounds %struct.Value* %283, i64 0, i32 0
  %1008 = load i32* %1007, align 4, !tbaa !33
  %switch27 = icmp ult i32 %1008, 2
  br i1 %switch27, label %1009, label %1129

; <label>:1009                                    ; preds = %1006
  %1010 = icmp eq i32 %1008, 1
  br i1 %1010, label %1011, label %1015

; <label>:1011                                    ; preds = %1009
  %1012 = getelementptr inbounds %struct.Value* %283, i64 0, i32 1
  %1013 = bitcast %union.anon.0* %1012 to i8**
  %1014 = load i8** %1013, align 8, !tbaa !1
  tail call void @setExceptionValue(%struct.Value* %v, i8* %1014)
  br label %1128

; <label>:1015                                    ; preds = %1009
  %1016 = getelementptr inbounds %struct.Value* %283, i64 0, i32 1, i32 0, i32 0
  %1017 = load %struct.VExp** %1016, align 8, !tbaa !18
  %1018 = getelementptr inbounds %struct.VExp* %1017, i64 0, i32 0
  %1019 = load i32* %1018, align 4, !tbaa !25
  %1020 = icmp eq i32 %1019, 0
  br i1 %1020, label %1022, label %1021

; <label>:1021                                    ; preds = %1015
  tail call void @setExceptionValue(%struct.Value* %v, i8* getelementptr inbounds ([52 x i8]* @.str43, i64 0, i64 0))
  br label %1128

; <label>:1022                                    ; preds = %1015
  %1023 = getelementptr inbounds %struct.VExp* %1017, i64 0, i32 3, i32 0, i32 0
  %1024 = load i32* %1023, align 4, !tbaa !44
  %1025 = icmp eq i32 %1024, 0
  br i1 %1025, label %1027, label %1026

; <label>:1026                                    ; preds = %1022
  tail call void @setExceptionValue(%struct.Value* %v, i8* getelementptr inbounds ([44 x i8]* @.str44, i64 0, i64 0))
  br label %1128

; <label>:1027                                    ; preds = %1022
  %1028 = getelementptr inbounds %struct.VExp* %1017, i64 0, i32 3, i32 0, i32 2
  %1029 = bitcast %union.SyscallArg* %1028 to i32*
  %1030 = load i32* %1029, align 4, !tbaa !29
  %1031 = getelementptr inbounds %struct.VExp* %278, i64 0, i32 3
  %1032 = bitcast %union.anon.1* %1031 to %struct.IntList**
  %1033 = load %struct.IntList** %1032, align 8, !tbaa !21
  %1034 = icmp eq %struct.IntList* %1033, null
  br i1 %1034, label %retainIntList.exit, label %1035

; <label>:1035                                    ; preds = %1027
  %1036 = getelementptr inbounds %struct.IntList* %1033, i64 0, i32 2
  %1037 = load i32* %1036, align 4, !tbaa !8
  %1038 = add nsw i32 %1037, 1
  store i32 %1038, i32* %1036, align 4, !tbaa !8
  br label %retainIntList.exit

retainIntList.exit:                               ; preds = %1027, %1035
  %1039 = load %struct.IntList** @allocateIntList.pool, align 8, !tbaa !1
  %1040 = icmp eq %struct.IntList* %1039, null
  br i1 %1040, label %1041, label %newIntList.exit

; <label>:1041                                    ; preds = %retainIntList.exit
  %1042 = tail call noalias i8* @malloc(i64 24000) #7
  %1043 = bitcast i8* %1042 to %struct.IntList*
  br label %1044

; <label>:1044                                    ; preds = %1044, %1041
  %indvars.iv.i.i136 = phi i64 [ 0, %1041 ], [ %indvars.iv.next.i.i137, %1044 ]
  %1045 = phi %struct.IntList* [ null, %1041 ], [ %1046, %1044 ]
  %1046 = getelementptr inbounds %struct.IntList* %1043, i64 %indvars.iv.i.i136
  %1047 = getelementptr inbounds %struct.IntList* %1043, i64 %indvars.iv.i.i136, i32 1
  store %struct.IntList* %1045, %struct.IntList** %1047, align 8, !tbaa !5
  %indvars.iv.next.i.i137 = add nuw nsw i64 %indvars.iv.i.i136, 1
  %exitcond.i.i138 = icmp eq i64 %indvars.iv.next.i.i137, 1000
  br i1 %exitcond.i.i138, label %.loopexit.i.i141, label %1044

.loopexit.i.i141:                                 ; preds = %1044
  %scevgep.i.i139 = getelementptr i8* %1042, i64 23976
  %scevgep3.i.i140 = bitcast i8* %scevgep.i.i139 to %struct.IntList*
  store %struct.IntList* %scevgep3.i.i140, %struct.IntList** @allocateIntList.pool, align 8, !tbaa !1
  br label %newIntList.exit

newIntList.exit:                                  ; preds = %retainIntList.exit, %.loopexit.i.i141
  %1048 = phi %struct.IntList* [ %scevgep3.i.i140, %.loopexit.i.i141 ], [ %1039, %retainIntList.exit ]
  %1049 = getelementptr inbounds %struct.IntList* %1048, i64 0, i32 1
  %1050 = load %struct.IntList** %1049, align 8, !tbaa !5
  store %struct.IntList* %1050, %struct.IntList** @allocateIntList.pool, align 8, !tbaa !1
  %1051 = getelementptr inbounds %struct.IntList* %1048, i64 0, i32 0
  store i32 %1030, i32* %1051, align 4, !tbaa !9
  store %struct.IntList* %1033, %struct.IntList** %1049, align 8, !tbaa !5
  %1052 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %1053 = icmp eq %struct.VExp* %1052, null
  br i1 %1053, label %1054, label %newVExpIntList.exit

; <label>:1054                                    ; preds = %newIntList.exit
  %1055 = tail call noalias i8* @malloc(i64 56000) #7
  %1056 = bitcast i8* %1055 to %struct.VExp*
  br label %1057

; <label>:1057                                    ; preds = %1057, %1054
  %indvars.iv.i.i129 = phi i64 [ 0, %1054 ], [ %indvars.iv.next.i.i130, %1057 ]
  %1058 = phi %struct.VExp* [ null, %1054 ], [ %1059, %1057 ]
  %1059 = getelementptr inbounds %struct.VExp* %1056, i64 %indvars.iv.i.i129
  %1060 = getelementptr inbounds %struct.VExp* %1056, i64 %indvars.iv.i.i129, i32 3
  %1061 = bitcast %union.anon.1* %1060 to %struct.VExp**
  store %struct.VExp* %1058, %struct.VExp** %1061, align 8, !tbaa !1
  %indvars.iv.next.i.i130 = add nuw nsw i64 %indvars.iv.i.i129, 1
  %exitcond.i.i131 = icmp eq i64 %indvars.iv.next.i.i130, 1000
  br i1 %exitcond.i.i131, label %.loopexit.i.i134, label %1057

.loopexit.i.i134:                                 ; preds = %1057
  %scevgep.i.i132 = getelementptr i8* %1055, i64 55944
  %scevgep3.i.i133 = bitcast i8* %scevgep.i.i132 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i133, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpIntList.exit

newVExpIntList.exit:                              ; preds = %newIntList.exit, %.loopexit.i.i134
  %1062 = phi %struct.VExp* [ %scevgep3.i.i133, %.loopexit.i.i134 ], [ %1052, %newIntList.exit ]
  %1063 = getelementptr inbounds %struct.VExp* %1062, i64 0, i32 4
  store i32 1, i32* %1063, align 4, !tbaa !23
  %1064 = getelementptr inbounds %struct.VExp* %1062, i64 0, i32 3
  %1065 = bitcast %union.anon.1* %1064 to %struct.VExp**
  %1066 = load %struct.VExp** %1065, align 8, !tbaa !1
  store %struct.VExp* %1066, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %1067 = getelementptr inbounds %struct.VExp* %1062, i64 0, i32 0
  store i32 4, i32* %1067, align 4, !tbaa !25
  %1068 = bitcast %union.anon.1* %1064 to %struct.IntList**
  store %struct.IntList* %1048, %struct.IntList** %1068, align 8, !tbaa !21
  %1069 = load %struct.VExp** %277, align 8, !tbaa !34
  %1070 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %1069) #7
  store %struct.VExp* %1062, %struct.VExp** %277, align 8, !tbaa !34
  %1071 = load %struct.VContext** %279, align 8, !tbaa !36
  %1072 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %1071) #7
  store %struct.VContext* null, %struct.VContext** %279, align 8, !tbaa !36
  %1073 = load %struct.Continuation** %1, align 8, !tbaa !37
  %1074 = getelementptr inbounds %struct.Continuation* %1073, i64 0, i32 2
  %1075 = load %struct.Continuation** %1074, align 8, !tbaa !15
  %1076 = icmp eq %struct.Continuation* %1073, null
  br i1 %1076, label %popContinuation.exit54, label %1077

; <label>:1077                                    ; preds = %newVExpIntList.exit
  %1078 = getelementptr inbounds %struct.Continuation* %1073, i64 0, i32 0
  %1079 = load i32* %1078, align 4, !tbaa !17
  switch i32 %1079, label %allocateContinuation.exit.i.i53 [
    i32 0, label %1080
    i32 1, label %1087
  ]

; <label>:1080                                    ; preds = %1077
  %1081 = getelementptr inbounds %struct.Continuation* %1073, i64 0, i32 1, i32 0, i32 0
  %1082 = load %struct.VExp** %1081, align 8, !tbaa !18
  %1083 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %1082) #7
  %1084 = getelementptr inbounds %struct.Continuation* %1073, i64 0, i32 1, i32 0, i32 1
  %1085 = load %struct.VContext** %1084, align 8, !tbaa !20
  %1086 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %1085) #7
  br label %allocateContinuation.exit.i.i53

; <label>:1087                                    ; preds = %1077
  %1088 = getelementptr inbounds %struct.Continuation* %1073, i64 0, i32 1
  %1089 = bitcast %union.anon.8* %1088 to %struct.Value**
  %1090 = load %struct.Value** %1089, align 8, !tbaa !21
  %1091 = tail call %struct.Value* @releaseValue(%struct.Value* %1090) #7
  br label %allocateContinuation.exit.i.i53

allocateContinuation.exit.i.i53:                  ; preds = %1087, %1080, %1077
  %1092 = load %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  store %struct.Continuation* %1092, %struct.Continuation** %1074, align 8, !tbaa !15
  store %struct.Continuation* %1073, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  br label %popContinuation.exit54

popContinuation.exit54:                           ; preds = %newVExpIntList.exit, %allocateContinuation.exit.i.i53
  store %struct.Continuation* %1075, %struct.Continuation** %1, align 8, !tbaa !37
  br label %1128

; <label>:1093                                    ; preds = %276
  %1094 = call %struct.VExp* @appendSyscallArg(%struct.VExp* %278, %struct.Value* %283, i8** %error_message, %struct.Value** %to_resolve)
  %1095 = icmp eq %struct.VExp* %1094, null
  br i1 %1095, label %1096, label %1103

; <label>:1096                                    ; preds = %1093
  %1097 = load i8** %error_message, align 8, !tbaa !1
  %1098 = icmp eq i8* %1097, null
  br i1 %1098, label %1100, label %1099

; <label>:1099                                    ; preds = %1096
  tail call void @setExceptionValue(%struct.Value* %v, i8* %1097)
  br label %1128

; <label>:1100                                    ; preds = %1096
  %1101 = load %struct.Value** %to_resolve, align 8, !tbaa !1
  %1102 = icmp eq %struct.Value* %1101, null
  br i1 %1102, label %1128, label %1129

; <label>:1103                                    ; preds = %1093
  %1104 = load %struct.VExp** %277, align 8, !tbaa !34
  %1105 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %1104) #7
  store %struct.VExp* %1094, %struct.VExp** %277, align 8, !tbaa !34
  %1106 = load %struct.VContext** %279, align 8, !tbaa !36
  %1107 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %1106) #7
  store %struct.VContext* null, %struct.VContext** %279, align 8, !tbaa !36
  %1108 = load %struct.Continuation** %1, align 8, !tbaa !37
  %1109 = getelementptr inbounds %struct.Continuation* %1108, i64 0, i32 2
  %1110 = load %struct.Continuation** %1109, align 8, !tbaa !15
  %1111 = icmp eq %struct.Continuation* %1108, null
  br i1 %1111, label %popContinuation.exit, label %1112

; <label>:1112                                    ; preds = %1103
  %1113 = getelementptr inbounds %struct.Continuation* %1108, i64 0, i32 0
  %1114 = load i32* %1113, align 4, !tbaa !17
  switch i32 %1114, label %allocateContinuation.exit.i.i [
    i32 0, label %1115
    i32 1, label %1122
  ]

; <label>:1115                                    ; preds = %1112
  %1116 = getelementptr inbounds %struct.Continuation* %1108, i64 0, i32 1, i32 0, i32 0
  %1117 = load %struct.VExp** %1116, align 8, !tbaa !18
  %1118 = tail call %struct.VExp* @releaseVExp(%struct.VExp* %1117) #7
  %1119 = getelementptr inbounds %struct.Continuation* %1108, i64 0, i32 1, i32 0, i32 1
  %1120 = load %struct.VContext** %1119, align 8, !tbaa !20
  %1121 = tail call %struct.VContext* @releaseVContext(%struct.VContext* %1120) #7
  br label %allocateContinuation.exit.i.i

; <label>:1122                                    ; preds = %1112
  %1123 = getelementptr inbounds %struct.Continuation* %1108, i64 0, i32 1
  %1124 = bitcast %union.anon.8* %1123 to %struct.Value**
  %1125 = load %struct.Value** %1124, align 8, !tbaa !21
  %1126 = tail call %struct.Value* @releaseValue(%struct.Value* %1125) #7
  br label %allocateContinuation.exit.i.i

allocateContinuation.exit.i.i:                    ; preds = %1122, %1115, %1112
  %1127 = load %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  store %struct.Continuation* %1127, %struct.Continuation** %1109, align 8, !tbaa !15
  store %struct.Continuation* %1108, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  br label %popContinuation.exit

popContinuation.exit:                             ; preds = %1103, %allocateContinuation.exit.i.i
  store %struct.Continuation* %1110, %struct.Continuation** %1, align 8, !tbaa !37
  br label %1128

; <label>:1128                                    ; preds = %276, %6, %54, %1100, %pushEvalContinuation.exit74, %popContinuation.exit33, %108, %286, %402, %popContinuation.exit118, %392, %1021, %popContinuation.exit54, %1026, %1011, %popContinuation.exit, %1099, %529, %913, %popContinuation.exit170, %539, %popContinuation.exit85, %pushEvalContinuation.exit94, %4
  br label %1129

; <label>:1129                                    ; preds = %1006, %524, %387, %1100, %lookUpRef.exit, %1128
  %.0 = phi %struct.Value* [ null, %1128 ], [ %64, %lookUpRef.exit ], [ %283, %387 ], [ %283, %524 ], [ %283, %1006 ], [ %1101, %1100 ]
  ret %struct.Value* %.0
}

; Function Attrs: nounwind readnone
declare double @floor(double) #4

; Function Attrs: nounwind uwtable
define void @resolveAllValue(%struct.Value* %v) #1 {
  %1 = load %struct.ValueStack** @allocateValueStack.pool, align 8, !tbaa !1
  %2 = icmp eq %struct.ValueStack* %1, null
  br i1 %2, label %3, label %pushValueStack.exit

; <label>:3                                       ; preds = %0
  %4 = tail call noalias i8* @malloc(i64 16000) #7
  %5 = bitcast i8* %4 to %struct.ValueStack*
  br label %6

; <label>:6                                       ; preds = %6, %3
  %indvars.iv.i.i = phi i64 [ 0, %3 ], [ %indvars.iv.next.i.i, %6 ]
  %7 = phi %struct.ValueStack* [ null, %3 ], [ %8, %6 ]
  %8 = getelementptr inbounds %struct.ValueStack* %5, i64 %indvars.iv.i.i
  %9 = getelementptr inbounds %struct.ValueStack* %8, i64 0, i32 0, i32 0, i32 0
  %.c.i.i = bitcast %struct.ValueStack* %7 to %struct.Value*
  store %struct.Value* %.c.i.i, %struct.Value** %9, align 8, !tbaa !1
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %exitcond.i.i = icmp eq i64 %indvars.iv.next.i.i, 1000
  br i1 %exitcond.i.i, label %.loopexit.i.i, label %6

.loopexit.i.i:                                    ; preds = %6
  %scevgep.i.i = getelementptr i8* %4, i64 15984
  %scevgep4.i.i = bitcast i8* %scevgep.i.i to %struct.ValueStack*
  store %struct.ValueStack* %scevgep4.i.i, %struct.ValueStack** @allocateValueStack.pool, align 8, !tbaa !1
  br label %pushValueStack.exit

pushValueStack.exit:                              ; preds = %0, %.loopexit.i.i
  %10 = phi %struct.ValueStack* [ %scevgep4.i.i, %.loopexit.i.i ], [ %1, %0 ]
  %11 = bitcast %struct.ValueStack* %10 to %struct.ValueStack**
  %12 = load %struct.ValueStack** %11, align 8, !tbaa !1
  store %struct.ValueStack* %12, %struct.ValueStack** @allocateValueStack.pool, align 8, !tbaa !1
  %13 = getelementptr inbounds %struct.ValueStack* %10, i64 0, i32 0, i32 0, i32 1
  store %struct.ValueStack* null, %struct.ValueStack** %13, align 8, !tbaa !20
  %14 = getelementptr inbounds %struct.ValueStack* %10, i64 0, i32 0, i32 0, i32 0
  store %struct.Value* %v, %struct.Value** %14, align 8, !tbaa !18
  %15 = icmp eq %struct.ValueStack* %10, null
  br i1 %15, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %pushValueStack.exit, %.outer.backedge
  %head.0.ph18 = phi %struct.ValueStack* [ %head.0.ph.be, %.outer.backedge ], [ %10, %pushValueStack.exit ]
  %16 = getelementptr inbounds %struct.ValueStack* %head.0.ph18, i64 0, i32 0, i32 0, i32 0
  br label %.backedge

.backedge:                                        ; preds = %23, %20, %.lr.ph
  %17 = load %struct.Value** %16, align 8, !tbaa !18
  %18 = getelementptr inbounds %struct.Value* %17, i64 0, i32 0
  %19 = load i32* %18, align 4, !tbaa !33
  %switch = icmp ult i32 %19, 2
  br i1 %switch, label %popValueStack.exit, label %20

; <label>:20                                      ; preds = %.backedge
  %21 = tail call %struct.Value* @resolveValue(%struct.Value* %17)
  %22 = icmp eq %struct.Value* %21, null
  br i1 %22, label %.backedge, label %23

; <label>:23                                      ; preds = %20
  %24 = load %struct.Value** %16, align 8, !tbaa !18
  %25 = icmp eq %struct.Value* %21, %24
  br i1 %25, label %.backedge, label %26

; <label>:26                                      ; preds = %23
  %27 = load %struct.ValueStack** @allocateValueStack.pool, align 8, !tbaa !1
  %28 = icmp eq %struct.ValueStack* %27, null
  br i1 %28, label %29, label %pushValueStack.exit8

; <label>:29                                      ; preds = %26
  %30 = tail call noalias i8* @malloc(i64 16000) #7
  %31 = bitcast i8* %30 to %struct.ValueStack*
  br label %32

; <label>:32                                      ; preds = %32, %29
  %indvars.iv.i.i1 = phi i64 [ 0, %29 ], [ %indvars.iv.next.i.i3, %32 ]
  %33 = phi %struct.ValueStack* [ null, %29 ], [ %34, %32 ]
  %34 = getelementptr inbounds %struct.ValueStack* %31, i64 %indvars.iv.i.i1
  %35 = getelementptr inbounds %struct.ValueStack* %34, i64 0, i32 0, i32 0, i32 0
  %.c.i.i2 = bitcast %struct.ValueStack* %33 to %struct.Value*
  store %struct.Value* %.c.i.i2, %struct.Value** %35, align 8, !tbaa !1
  %indvars.iv.next.i.i3 = add nuw nsw i64 %indvars.iv.i.i1, 1
  %exitcond.i.i4 = icmp eq i64 %indvars.iv.next.i.i3, 1000
  br i1 %exitcond.i.i4, label %.loopexit.i.i7, label %32

.loopexit.i.i7:                                   ; preds = %32
  %scevgep.i.i5 = getelementptr i8* %30, i64 15984
  %scevgep4.i.i6 = bitcast i8* %scevgep.i.i5 to %struct.ValueStack*
  store %struct.ValueStack* %scevgep4.i.i6, %struct.ValueStack** @allocateValueStack.pool, align 8, !tbaa !1
  br label %pushValueStack.exit8

pushValueStack.exit8:                             ; preds = %26, %.loopexit.i.i7
  %36 = phi %struct.ValueStack* [ %scevgep4.i.i6, %.loopexit.i.i7 ], [ %27, %26 ]
  %37 = bitcast %struct.ValueStack* %36 to %struct.ValueStack**
  %38 = load %struct.ValueStack** %37, align 8, !tbaa !1
  store %struct.ValueStack* %38, %struct.ValueStack** @allocateValueStack.pool, align 8, !tbaa !1
  %39 = getelementptr inbounds %struct.ValueStack* %36, i64 0, i32 0, i32 0, i32 1
  store %struct.ValueStack* %head.0.ph18, %struct.ValueStack** %39, align 8, !tbaa !20
  %40 = getelementptr inbounds %struct.ValueStack* %36, i64 0, i32 0, i32 0, i32 0
  store %struct.Value* %21, %struct.Value** %40, align 8, !tbaa !18
  br label %.outer.backedge

.outer.backedge:                                  ; preds = %pushValueStack.exit8, %popValueStack.exit
  %head.0.ph.be = phi %struct.ValueStack* [ %36, %pushValueStack.exit8 ], [ %43, %popValueStack.exit ]
  %41 = icmp eq %struct.ValueStack* %head.0.ph.be, null
  br i1 %41, label %.loopexit, label %.lr.ph

popValueStack.exit:                               ; preds = %.backedge
  %42 = getelementptr inbounds %struct.ValueStack* %head.0.ph18, i64 0, i32 0, i32 0, i32 1
  %43 = load %struct.ValueStack** %42, align 8, !tbaa !20
  %44 = load %struct.ValueStack** @allocateValueStack.pool, align 8, !tbaa !1
  %.c2.i.i = bitcast %struct.ValueStack* %44 to %struct.Value*
  store %struct.Value* %.c2.i.i, %struct.Value** %16, align 8, !tbaa !1
  store %struct.ValueStack* %head.0.ph18, %struct.ValueStack** @allocateValueStack.pool, align 8, !tbaa !1
  br label %.outer.backedge

.loopexit:                                        ; preds = %.outer.backedge, %pushValueStack.exit
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

.backedge:                                        ; preds = %retainValue.exit, %pushApplyContinuation.exit, %4
  %files_buflen.0 = phi i32 [ 2, %4 ], [ %files_buflen.2, %pushApplyContinuation.exit ], [ %files_buflen.2, %retainValue.exit ]
  %files.0 = phi %struct._IO_FILE** [ %6, %4 ], [ %files.2, %pushApplyContinuation.exit ], [ %files.2, %retainValue.exit ]
  %cur_arg.1 = phi i8* [ %cur_arg.0, %4 ], [ %cur_arg.2, %pushApplyContinuation.exit ], [ %cur_arg.2, %retainValue.exit ]
  %cur_argi.0 = phi i32 [ 0, %4 ], [ %cur_argi.1, %pushApplyContinuation.exit ], [ %cur_argi.1, %retainValue.exit ]
  %.0 = phi %struct.Value* [ %v, %4 ], [ %284, %pushApplyContinuation.exit ], [ %213, %retainValue.exit ]
  %11 = bitcast %struct._IO_FILE** %files.0 to i8*
  %12 = getelementptr inbounds %struct.Value* %.0, i64 0, i32 0
  %13 = load i32* %12, align 4, !tbaa !33
  %switch = icmp ult i32 %13, 2
  br i1 %switch, label %15, label %14

; <label>:14                                      ; preds = %.backedge
  tail call void @resolveAllValue(%struct.Value* %.0)
  %.pr = load i32* %12, align 4, !tbaa !33
  br label %15

; <label>:15                                      ; preds = %.backedge, %14
  %16 = phi i32 [ %13, %.backedge ], [ %.pr, %14 ]
  %17 = icmp eq i32 %16, 1
  %18 = getelementptr inbounds %struct.Value* %.0, i64 0, i32 1
  br i1 %17, label %19, label %23

; <label>:19                                      ; preds = %15
  %20 = bitcast %union.anon.0* %18 to i8**
  %21 = load i8** %20, align 8, !tbaa !1
  %22 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str45, i64 0, i64 0), i8* %21) #7
  br label %309

; <label>:23                                      ; preds = %15
  %24 = getelementptr inbounds %union.anon.0* %18, i64 0, i32 0, i32 0
  %25 = load %struct.VExp** %24, align 8, !tbaa !18
  %26 = getelementptr inbounds %struct.VExp* %25, i64 0, i32 0
  %27 = load i32* %26, align 4, !tbaa !25
  %28 = icmp eq i32 %27, 5
  br i1 %28, label %30, label %29

; <label>:29                                      ; preds = %23
  tail call void @displayExpRecursive(%struct.VExp* %25, i32 0) #7
  %putchar = tail call i32 @putchar(i32 10) #7
  br label %309

; <label>:30                                      ; preds = %23
  %31 = getelementptr inbounds %struct.VExp* %25, i64 0, i32 3, i32 0, i32 0
  %32 = load i32* %31, align 4, !tbaa !28
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds [8 x [4 x i32]]* @syscall_arginfo, i64 0, i64 %33, i64 0
  %35 = load i32* %34, align 16, !tbaa !29
  %36 = getelementptr inbounds %struct.VExp* %25, i64 0, i32 3, i32 0, i32 1
  %37 = load i32* %36, align 4, !tbaa !26
  %38 = icmp sgt i32 %35, %37
  br i1 %38, label %39, label %40

; <label>:39                                      ; preds = %30
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([45 x i8]* @str, i64 0, i64 0)) #7
  br label %309

; <label>:40                                      ; preds = %30
  switch i32 %32, label %.critedge [
    i32 0, label %41
    i32 1, label %45
    i32 3, label %118
    i32 4, label %131
    i32 5, label %147
    i32 6, label %163
    i32 2, label %178
    i32 7, label %191
  ]

; <label>:41                                      ; preds = %40
  %42 = getelementptr inbounds %struct.VExp* %25, i64 0, i32 3, i32 0, i32 2
  %43 = bitcast %union.SyscallArg* %42 to i32*
  %44 = load i32* %43, align 4, !tbaa !29
  br label %309

; <label>:45                                      ; preds = %40
  %46 = getelementptr inbounds %struct.VExp* %25, i64 0, i32 3, i32 0, i32 3
  %47 = load i32* %46, align 4, !tbaa !43
  %48 = icmp ult i32 %47, 4
  br i1 %48, label %49, label %.critedge

; <label>:49                                      ; preds = %45
  %50 = sext i32 %47 to i64
  %switch.gep = getelementptr inbounds [4 x i8*]* @switch.table, i64 0, i64 %50
  %switch.load = load i8** %switch.gep, align 8
  %51 = getelementptr inbounds %struct.VExp* %25, i64 0, i32 3, i32 0, i32 2, i32 0
  %52 = load %struct.IntList** %51, align 8, !tbaa !1
  %53 = icmp eq %struct.IntList* %52, null
  br i1 %53, label %.thread.i, label %.lr.ph7.i

.thread.i:                                        ; preds = %49
  %54 = tail call noalias i8* @malloc(i64 1) #7
  br label %convertIntListToString.exit

.lr.ph7.i:                                        ; preds = %49, %.lr.ph7.i
  %l.05.i = phi i32 [ %phitmp.i, %.lr.ph7.i ], [ 1, %49 ]
  %p.04.i = phi %struct.IntList* [ %56, %.lr.ph7.i ], [ %52, %49 ]
  %55 = getelementptr inbounds %struct.IntList* %p.04.i, i64 0, i32 1
  %56 = load %struct.IntList** %55, align 8, !tbaa !5
  %phitmp.i = add i32 %l.05.i, 1
  %57 = icmp eq %struct.IntList* %56, null
  br i1 %57, label %.lr.ph.i.preheader, label %.lr.ph7.i

.lr.ph.i.preheader:                               ; preds = %.lr.ph7.i
  %phitmp10.i = sext i32 %phitmp.i to i64
  %58 = tail call noalias i8* @malloc(i64 %phitmp10.i) #7
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %.lr.ph.i ], [ 0, %.lr.ph.i.preheader ]
  %p1.03.i = phi %struct.IntList* [ %65, %.lr.ph.i ], [ %52, %.lr.ph.i.preheader ]
  %i.02.i = phi i32 [ %63, %.lr.ph.i ], [ 0, %.lr.ph.i.preheader ]
  %59 = getelementptr inbounds %struct.IntList* %p1.03.i, i64 0, i32 0
  %60 = load i32* %59, align 4, !tbaa !9
  %61 = trunc i32 %60 to i8
  %62 = getelementptr inbounds i8* %58, i64 %indvars.iv.i
  store i8 %61, i8* %62, align 1, !tbaa !10
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %63 = add nsw i32 %i.02.i, 1
  %64 = getelementptr inbounds %struct.IntList* %p1.03.i, i64 0, i32 1
  %65 = load %struct.IntList** %64, align 8, !tbaa !5
  %66 = icmp eq %struct.IntList* %65, null
  br i1 %66, label %._crit_edge.i, label %.lr.ph.i

._crit_edge.i:                                    ; preds = %.lr.ph.i
  %phitmp11.i = sext i32 %63 to i64
  br label %convertIntListToString.exit

convertIntListToString.exit:                      ; preds = %.thread.i, %._crit_edge.i
  %67 = phi i8* [ %58, %._crit_edge.i ], [ %54, %.thread.i ]
  %i.0.lcssa.i = phi i64 [ %phitmp11.i, %._crit_edge.i ], [ 0, %.thread.i ]
  %68 = getelementptr inbounds i8* %67, i64 %i.0.lcssa.i
  store i8 0, i8* %68, align 1, !tbaa !10
  %69 = tail call %struct._IO_FILE* @fopen(i8* %67, i8* %switch.load) #7
  tail call void @free(i8* %67) #7
  %70 = icmp eq %struct._IO_FILE* %69, null
  br i1 %70, label %.critedge, label %.preheader

.preheader:                                       ; preds = %convertIntListToString.exit
  %71 = icmp sgt i32 %files_buflen.0, 0
  br i1 %71, label %.lr.ph, label %.thread44.thread

.thread44.thread:                                 ; preds = %.preheader
  %72 = sext i32 %files_buflen.0 to i64
  %73 = shl nsw i64 %72, 4
  %74 = tail call i8* @realloc(i8* %11, i64 %73) #7
  %75 = bitcast i8* %74 to %struct._IO_FILE**
  br label %.loopexit.thread

; <label>:76                                      ; preds = %.lr.ph
  %77 = add nsw i32 %i.048, 1
  %78 = trunc i64 %indvars.iv.next to i32
  %79 = icmp slt i32 %78, %files_buflen.0
  br i1 %79, label %.lr.ph, label %.thread44

.lr.ph:                                           ; preds = %.preheader, %76
  %indvars.iv = phi i64 [ %indvars.iv.next, %76 ], [ 0, %.preheader ]
  %i.048 = phi i32 [ %77, %76 ], [ 0, %.preheader ]
  %80 = getelementptr inbounds %struct._IO_FILE** %files.0, i64 %indvars.iv
  %81 = load %struct._IO_FILE** %80, align 8, !tbaa !1
  %82 = icmp eq %struct._IO_FILE* %81, null
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %82, label %83, label %76

; <label>:83                                      ; preds = %.lr.ph
  %84 = icmp eq i32 %i.048, -1
  br i1 %84, label %.thread44, label %115

.thread44:                                        ; preds = %76, %83
  %85 = bitcast %struct._IO_FILE** %files.0 to i8*
  %86 = sext i32 %files_buflen.0 to i64
  %87 = shl nsw i64 %86, 4
  %88 = tail call i8* @realloc(i8* %85, i64 %87) #7
  %89 = bitcast i8* %88 to %struct._IO_FILE**
  br i1 %71, label %.lr.ph50.preheader, label %.loopexit.thread

.lr.ph50.preheader:                               ; preds = %.thread44
  %90 = add i32 %files_buflen.0, -1
  %91 = zext i32 %90 to i64
  %92 = add i64 %91, 1
  %end.idx = add i64 %91, 1
  %n.vec = and i64 %92, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %93 = add i32 %files_buflen.0, -1
  %94 = zext i32 %93 to i64
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph50.preheader
  %scevgep111 = getelementptr %struct._IO_FILE** %files.0, i64 %94
  %95 = shl nuw nsw i64 %94, 3
  %scevgep111112 = bitcast %struct._IO_FILE** %scevgep111 to i8*
  %scevgep110 = getelementptr i8* %88, i64 %95
  %bound1 = icmp ule i8* %11, %scevgep110
  %bound0 = icmp ule i8* %88, %scevgep111112
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.memcheck, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %96 = getelementptr inbounds %struct._IO_FILE** %files.0, i64 %index
  %97 = bitcast %struct._IO_FILE** %96 to <2 x %struct._IO_FILE*>*
  %wide.load = load <2 x %struct._IO_FILE*>* %97, align 8
  %.sum117 = or i64 %index, 2
  %98 = getelementptr %struct._IO_FILE** %files.0, i64 %.sum117
  %99 = bitcast %struct._IO_FILE** %98 to <2 x %struct._IO_FILE*>*
  %wide.load114 = load <2 x %struct._IO_FILE*>* %99, align 8
  %100 = getelementptr inbounds %struct._IO_FILE** %89, i64 %index
  %101 = bitcast %struct._IO_FILE** %100 to <2 x %struct._IO_FILE*>*
  store <2 x %struct._IO_FILE*> %wide.load, <2 x %struct._IO_FILE*>* %101, align 8
  %.sum118 = or i64 %index, 2
  %102 = getelementptr %struct._IO_FILE** %89, i64 %.sum118
  %103 = bitcast %struct._IO_FILE** %102 to <2 x %struct._IO_FILE*>*
  store <2 x %struct._IO_FILE*> %wide.load114, <2 x %struct._IO_FILE*>* %103, align 8
  %index.next = add i64 %index, 4
  %104 = icmp eq i64 %index.next, %n.vec
  br i1 %104, label %middle.block, label %vector.body, !llvm.loop !49

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph50.preheader
  %resume.val = phi i64 [ 0, %.lr.ph50.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val
  br i1 %cmp.n, label %.loopexit, label %.lr.ph50

.lr.ph50:                                         ; preds = %middle.block, %.lr.ph50
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %.lr.ph50 ], [ %resume.val, %middle.block ]
  %105 = getelementptr inbounds %struct._IO_FILE** %files.0, i64 %indvars.iv70
  %106 = load %struct._IO_FILE** %105, align 8, !tbaa !1
  %107 = getelementptr inbounds %struct._IO_FILE** %89, i64 %indvars.iv70
  store %struct._IO_FILE* %106, %struct._IO_FILE** %107, align 8, !tbaa !1
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next71 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %files_buflen.0
  br i1 %exitcond, label %.loopexit, label %.lr.ph50, !llvm.loop !52

.loopexit:                                        ; preds = %middle.block, %.lr.ph50
  br i1 %71, label %.lr.ph52, label %.loopexit.thread

.lr.ph52:                                         ; preds = %.loopexit
  %108 = shl nsw i64 %86, 3
  %scevgep = getelementptr i8* %88, i64 %108
  %109 = add i32 %files_buflen.0, -1
  %110 = zext i32 %109 to i64
  %111 = shl nuw nsw i64 %110, 3
  %112 = add i64 %111, 8
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %112, i32 8, i1 false)
  br label %.loopexit.thread

.loopexit.thread:                                 ; preds = %.thread44, %.thread44.thread, %.lr.ph52, %.loopexit
  %113 = phi %struct._IO_FILE** [ %89, %.lr.ph52 ], [ %89, %.loopexit ], [ %75, %.thread44.thread ], [ %89, %.thread44 ]
  %114 = shl nsw i32 %files_buflen.0, 1
  br label %115

; <label>:115                                     ; preds = %.loopexit.thread, %83
  %position.1 = phi i32 [ %files_buflen.0, %.loopexit.thread ], [ %i.048, %83 ]
  %files_buflen.1 = phi i32 [ %114, %.loopexit.thread ], [ %files_buflen.0, %83 ]
  %files.1 = phi %struct._IO_FILE** [ %113, %.loopexit.thread ], [ %files.0, %83 ]
  %116 = sext i32 %position.1 to i64
  %117 = getelementptr inbounds %struct._IO_FILE** %files.1, i64 %116
  store %struct._IO_FILE* %69, %struct._IO_FILE** %117, align 8, !tbaa !1
  br label %.critedge

; <label>:118                                     ; preds = %40
  %119 = getelementptr inbounds %struct.VExp* %25, i64 0, i32 3, i32 0, i32 2
  %120 = bitcast %union.SyscallArg* %119 to i32*
  %121 = load i32* %120, align 4, !tbaa !29
  %122 = icmp sgt i32 %121, -1
  %123 = icmp slt i32 %121, %files_buflen.0
  %or.cond = and i1 %122, %123
  br i1 %or.cond, label %124, label %.critedge

; <label>:124                                     ; preds = %118
  %125 = sext i32 %121 to i64
  %126 = getelementptr inbounds %struct._IO_FILE** %files.0, i64 %125
  %127 = load %struct._IO_FILE** %126, align 8, !tbaa !1
  %128 = icmp eq %struct._IO_FILE* %127, null
  br i1 %128, label %.critedge, label %129

; <label>:129                                     ; preds = %124
  %130 = tail call i32 @fgetc(%struct._IO_FILE* %127) #7
  br label %.critedge

; <label>:131                                     ; preds = %40
  %132 = getelementptr inbounds %struct.VExp* %25, i64 0, i32 3, i32 0, i32 2
  %133 = bitcast %union.SyscallArg* %132 to i32*
  %134 = load i32* %133, align 4, !tbaa !29
  %135 = icmp sgt i32 %134, -1
  %136 = icmp slt i32 %134, %files_buflen.0
  %or.cond8 = and i1 %135, %136
  br i1 %or.cond8, label %137, label %.critedge

; <label>:137                                     ; preds = %131
  %138 = sext i32 %134 to i64
  %139 = getelementptr inbounds %struct._IO_FILE** %files.0, i64 %138
  %140 = load %struct._IO_FILE** %139, align 8, !tbaa !1
  %141 = icmp eq %struct._IO_FILE* %140, null
  br i1 %141, label %.critedge, label %142

; <label>:142                                     ; preds = %137
  %143 = getelementptr inbounds %struct.VExp* %25, i64 0, i32 3, i32 0, i32 3
  %144 = load i32* %143, align 4, !tbaa !43
  %145 = tail call i32 @fputc(i32 %144, %struct._IO_FILE* %140) #7
  %146 = icmp eq i32 %145, -1
  %. = zext i1 %146 to i32
  br label %.critedge

; <label>:147                                     ; preds = %40
  %148 = getelementptr inbounds %struct.VExp* %25, i64 0, i32 3, i32 0, i32 2
  %149 = bitcast %union.SyscallArg* %148 to i32*
  %150 = load i32* %149, align 4, !tbaa !29
  %151 = icmp sgt i32 %150, -1
  %152 = icmp slt i32 %150, %files_buflen.0
  %or.cond9 = and i1 %151, %152
  br i1 %or.cond9, label %153, label %.critedge

; <label>:153                                     ; preds = %147
  %154 = sext i32 %150 to i64
  %155 = getelementptr inbounds %struct._IO_FILE** %files.0, i64 %154
  %156 = load %struct._IO_FILE** %155, align 8, !tbaa !1
  %157 = icmp eq %struct._IO_FILE* %156, null
  br i1 %157, label %.critedge, label %158

; <label>:158                                     ; preds = %153
  %159 = tail call i32 @fgetc(%struct._IO_FILE* %156) #7
  %160 = icmp eq i32 %159, -1
  br i1 %160, label %.critedge, label %161

; <label>:161                                     ; preds = %158
  %162 = tail call i32 @ungetc(i32 %159, %struct._IO_FILE* %156) #7
  br label %.critedge

; <label>:163                                     ; preds = %40
  %164 = icmp slt i32 %cur_argi.0, %argc
  br i1 %164, label %165, label %.critedge

; <label>:165                                     ; preds = %163
  %166 = load i8* %cur_arg.1, align 1, !tbaa !10
  %167 = icmp eq i8 %166, 0
  br i1 %167, label %171, label %168

; <label>:168                                     ; preds = %165
  %169 = sext i8 %166 to i32
  %170 = getelementptr inbounds i8* %cur_arg.1, i64 1
  br label %.critedge

; <label>:171                                     ; preds = %165
  %172 = add nsw i32 %cur_argi.0, 1
  %173 = icmp slt i32 %172, %argc
  br i1 %173, label %174, label %.critedge

; <label>:174                                     ; preds = %171
  %175 = sext i32 %172 to i64
  %176 = getelementptr inbounds i8** %args, i64 %175
  %177 = load i8** %176, align 8, !tbaa !1
  br label %.critedge

; <label>:178                                     ; preds = %40
  %179 = getelementptr inbounds %struct.VExp* %25, i64 0, i32 3, i32 0, i32 2
  %180 = bitcast %union.SyscallArg* %179 to i32*
  %181 = load i32* %180, align 4, !tbaa !29
  %182 = icmp sgt i32 %181, -1
  %183 = icmp slt i32 %181, %files_buflen.0
  %or.cond10 = and i1 %182, %183
  br i1 %or.cond10, label %184, label %.critedge

; <label>:184                                     ; preds = %178
  %185 = sext i32 %181 to i64
  %186 = getelementptr inbounds %struct._IO_FILE** %files.0, i64 %185
  %187 = load %struct._IO_FILE** %186, align 8, !tbaa !1
  %188 = icmp eq %struct._IO_FILE* %187, null
  br i1 %188, label %.critedge, label %189

; <label>:189                                     ; preds = %184
  %190 = tail call i32 @fclose(%struct._IO_FILE* %187) #7
  store %struct._IO_FILE* null, %struct._IO_FILE** %186, align 8, !tbaa !1
  br label %.critedge

; <label>:191                                     ; preds = %40
  %192 = getelementptr inbounds %struct.VExp* %25, i64 0, i32 3, i32 0, i32 2, i32 0
  %193 = load %struct.IntList** %192, align 8, !tbaa !1
  %194 = icmp eq %struct.IntList* %193, null
  br i1 %194, label %.thread.i11, label %.lr.ph7.i15

.thread.i11:                                      ; preds = %191
  %195 = tail call noalias i8* @malloc(i64 1) #7
  br label %convertIntListToString.exit25

.lr.ph7.i15:                                      ; preds = %191, %.lr.ph7.i15
  %l.05.i12 = phi i32 [ %phitmp.i14, %.lr.ph7.i15 ], [ 1, %191 ]
  %p.04.i13 = phi %struct.IntList* [ %197, %.lr.ph7.i15 ], [ %193, %191 ]
  %196 = getelementptr inbounds %struct.IntList* %p.04.i13, i64 0, i32 1
  %197 = load %struct.IntList** %196, align 8, !tbaa !5
  %phitmp.i14 = add i32 %l.05.i12, 1
  %198 = icmp eq %struct.IntList* %197, null
  br i1 %198, label %.lr.ph.i21.preheader, label %.lr.ph7.i15

.lr.ph.i21.preheader:                             ; preds = %.lr.ph7.i15
  %phitmp10.i16 = sext i32 %phitmp.i14 to i64
  %199 = tail call noalias i8* @malloc(i64 %phitmp10.i16) #7
  br label %.lr.ph.i21

.lr.ph.i21:                                       ; preds = %.lr.ph.i21.preheader, %.lr.ph.i21
  %indvars.iv.i17 = phi i64 [ %indvars.iv.next.i20, %.lr.ph.i21 ], [ 0, %.lr.ph.i21.preheader ]
  %p1.03.i18 = phi %struct.IntList* [ %206, %.lr.ph.i21 ], [ %193, %.lr.ph.i21.preheader ]
  %i.02.i19 = phi i32 [ %204, %.lr.ph.i21 ], [ 0, %.lr.ph.i21.preheader ]
  %200 = getelementptr inbounds %struct.IntList* %p1.03.i18, i64 0, i32 0
  %201 = load i32* %200, align 4, !tbaa !9
  %202 = trunc i32 %201 to i8
  %203 = getelementptr inbounds i8* %199, i64 %indvars.iv.i17
  store i8 %202, i8* %203, align 1, !tbaa !10
  %indvars.iv.next.i20 = add nuw nsw i64 %indvars.iv.i17, 1
  %204 = add nsw i32 %i.02.i19, 1
  %205 = getelementptr inbounds %struct.IntList* %p1.03.i18, i64 0, i32 1
  %206 = load %struct.IntList** %205, align 8, !tbaa !5
  %207 = icmp eq %struct.IntList* %206, null
  br i1 %207, label %._crit_edge.i23, label %.lr.ph.i21

._crit_edge.i23:                                  ; preds = %.lr.ph.i21
  %phitmp11.i22 = sext i32 %204 to i64
  br label %convertIntListToString.exit25

convertIntListToString.exit25:                    ; preds = %.thread.i11, %._crit_edge.i23
  %208 = phi i8* [ %199, %._crit_edge.i23 ], [ %195, %.thread.i11 ]
  %i.0.lcssa.i24 = phi i64 [ %phitmp11.i22, %._crit_edge.i23 ], [ 0, %.thread.i11 ]
  %209 = getelementptr inbounds i8* %208, i64 %i.0.lcssa.i24
  store i8 0, i8* %209, align 1, !tbaa !10
  %210 = tail call i32 @system(i8* %208) #7
  tail call void @free(i8* %208) #7
  br label %.critedge

.critedge:                                        ; preds = %45, %40, %184, %178, %163, %153, %147, %142, %137, %131, %124, %118, %convertIntListToString.exit, %158, %115, %174, %171, %168, %convertIntListToString.exit25, %189, %161, %129
  %resultcode.1 = phi i32 [ %position.1, %115 ], [ %130, %129 ], [ %159, %161 ], [ -1, %158 ], [ %169, %168 ], [ 0, %174 ], [ 0, %171 ], [ %190, %189 ], [ %210, %convertIntListToString.exit25 ], [ -1, %convertIntListToString.exit ], [ -2, %118 ], [ -2, %124 ], [ -2, %131 ], [ -2, %137 ], [ %., %142 ], [ -2, %147 ], [ -2, %153 ], [ -1, %163 ], [ -2, %178 ], [ -2, %184 ], [ 0, %40 ], [ -2, %45 ]
  %files_buflen.2 = phi i32 [ %files_buflen.1, %115 ], [ %files_buflen.0, %129 ], [ %files_buflen.0, %161 ], [ %files_buflen.0, %158 ], [ %files_buflen.0, %168 ], [ %files_buflen.0, %174 ], [ %files_buflen.0, %171 ], [ %files_buflen.0, %189 ], [ %files_buflen.0, %convertIntListToString.exit25 ], [ %files_buflen.0, %convertIntListToString.exit ], [ %files_buflen.0, %118 ], [ %files_buflen.0, %124 ], [ %files_buflen.0, %131 ], [ %files_buflen.0, %137 ], [ %files_buflen.0, %142 ], [ %files_buflen.0, %147 ], [ %files_buflen.0, %153 ], [ %files_buflen.0, %163 ], [ %files_buflen.0, %178 ], [ %files_buflen.0, %184 ], [ %files_buflen.0, %40 ], [ %files_buflen.0, %45 ]
  %files.2 = phi %struct._IO_FILE** [ %files.1, %115 ], [ %files.0, %129 ], [ %files.0, %161 ], [ %files.0, %158 ], [ %files.0, %168 ], [ %files.0, %174 ], [ %files.0, %171 ], [ %files.0, %189 ], [ %files.0, %convertIntListToString.exit25 ], [ %files.0, %convertIntListToString.exit ], [ %files.0, %118 ], [ %files.0, %124 ], [ %files.0, %131 ], [ %files.0, %137 ], [ %files.0, %142 ], [ %files.0, %147 ], [ %files.0, %153 ], [ %files.0, %163 ], [ %files.0, %178 ], [ %files.0, %184 ], [ %files.0, %40 ], [ %files.0, %45 ]
  %cur_arg.2 = phi i8* [ %cur_arg.1, %115 ], [ %cur_arg.1, %129 ], [ %cur_arg.1, %161 ], [ %cur_arg.1, %158 ], [ %170, %168 ], [ %177, %174 ], [ %cur_arg.1, %171 ], [ %cur_arg.1, %189 ], [ %cur_arg.1, %convertIntListToString.exit25 ], [ %cur_arg.1, %convertIntListToString.exit ], [ %cur_arg.1, %118 ], [ %cur_arg.1, %124 ], [ %cur_arg.1, %131 ], [ %cur_arg.1, %137 ], [ %cur_arg.1, %142 ], [ %cur_arg.1, %147 ], [ %cur_arg.1, %153 ], [ %cur_arg.1, %163 ], [ %cur_arg.1, %178 ], [ %cur_arg.1, %184 ], [ %cur_arg.1, %40 ], [ %cur_arg.1, %45 ]
  %cur_argi.1 = phi i32 [ %cur_argi.0, %115 ], [ %cur_argi.0, %129 ], [ %cur_argi.0, %161 ], [ %cur_argi.0, %158 ], [ %cur_argi.0, %168 ], [ %172, %174 ], [ %172, %171 ], [ %cur_argi.0, %189 ], [ %cur_argi.0, %convertIntListToString.exit25 ], [ %cur_argi.0, %convertIntListToString.exit ], [ %cur_argi.0, %118 ], [ %cur_argi.0, %124 ], [ %cur_argi.0, %131 ], [ %cur_argi.0, %137 ], [ %cur_argi.0, %142 ], [ %cur_argi.0, %147 ], [ %cur_argi.0, %153 ], [ %cur_argi.0, %163 ], [ %cur_argi.0, %178 ], [ %cur_argi.0, %184 ], [ %cur_argi.0, %40 ], [ %cur_argi.0, %45 ]
  %211 = load %struct.VExp** %24, align 8, !tbaa !18
  %212 = getelementptr inbounds %struct.VExp* %211, i64 0, i32 3, i32 0, i32 4
  %213 = load %struct.Value** %212, align 8, !tbaa !30
  tail call void @resolveAllValue(%struct.Value* %213)
  %214 = getelementptr inbounds %struct.Value* %213, i64 0, i32 0
  %215 = load i32* %214, align 4, !tbaa !33
  %216 = icmp eq i32 %215, 1
  br i1 %216, label %217, label %224

; <label>:217                                     ; preds = %.critedge
  %218 = icmp eq %struct.Value* %213, null
  br i1 %218, label %retainValue.exit, label %219

; <label>:219                                     ; preds = %217
  %220 = getelementptr inbounds %struct.Value* %213, i64 0, i32 2
  %221 = load i32* %220, align 4, !tbaa !31
  %222 = add nsw i32 %221, 1
  store i32 %222, i32* %220, align 4, !tbaa !31
  br label %retainValue.exit

retainValue.exit:                                 ; preds = %217, %219
  %223 = tail call %struct.Value* @releaseValue(%struct.Value* %.0)
  br label %.backedge

; <label>:224                                     ; preds = %.critedge
  %225 = zext i32 %resultcode.1 to i64
  %226 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %227 = icmp eq %struct.VExp* %226, null
  br i1 %227, label %228, label %newVExpNum.exit

; <label>:228                                     ; preds = %224
  %229 = tail call noalias i8* @malloc(i64 56000) #7
  %230 = bitcast i8* %229 to %struct.VExp*
  br label %231

; <label>:231                                     ; preds = %231, %228
  %indvars.iv.i.i = phi i64 [ 0, %228 ], [ %indvars.iv.next.i.i, %231 ]
  %232 = phi %struct.VExp* [ null, %228 ], [ %233, %231 ]
  %233 = getelementptr inbounds %struct.VExp* %230, i64 %indvars.iv.i.i
  %234 = getelementptr inbounds %struct.VExp* %230, i64 %indvars.iv.i.i, i32 3
  %235 = bitcast %union.anon.1* %234 to %struct.VExp**
  store %struct.VExp* %232, %struct.VExp** %235, align 8, !tbaa !1
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %exitcond.i.i = icmp eq i64 %indvars.iv.next.i.i, 1000
  br i1 %exitcond.i.i, label %.loopexit.i.i, label %231

.loopexit.i.i:                                    ; preds = %231
  %scevgep.i.i = getelementptr i8* %229, i64 55944
  %scevgep3.i.i = bitcast i8* %scevgep.i.i to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNum.exit

newVExpNum.exit:                                  ; preds = %224, %.loopexit.i.i
  %236 = phi %struct.VExp* [ %scevgep3.i.i, %.loopexit.i.i ], [ %226, %224 ]
  %237 = getelementptr inbounds %struct.VExp* %236, i64 0, i32 4
  store i32 1, i32* %237, align 4, !tbaa !23
  %238 = getelementptr inbounds %struct.VExp* %236, i64 0, i32 3
  %239 = bitcast %union.anon.1* %238 to %struct.VExp**
  %240 = load %struct.VExp** %239, align 8, !tbaa !1
  store %struct.VExp* %240, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %241 = getelementptr inbounds %struct.VExp* %236, i64 0, i32 0
  store i32 0, i32* %241, align 4, !tbaa !25
  %242 = getelementptr inbounds %struct.VExp* %236, i64 0, i32 3, i32 0, i32 0
  store i32 0, i32* %242, align 8
  %243 = getelementptr inbounds %struct.VExp* %236, i64 0, i32 3, i32 0, i32 2, i32 0
  %num_val.coerce1.c.i = inttoptr i64 %225 to %struct.IntList*
  store %struct.IntList* %num_val.coerce1.c.i, %struct.IntList** %243, align 8
  %244 = load %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %245 = icmp eq %struct.Value* %244, null
  br i1 %245, label %246, label %newResolvedValue.exit

; <label>:246                                     ; preds = %newVExpNum.exit
  %247 = tail call noalias i8* @malloc(i64 40000) #7
  %248 = bitcast i8* %247 to %struct.Value*
  br label %249

; <label>:249                                     ; preds = %249, %246
  %indvars.iv.i.i26 = phi i64 [ 0, %246 ], [ %indvars.iv.next.i.i27, %249 ]
  %250 = phi %struct.Value* [ null, %246 ], [ %251, %249 ]
  %251 = getelementptr inbounds %struct.Value* %248, i64 %indvars.iv.i.i26
  %252 = getelementptr inbounds %struct.Value* %248, i64 %indvars.iv.i.i26, i32 1, i32 0, i32 0
  %.c.i.i = bitcast %struct.Value* %250 to %struct.VExp*
  store %struct.VExp* %.c.i.i, %struct.VExp** %252, align 8, !tbaa !1
  %indvars.iv.next.i.i27 = add nuw nsw i64 %indvars.iv.i.i26, 1
  %exitcond.i.i28 = icmp eq i64 %indvars.iv.next.i.i27, 1000
  br i1 %exitcond.i.i28, label %.loopexit.i.i30, label %249

.loopexit.i.i30:                                  ; preds = %249
  %scevgep.i.i29 = getelementptr i8* %247, i64 39960
  %scevgep4.i.i = bitcast i8* %scevgep.i.i29 to %struct.Value*
  store %struct.Value* %scevgep4.i.i, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  br label %newResolvedValue.exit

newResolvedValue.exit:                            ; preds = %newVExpNum.exit, %.loopexit.i.i30
  %253 = phi %struct.Value* [ %scevgep4.i.i, %.loopexit.i.i30 ], [ %244, %newVExpNum.exit ]
  %254 = getelementptr inbounds %struct.Value* %253, i64 0, i32 2
  store i32 1, i32* %254, align 4, !tbaa !31
  %255 = getelementptr inbounds %struct.Value* %253, i64 0, i32 1
  %256 = bitcast %union.anon.0* %255 to %struct.Value**
  %257 = load %struct.Value** %256, align 8, !tbaa !1
  store %struct.Value* %257, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %258 = getelementptr inbounds %struct.Value* %253, i64 0, i32 0
  store i32 0, i32* %258, align 4, !tbaa !33
  %259 = getelementptr inbounds %struct.Value* %253, i64 0, i32 1, i32 0, i32 0
  store %struct.VExp* %236, %struct.VExp** %259, align 8, !tbaa !18
  %260 = getelementptr inbounds %struct.Value* %253, i64 0, i32 1, i32 0, i32 1
  store %struct.VContext* null, %struct.VContext** %260, align 8, !tbaa !20
  %261 = getelementptr inbounds %struct.Value* %213, i64 0, i32 1, i32 0, i32 0
  %262 = load %struct.VExp** %261, align 8, !tbaa !18
  %263 = icmp eq %struct.VExp* %262, null
  br i1 %263, label %retainVExp.exit, label %264

; <label>:264                                     ; preds = %newResolvedValue.exit
  %265 = getelementptr inbounds %struct.VExp* %262, i64 0, i32 4
  %266 = load i32* %265, align 4, !tbaa !23
  %267 = add nsw i32 %266, 1
  store i32 %267, i32* %265, align 4, !tbaa !23
  br label %retainVExp.exit

retainVExp.exit:                                  ; preds = %newResolvedValue.exit, %264
  %268 = getelementptr inbounds %struct.Value* %213, i64 0, i32 1, i32 0, i32 1
  %269 = load %struct.VContext** %268, align 8, !tbaa !20
  %270 = icmp eq %struct.VContext* %269, null
  br i1 %270, label %retainVContext.exit, label %271

; <label>:271                                     ; preds = %retainVExp.exit
  %272 = getelementptr inbounds %struct.VContext* %269, i64 0, i32 2
  %273 = load i32* %272, align 4, !tbaa !13
  %274 = add nsw i32 %273, 1
  store i32 %274, i32* %272, align 4, !tbaa !13
  br label %retainVContext.exit

retainVContext.exit:                              ; preds = %retainVExp.exit, %271
  %275 = load %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %276 = icmp eq %struct.Value* %275, null
  br i1 %276, label %277, label %newRunningValue.exit

; <label>:277                                     ; preds = %retainVContext.exit
  %278 = tail call noalias i8* @malloc(i64 40000) #7
  %279 = bitcast i8* %278 to %struct.Value*
  br label %280

; <label>:280                                     ; preds = %280, %277
  %indvars.iv.i.i31 = phi i64 [ 0, %277 ], [ %indvars.iv.next.i.i33, %280 ]
  %281 = phi %struct.Value* [ null, %277 ], [ %282, %280 ]
  %282 = getelementptr inbounds %struct.Value* %279, i64 %indvars.iv.i.i31
  %283 = getelementptr inbounds %struct.Value* %279, i64 %indvars.iv.i.i31, i32 1, i32 0, i32 0
  %.c.i.i32 = bitcast %struct.Value* %281 to %struct.VExp*
  store %struct.VExp* %.c.i.i32, %struct.VExp** %283, align 8, !tbaa !1
  %indvars.iv.next.i.i33 = add nuw nsw i64 %indvars.iv.i.i31, 1
  %exitcond.i.i34 = icmp eq i64 %indvars.iv.next.i.i33, 1000
  br i1 %exitcond.i.i34, label %.loopexit.i.i37, label %280

.loopexit.i.i37:                                  ; preds = %280
  %scevgep.i.i35 = getelementptr i8* %278, i64 39960
  %scevgep4.i.i36 = bitcast i8* %scevgep.i.i35 to %struct.Value*
  store %struct.Value* %scevgep4.i.i36, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  br label %newRunningValue.exit

newRunningValue.exit:                             ; preds = %retainVContext.exit, %.loopexit.i.i37
  %284 = phi %struct.Value* [ %scevgep4.i.i36, %.loopexit.i.i37 ], [ %275, %retainVContext.exit ]
  %285 = getelementptr inbounds %struct.Value* %284, i64 0, i32 2
  store i32 1, i32* %285, align 4, !tbaa !31
  %286 = getelementptr inbounds %struct.Value* %284, i64 0, i32 1
  %287 = bitcast %union.anon.0* %286 to %struct.Value**
  %288 = load %struct.Value** %287, align 8, !tbaa !1
  store %struct.Value* %288, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %289 = getelementptr inbounds %struct.Value* %284, i64 0, i32 0
  store i32 2, i32* %289, align 4, !tbaa !33
  %290 = getelementptr inbounds %struct.Value* %284, i64 0, i32 1, i32 0, i32 0
  store %struct.VExp* %262, %struct.VExp** %290, align 8, !tbaa !34
  %291 = getelementptr inbounds %struct.Value* %284, i64 0, i32 1, i32 0, i32 1
  store %struct.VContext* %269, %struct.VContext** %291, align 8, !tbaa !36
  %292 = getelementptr inbounds %struct.Value* %284, i64 0, i32 1, i32 0, i32 2
  store %struct.Continuation* null, %struct.Continuation** %292, align 8, !tbaa !37
  %293 = load %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  %294 = icmp eq %struct.Continuation* %293, null
  br i1 %294, label %295, label %pushApplyContinuation.exit

; <label>:295                                     ; preds = %newRunningValue.exit
  %296 = tail call noalias i8* @malloc(i64 32000) #7
  %297 = bitcast i8* %296 to %struct.Continuation*
  br label %298

; <label>:298                                     ; preds = %298, %295
  %indvars.iv.i.i38 = phi i64 [ 0, %295 ], [ %indvars.iv.next.i.i39, %298 ]
  %299 = phi %struct.Continuation* [ null, %295 ], [ %300, %298 ]
  %300 = getelementptr inbounds %struct.Continuation* %297, i64 %indvars.iv.i.i38
  %301 = getelementptr inbounds %struct.Continuation* %297, i64 %indvars.iv.i.i38, i32 2
  store %struct.Continuation* %299, %struct.Continuation** %301, align 8, !tbaa !15
  %indvars.iv.next.i.i39 = add nuw nsw i64 %indvars.iv.i.i38, 1
  %exitcond.i.i40 = icmp eq i64 %indvars.iv.next.i.i39, 1000
  br i1 %exitcond.i.i40, label %.loopexit.i.i43, label %298

.loopexit.i.i43:                                  ; preds = %298
  %scevgep.i.i41 = getelementptr i8* %296, i64 31968
  %scevgep3.i.i42 = bitcast i8* %scevgep.i.i41 to %struct.Continuation*
  store %struct.Continuation* %scevgep3.i.i42, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  br label %pushApplyContinuation.exit

pushApplyContinuation.exit:                       ; preds = %newRunningValue.exit, %.loopexit.i.i43
  %302 = phi %struct.Continuation* [ %scevgep3.i.i42, %.loopexit.i.i43 ], [ %293, %newRunningValue.exit ]
  %303 = getelementptr inbounds %struct.Continuation* %302, i64 0, i32 2
  %304 = load %struct.Continuation** %303, align 8, !tbaa !15
  store %struct.Continuation* %304, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  %305 = getelementptr inbounds %struct.Continuation* %302, i64 0, i32 0
  store i32 1, i32* %305, align 4, !tbaa !17
  %306 = getelementptr inbounds %struct.Continuation* %302, i64 0, i32 1, i32 0, i32 0
  %ap_x.c.i = bitcast %struct.Value* %253 to %struct.VExp*
  store %struct.VExp* %ap_x.c.i, %struct.VExp** %306, align 8, !tbaa !21
  %307 = load %struct.Continuation** %292, align 8, !tbaa !37
  store %struct.Continuation* %307, %struct.Continuation** %303, align 8, !tbaa !15
  store %struct.Continuation* %302, %struct.Continuation** %292, align 8, !tbaa !37
  %308 = tail call %struct.Value* @releaseValue(%struct.Value* %.0)
  br label %.backedge

; <label>:309                                     ; preds = %41, %39, %29, %19
  %exitcode.0 = phi i32 [ 1, %19 ], [ 0, %29 ], [ 1, %39 ], [ %44, %41 ]
  %310 = tail call %struct.Value* @releaseValue(%struct.Value* %.0)
  %311 = bitcast %struct._IO_FILE** %files.0 to i8*
  tail call void @free(i8* %311) #7
  ret i32 %exitcode.0
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) #2

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

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
  store i32 1, i32* %12, align 4, !tbaa !23
  %13 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3
  %14 = bitcast %union.anon.1* %13 to %struct.VExp**
  %15 = load %struct.VExp** %14, align 8, !tbaa !1
  store %struct.VExp* %15, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %16 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 0
  store i32 8, i32* %16, align 4, !tbaa !25
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
  store i32 1, i32* %13, align 4, !tbaa !23
  %14 = getelementptr inbounds %struct.VExp* %12, i64 0, i32 3
  %15 = bitcast %union.anon.1* %14 to %struct.VExp**
  %16 = load %struct.VExp** %15, align 8, !tbaa !1
  store %struct.VExp* %16, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %17 = getelementptr inbounds %struct.VExp* %12, i64 0, i32 0
  store i32 0, i32* %17, align 4, !tbaa !25
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
  store i32 1, i32* %13, align 4, !tbaa !23
  %14 = getelementptr inbounds %struct.VExp* %12, i64 0, i32 3
  %15 = bitcast %union.anon.1* %14 to %struct.VExp**
  %16 = load %struct.VExp** %15, align 8, !tbaa !1
  store %struct.VExp* %16, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %17 = getelementptr inbounds %struct.VExp* %12, i64 0, i32 0
  store i32 0, i32* %17, align 4, !tbaa !25
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
  store i32 1, i32* %12, align 4, !tbaa !23
  %13 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3
  %14 = bitcast %union.anon.1* %13 to %struct.VExp**
  %15 = load %struct.VExp** %14, align 8, !tbaa !1
  store %struct.VExp* %15, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %16 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 0
  store i32 1, i32* %16, align 4, !tbaa !25
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
  store i32 1, i32* %12, align 4, !tbaa !23
  %13 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3
  %14 = bitcast %union.anon.1* %13 to %struct.VExp**
  %15 = load %struct.VExp** %14, align 8, !tbaa !1
  store %struct.VExp* %15, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %16 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 0
  store i32 7, i32* %16, align 4, !tbaa !25
  %17 = getelementptr inbounds %struct.VExp* %11, i64 0, i32 3, i32 0, i32 0
  store i32 %ref_val, i32* %17, align 4, !tbaa !29
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
  br i1 %phitmp, label %11, label %29

; <label>:11                                      ; preds = %10
  %12 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %13 = icmp eq %struct.VExp* %12, null
  br i1 %13, label %14, label %newVExpNumfunc.exit

; <label>:14                                      ; preds = %11
  %15 = tail call noalias i8* @malloc(i64 56000) #7
  %16 = bitcast i8* %15 to %struct.VExp*
  br label %17

; <label>:17                                      ; preds = %17, %14
  %indvars.iv.i.i = phi i64 [ 0, %14 ], [ %indvars.iv.next.i.i, %17 ]
  %18 = phi %struct.VExp* [ null, %14 ], [ %19, %17 ]
  %19 = getelementptr inbounds %struct.VExp* %16, i64 %indvars.iv.i.i
  %20 = getelementptr inbounds %struct.VExp* %16, i64 %indvars.iv.i.i, i32 3
  %21 = bitcast %union.anon.1* %20 to %struct.VExp**
  store %struct.VExp* %18, %struct.VExp** %21, align 8, !tbaa !1
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %exitcond.i.i = icmp eq i64 %indvars.iv.next.i.i, 1000
  br i1 %exitcond.i.i, label %.loopexit.i.i, label %17

.loopexit.i.i:                                    ; preds = %17
  %scevgep.i.i = getelementptr i8* %15, i64 55944
  %scevgep3.i.i = bitcast i8* %scevgep.i.i to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNumfunc.exit

newVExpNumfunc.exit:                              ; preds = %11, %.loopexit.i.i
  %22 = phi %struct.VExp* [ %scevgep3.i.i, %.loopexit.i.i ], [ %12, %11 ]
  %23 = getelementptr inbounds %struct.VExp* %22, i64 0, i32 4
  store i32 1, i32* %23, align 4, !tbaa !23
  %24 = getelementptr inbounds %struct.VExp* %22, i64 0, i32 3
  %25 = bitcast %union.anon.1* %24 to %struct.VExp**
  %26 = load %struct.VExp** %25, align 8, !tbaa !1
  store %struct.VExp* %26, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %27 = getelementptr inbounds %struct.VExp* %22, i64 0, i32 0
  store i32 2, i32* %27, align 4, !tbaa !25
  %28 = getelementptr inbounds %struct.VExp* %22, i64 0, i32 3, i32 0, i32 0
  store i32 0, i32* %28, align 4, !tbaa !38
  br label %718

; <label>:29                                      ; preds = %10
  %30 = sub nsw i32 45, %2
  %31 = icmp eq i8 %1, 45
  br i1 %31, label %32, label %37

; <label>:32                                      ; preds = %29
  %33 = getelementptr inbounds i8* %func_name, i64 1
  %34 = load i8* %33, align 1, !tbaa !10
  %35 = zext i8 %34 to i32
  %36 = sub nsw i32 0, %35
  br label %37

; <label>:37                                      ; preds = %32, %29
  %__result4.0 = phi i32 [ %36, %32 ], [ %30, %29 ]
  %phitmp246 = icmp eq i32 %__result4.0, 0
  br i1 %phitmp246, label %38, label %56

; <label>:38                                      ; preds = %37
  %39 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %40 = icmp eq %struct.VExp* %39, null
  br i1 %40, label %41, label %newVExpNumfunc.exit262

; <label>:41                                      ; preds = %38
  %42 = tail call noalias i8* @malloc(i64 56000) #7
  %43 = bitcast i8* %42 to %struct.VExp*
  br label %44

; <label>:44                                      ; preds = %44, %41
  %indvars.iv.i.i256 = phi i64 [ 0, %41 ], [ %indvars.iv.next.i.i257, %44 ]
  %45 = phi %struct.VExp* [ null, %41 ], [ %46, %44 ]
  %46 = getelementptr inbounds %struct.VExp* %43, i64 %indvars.iv.i.i256
  %47 = getelementptr inbounds %struct.VExp* %43, i64 %indvars.iv.i.i256, i32 3
  %48 = bitcast %union.anon.1* %47 to %struct.VExp**
  store %struct.VExp* %45, %struct.VExp** %48, align 8, !tbaa !1
  %indvars.iv.next.i.i257 = add nuw nsw i64 %indvars.iv.i.i256, 1
  %exitcond.i.i258 = icmp eq i64 %indvars.iv.next.i.i257, 1000
  br i1 %exitcond.i.i258, label %.loopexit.i.i261, label %44

.loopexit.i.i261:                                 ; preds = %44
  %scevgep.i.i259 = getelementptr i8* %42, i64 55944
  %scevgep3.i.i260 = bitcast i8* %scevgep.i.i259 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i260, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNumfunc.exit262

newVExpNumfunc.exit262:                           ; preds = %38, %.loopexit.i.i261
  %49 = phi %struct.VExp* [ %scevgep3.i.i260, %.loopexit.i.i261 ], [ %39, %38 ]
  %50 = getelementptr inbounds %struct.VExp* %49, i64 0, i32 4
  store i32 1, i32* %50, align 4, !tbaa !23
  %51 = getelementptr inbounds %struct.VExp* %49, i64 0, i32 3
  %52 = bitcast %union.anon.1* %51 to %struct.VExp**
  %53 = load %struct.VExp** %52, align 8, !tbaa !1
  store %struct.VExp* %53, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %54 = getelementptr inbounds %struct.VExp* %49, i64 0, i32 0
  store i32 2, i32* %54, align 4, !tbaa !25
  %55 = getelementptr inbounds %struct.VExp* %49, i64 0, i32 3, i32 0, i32 0
  store i32 1, i32* %55, align 4, !tbaa !38
  br label %718

; <label>:56                                      ; preds = %37
  %57 = sub nsw i32 42, %2
  %58 = icmp eq i8 %1, 42
  br i1 %58, label %59, label %64

; <label>:59                                      ; preds = %56
  %60 = getelementptr inbounds i8* %func_name, i64 1
  %61 = load i8* %60, align 1, !tbaa !10
  %62 = zext i8 %61 to i32
  %63 = sub nsw i32 0, %62
  br label %64

; <label>:64                                      ; preds = %59, %56
  %__result8.0 = phi i32 [ %63, %59 ], [ %57, %56 ]
  %phitmp247 = icmp eq i32 %__result8.0, 0
  br i1 %phitmp247, label %65, label %83

; <label>:65                                      ; preds = %64
  %66 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %67 = icmp eq %struct.VExp* %66, null
  br i1 %67, label %68, label %newVExpNumfunc.exit269

; <label>:68                                      ; preds = %65
  %69 = tail call noalias i8* @malloc(i64 56000) #7
  %70 = bitcast i8* %69 to %struct.VExp*
  br label %71

; <label>:71                                      ; preds = %71, %68
  %indvars.iv.i.i263 = phi i64 [ 0, %68 ], [ %indvars.iv.next.i.i264, %71 ]
  %72 = phi %struct.VExp* [ null, %68 ], [ %73, %71 ]
  %73 = getelementptr inbounds %struct.VExp* %70, i64 %indvars.iv.i.i263
  %74 = getelementptr inbounds %struct.VExp* %70, i64 %indvars.iv.i.i263, i32 3
  %75 = bitcast %union.anon.1* %74 to %struct.VExp**
  store %struct.VExp* %72, %struct.VExp** %75, align 8, !tbaa !1
  %indvars.iv.next.i.i264 = add nuw nsw i64 %indvars.iv.i.i263, 1
  %exitcond.i.i265 = icmp eq i64 %indvars.iv.next.i.i264, 1000
  br i1 %exitcond.i.i265, label %.loopexit.i.i268, label %71

.loopexit.i.i268:                                 ; preds = %71
  %scevgep.i.i266 = getelementptr i8* %69, i64 55944
  %scevgep3.i.i267 = bitcast i8* %scevgep.i.i266 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i267, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNumfunc.exit269

newVExpNumfunc.exit269:                           ; preds = %65, %.loopexit.i.i268
  %76 = phi %struct.VExp* [ %scevgep3.i.i267, %.loopexit.i.i268 ], [ %66, %65 ]
  %77 = getelementptr inbounds %struct.VExp* %76, i64 0, i32 4
  store i32 1, i32* %77, align 4, !tbaa !23
  %78 = getelementptr inbounds %struct.VExp* %76, i64 0, i32 3
  %79 = bitcast %union.anon.1* %78 to %struct.VExp**
  %80 = load %struct.VExp** %79, align 8, !tbaa !1
  store %struct.VExp* %80, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %81 = getelementptr inbounds %struct.VExp* %76, i64 0, i32 0
  store i32 2, i32* %81, align 4, !tbaa !25
  %82 = getelementptr inbounds %struct.VExp* %76, i64 0, i32 3, i32 0, i32 0
  store i32 2, i32* %82, align 4, !tbaa !38
  br label %718

; <label>:83                                      ; preds = %64
  %84 = sub nsw i32 47, %2
  %85 = icmp eq i8 %1, 47
  br i1 %85, label %86, label %91

; <label>:86                                      ; preds = %83
  %87 = getelementptr inbounds i8* %func_name, i64 1
  %88 = load i8* %87, align 1, !tbaa !10
  %89 = zext i8 %88 to i32
  %90 = sub nsw i32 0, %89
  br label %91

; <label>:91                                      ; preds = %86, %83
  %__result12.0 = phi i32 [ %90, %86 ], [ %84, %83 ]
  %phitmp248 = icmp eq i32 %__result12.0, 0
  br i1 %phitmp248, label %92, label %110

; <label>:92                                      ; preds = %91
  %93 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %94 = icmp eq %struct.VExp* %93, null
  br i1 %94, label %95, label %newVExpNumfunc.exit276

; <label>:95                                      ; preds = %92
  %96 = tail call noalias i8* @malloc(i64 56000) #7
  %97 = bitcast i8* %96 to %struct.VExp*
  br label %98

; <label>:98                                      ; preds = %98, %95
  %indvars.iv.i.i270 = phi i64 [ 0, %95 ], [ %indvars.iv.next.i.i271, %98 ]
  %99 = phi %struct.VExp* [ null, %95 ], [ %100, %98 ]
  %100 = getelementptr inbounds %struct.VExp* %97, i64 %indvars.iv.i.i270
  %101 = getelementptr inbounds %struct.VExp* %97, i64 %indvars.iv.i.i270, i32 3
  %102 = bitcast %union.anon.1* %101 to %struct.VExp**
  store %struct.VExp* %99, %struct.VExp** %102, align 8, !tbaa !1
  %indvars.iv.next.i.i271 = add nuw nsw i64 %indvars.iv.i.i270, 1
  %exitcond.i.i272 = icmp eq i64 %indvars.iv.next.i.i271, 1000
  br i1 %exitcond.i.i272, label %.loopexit.i.i275, label %98

.loopexit.i.i275:                                 ; preds = %98
  %scevgep.i.i273 = getelementptr i8* %96, i64 55944
  %scevgep3.i.i274 = bitcast i8* %scevgep.i.i273 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i274, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNumfunc.exit276

newVExpNumfunc.exit276:                           ; preds = %92, %.loopexit.i.i275
  %103 = phi %struct.VExp* [ %scevgep3.i.i274, %.loopexit.i.i275 ], [ %93, %92 ]
  %104 = getelementptr inbounds %struct.VExp* %103, i64 0, i32 4
  store i32 1, i32* %104, align 4, !tbaa !23
  %105 = getelementptr inbounds %struct.VExp* %103, i64 0, i32 3
  %106 = bitcast %union.anon.1* %105 to %struct.VExp**
  %107 = load %struct.VExp** %106, align 8, !tbaa !1
  store %struct.VExp* %107, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %108 = getelementptr inbounds %struct.VExp* %103, i64 0, i32 0
  store i32 2, i32* %108, align 4, !tbaa !25
  %109 = getelementptr inbounds %struct.VExp* %103, i64 0, i32 3, i32 0, i32 0
  store i32 3, i32* %109, align 4, !tbaa !38
  br label %718

; <label>:110                                     ; preds = %91
  %111 = sub nsw i32 37, %2
  %112 = icmp eq i8 %1, 37
  br i1 %112, label %113, label %118

; <label>:113                                     ; preds = %110
  %114 = getelementptr inbounds i8* %func_name, i64 1
  %115 = load i8* %114, align 1, !tbaa !10
  %116 = zext i8 %115 to i32
  %117 = sub nsw i32 0, %116
  br label %118

; <label>:118                                     ; preds = %113, %110
  %__result16.0 = phi i32 [ %117, %113 ], [ %111, %110 ]
  %phitmp249 = icmp eq i32 %__result16.0, 0
  br i1 %phitmp249, label %119, label %137

; <label>:119                                     ; preds = %118
  %120 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %121 = icmp eq %struct.VExp* %120, null
  br i1 %121, label %122, label %newVExpNumfunc.exit283

; <label>:122                                     ; preds = %119
  %123 = tail call noalias i8* @malloc(i64 56000) #7
  %124 = bitcast i8* %123 to %struct.VExp*
  br label %125

; <label>:125                                     ; preds = %125, %122
  %indvars.iv.i.i277 = phi i64 [ 0, %122 ], [ %indvars.iv.next.i.i278, %125 ]
  %126 = phi %struct.VExp* [ null, %122 ], [ %127, %125 ]
  %127 = getelementptr inbounds %struct.VExp* %124, i64 %indvars.iv.i.i277
  %128 = getelementptr inbounds %struct.VExp* %124, i64 %indvars.iv.i.i277, i32 3
  %129 = bitcast %union.anon.1* %128 to %struct.VExp**
  store %struct.VExp* %126, %struct.VExp** %129, align 8, !tbaa !1
  %indvars.iv.next.i.i278 = add nuw nsw i64 %indvars.iv.i.i277, 1
  %exitcond.i.i279 = icmp eq i64 %indvars.iv.next.i.i278, 1000
  br i1 %exitcond.i.i279, label %.loopexit.i.i282, label %125

.loopexit.i.i282:                                 ; preds = %125
  %scevgep.i.i280 = getelementptr i8* %123, i64 55944
  %scevgep3.i.i281 = bitcast i8* %scevgep.i.i280 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i281, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNumfunc.exit283

newVExpNumfunc.exit283:                           ; preds = %119, %.loopexit.i.i282
  %130 = phi %struct.VExp* [ %scevgep3.i.i281, %.loopexit.i.i282 ], [ %120, %119 ]
  %131 = getelementptr inbounds %struct.VExp* %130, i64 0, i32 4
  store i32 1, i32* %131, align 4, !tbaa !23
  %132 = getelementptr inbounds %struct.VExp* %130, i64 0, i32 3
  %133 = bitcast %union.anon.1* %132 to %struct.VExp**
  %134 = load %struct.VExp** %133, align 8, !tbaa !1
  store %struct.VExp* %134, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %135 = getelementptr inbounds %struct.VExp* %130, i64 0, i32 0
  store i32 2, i32* %135, align 4, !tbaa !25
  %136 = getelementptr inbounds %struct.VExp* %130, i64 0, i32 3, i32 0, i32 0
  store i32 4, i32* %136, align 4, !tbaa !38
  br label %718

; <label>:137                                     ; preds = %118
  %138 = sub nsw i32 60, %2
  %139 = icmp eq i8 %1, 60
  br i1 %139, label %140, label %145

; <label>:140                                     ; preds = %137
  %141 = getelementptr inbounds i8* %func_name, i64 1
  %142 = load i8* %141, align 1, !tbaa !10
  %143 = zext i8 %142 to i32
  %144 = sub nsw i32 0, %143
  br label %145

; <label>:145                                     ; preds = %140, %137
  %__result20.0 = phi i32 [ %144, %140 ], [ %138, %137 ]
  %phitmp250 = icmp eq i32 %__result20.0, 0
  br i1 %phitmp250, label %146, label %164

; <label>:146                                     ; preds = %145
  %147 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %148 = icmp eq %struct.VExp* %147, null
  br i1 %148, label %149, label %newVExpNumfunc.exit290

; <label>:149                                     ; preds = %146
  %150 = tail call noalias i8* @malloc(i64 56000) #7
  %151 = bitcast i8* %150 to %struct.VExp*
  br label %152

; <label>:152                                     ; preds = %152, %149
  %indvars.iv.i.i284 = phi i64 [ 0, %149 ], [ %indvars.iv.next.i.i285, %152 ]
  %153 = phi %struct.VExp* [ null, %149 ], [ %154, %152 ]
  %154 = getelementptr inbounds %struct.VExp* %151, i64 %indvars.iv.i.i284
  %155 = getelementptr inbounds %struct.VExp* %151, i64 %indvars.iv.i.i284, i32 3
  %156 = bitcast %union.anon.1* %155 to %struct.VExp**
  store %struct.VExp* %153, %struct.VExp** %156, align 8, !tbaa !1
  %indvars.iv.next.i.i285 = add nuw nsw i64 %indvars.iv.i.i284, 1
  %exitcond.i.i286 = icmp eq i64 %indvars.iv.next.i.i285, 1000
  br i1 %exitcond.i.i286, label %.loopexit.i.i289, label %152

.loopexit.i.i289:                                 ; preds = %152
  %scevgep.i.i287 = getelementptr i8* %150, i64 55944
  %scevgep3.i.i288 = bitcast i8* %scevgep.i.i287 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i288, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNumfunc.exit290

newVExpNumfunc.exit290:                           ; preds = %146, %.loopexit.i.i289
  %157 = phi %struct.VExp* [ %scevgep3.i.i288, %.loopexit.i.i289 ], [ %147, %146 ]
  %158 = getelementptr inbounds %struct.VExp* %157, i64 0, i32 4
  store i32 1, i32* %158, align 4, !tbaa !23
  %159 = getelementptr inbounds %struct.VExp* %157, i64 0, i32 3
  %160 = bitcast %union.anon.1* %159 to %struct.VExp**
  %161 = load %struct.VExp** %160, align 8, !tbaa !1
  store %struct.VExp* %161, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %162 = getelementptr inbounds %struct.VExp* %157, i64 0, i32 0
  store i32 2, i32* %162, align 4, !tbaa !25
  %163 = getelementptr inbounds %struct.VExp* %157, i64 0, i32 3, i32 0, i32 0
  store i32 6, i32* %163, align 4, !tbaa !38
  br label %718

; <label>:164                                     ; preds = %145
  %165 = sub nsw i32 62, %2
  %166 = icmp eq i8 %1, 62
  br i1 %166, label %167, label %178

; <label>:167                                     ; preds = %164
  %168 = getelementptr inbounds i8* %func_name, i64 1
  %169 = load i8* %168, align 1, !tbaa !10
  %170 = zext i8 %169 to i32
  %171 = sub nsw i32 61, %170
  %172 = icmp eq i8 %169, 61
  br i1 %172, label %173, label %178

; <label>:173                                     ; preds = %167
  %174 = getelementptr inbounds i8* %func_name, i64 2
  %175 = load i8* %174, align 1, !tbaa !10
  %176 = zext i8 %175 to i32
  %177 = sub nsw i32 0, %176
  br label %178

; <label>:178                                     ; preds = %173, %167, %164
  %__result24.0 = phi i32 [ %177, %173 ], [ %171, %167 ], [ %165, %164 ]
  %phitmp251 = icmp eq i32 %__result24.0, 0
  br i1 %phitmp251, label %179, label %197

; <label>:179                                     ; preds = %178
  %180 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %181 = icmp eq %struct.VExp* %180, null
  br i1 %181, label %182, label %newVExpNumfunc.exit297

; <label>:182                                     ; preds = %179
  %183 = tail call noalias i8* @malloc(i64 56000) #7
  %184 = bitcast i8* %183 to %struct.VExp*
  br label %185

; <label>:185                                     ; preds = %185, %182
  %indvars.iv.i.i291 = phi i64 [ 0, %182 ], [ %indvars.iv.next.i.i292, %185 ]
  %186 = phi %struct.VExp* [ null, %182 ], [ %187, %185 ]
  %187 = getelementptr inbounds %struct.VExp* %184, i64 %indvars.iv.i.i291
  %188 = getelementptr inbounds %struct.VExp* %184, i64 %indvars.iv.i.i291, i32 3
  %189 = bitcast %union.anon.1* %188 to %struct.VExp**
  store %struct.VExp* %186, %struct.VExp** %189, align 8, !tbaa !1
  %indvars.iv.next.i.i292 = add nuw nsw i64 %indvars.iv.i.i291, 1
  %exitcond.i.i293 = icmp eq i64 %indvars.iv.next.i.i292, 1000
  br i1 %exitcond.i.i293, label %.loopexit.i.i296, label %185

.loopexit.i.i296:                                 ; preds = %185
  %scevgep.i.i294 = getelementptr i8* %183, i64 55944
  %scevgep3.i.i295 = bitcast i8* %scevgep.i.i294 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i295, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNumfunc.exit297

newVExpNumfunc.exit297:                           ; preds = %179, %.loopexit.i.i296
  %190 = phi %struct.VExp* [ %scevgep3.i.i295, %.loopexit.i.i296 ], [ %180, %179 ]
  %191 = getelementptr inbounds %struct.VExp* %190, i64 0, i32 4
  store i32 1, i32* %191, align 4, !tbaa !23
  %192 = getelementptr inbounds %struct.VExp* %190, i64 0, i32 3
  %193 = bitcast %union.anon.1* %192 to %struct.VExp**
  %194 = load %struct.VExp** %193, align 8, !tbaa !1
  store %struct.VExp* %194, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %195 = getelementptr inbounds %struct.VExp* %190, i64 0, i32 0
  store i32 2, i32* %195, align 4, !tbaa !25
  %196 = getelementptr inbounds %struct.VExp* %190, i64 0, i32 3, i32 0, i32 0
  store i32 8, i32* %196, align 4, !tbaa !38
  br label %718

; <label>:197                                     ; preds = %178
  br i1 %166, label %198, label %203

; <label>:198                                     ; preds = %197
  %199 = getelementptr inbounds i8* %func_name, i64 1
  %200 = load i8* %199, align 1, !tbaa !10
  %201 = zext i8 %200 to i32
  %202 = sub nsw i32 0, %201
  br label %203

; <label>:203                                     ; preds = %198, %197
  %__result28.0 = phi i32 [ %202, %198 ], [ %165, %197 ]
  %phitmp252 = icmp eq i32 %__result28.0, 0
  br i1 %phitmp252, label %204, label %222

; <label>:204                                     ; preds = %203
  %205 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %206 = icmp eq %struct.VExp* %205, null
  br i1 %206, label %207, label %newVExpNumfunc.exit304

; <label>:207                                     ; preds = %204
  %208 = tail call noalias i8* @malloc(i64 56000) #7
  %209 = bitcast i8* %208 to %struct.VExp*
  br label %210

; <label>:210                                     ; preds = %210, %207
  %indvars.iv.i.i298 = phi i64 [ 0, %207 ], [ %indvars.iv.next.i.i299, %210 ]
  %211 = phi %struct.VExp* [ null, %207 ], [ %212, %210 ]
  %212 = getelementptr inbounds %struct.VExp* %209, i64 %indvars.iv.i.i298
  %213 = getelementptr inbounds %struct.VExp* %209, i64 %indvars.iv.i.i298, i32 3
  %214 = bitcast %union.anon.1* %213 to %struct.VExp**
  store %struct.VExp* %211, %struct.VExp** %214, align 8, !tbaa !1
  %indvars.iv.next.i.i299 = add nuw nsw i64 %indvars.iv.i.i298, 1
  %exitcond.i.i300 = icmp eq i64 %indvars.iv.next.i.i299, 1000
  br i1 %exitcond.i.i300, label %.loopexit.i.i303, label %210

.loopexit.i.i303:                                 ; preds = %210
  %scevgep.i.i301 = getelementptr i8* %208, i64 55944
  %scevgep3.i.i302 = bitcast i8* %scevgep.i.i301 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i302, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNumfunc.exit304

newVExpNumfunc.exit304:                           ; preds = %204, %.loopexit.i.i303
  %215 = phi %struct.VExp* [ %scevgep3.i.i302, %.loopexit.i.i303 ], [ %205, %204 ]
  %216 = getelementptr inbounds %struct.VExp* %215, i64 0, i32 4
  store i32 1, i32* %216, align 4, !tbaa !23
  %217 = getelementptr inbounds %struct.VExp* %215, i64 0, i32 3
  %218 = bitcast %union.anon.1* %217 to %struct.VExp**
  %219 = load %struct.VExp** %218, align 8, !tbaa !1
  store %struct.VExp* %219, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %220 = getelementptr inbounds %struct.VExp* %215, i64 0, i32 0
  store i32 2, i32* %220, align 4, !tbaa !25
  %221 = getelementptr inbounds %struct.VExp* %215, i64 0, i32 3, i32 0, i32 0
  store i32 5, i32* %221, align 4, !tbaa !38
  br label %718

; <label>:222                                     ; preds = %203
  br i1 %139, label %223, label %234

; <label>:223                                     ; preds = %222
  %224 = getelementptr inbounds i8* %func_name, i64 1
  %225 = load i8* %224, align 1, !tbaa !10
  %226 = zext i8 %225 to i32
  %227 = sub nsw i32 61, %226
  %228 = icmp eq i8 %225, 61
  br i1 %228, label %229, label %234

; <label>:229                                     ; preds = %223
  %230 = getelementptr inbounds i8* %func_name, i64 2
  %231 = load i8* %230, align 1, !tbaa !10
  %232 = zext i8 %231 to i32
  %233 = sub nsw i32 0, %232
  br label %234

; <label>:234                                     ; preds = %229, %223, %222
  %__result32.0 = phi i32 [ %233, %229 ], [ %227, %223 ], [ %138, %222 ]
  %phitmp253 = icmp eq i32 %__result32.0, 0
  br i1 %phitmp253, label %235, label %253

; <label>:235                                     ; preds = %234
  %236 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %237 = icmp eq %struct.VExp* %236, null
  br i1 %237, label %238, label %newVExpNumfunc.exit311

; <label>:238                                     ; preds = %235
  %239 = tail call noalias i8* @malloc(i64 56000) #7
  %240 = bitcast i8* %239 to %struct.VExp*
  br label %241

; <label>:241                                     ; preds = %241, %238
  %indvars.iv.i.i305 = phi i64 [ 0, %238 ], [ %indvars.iv.next.i.i306, %241 ]
  %242 = phi %struct.VExp* [ null, %238 ], [ %243, %241 ]
  %243 = getelementptr inbounds %struct.VExp* %240, i64 %indvars.iv.i.i305
  %244 = getelementptr inbounds %struct.VExp* %240, i64 %indvars.iv.i.i305, i32 3
  %245 = bitcast %union.anon.1* %244 to %struct.VExp**
  store %struct.VExp* %242, %struct.VExp** %245, align 8, !tbaa !1
  %indvars.iv.next.i.i306 = add nuw nsw i64 %indvars.iv.i.i305, 1
  %exitcond.i.i307 = icmp eq i64 %indvars.iv.next.i.i306, 1000
  br i1 %exitcond.i.i307, label %.loopexit.i.i310, label %241

.loopexit.i.i310:                                 ; preds = %241
  %scevgep.i.i308 = getelementptr i8* %239, i64 55944
  %scevgep3.i.i309 = bitcast i8* %scevgep.i.i308 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i309, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNumfunc.exit311

newVExpNumfunc.exit311:                           ; preds = %235, %.loopexit.i.i310
  %246 = phi %struct.VExp* [ %scevgep3.i.i309, %.loopexit.i.i310 ], [ %236, %235 ]
  %247 = getelementptr inbounds %struct.VExp* %246, i64 0, i32 4
  store i32 1, i32* %247, align 4, !tbaa !23
  %248 = getelementptr inbounds %struct.VExp* %246, i64 0, i32 3
  %249 = bitcast %union.anon.1* %248 to %struct.VExp**
  %250 = load %struct.VExp** %249, align 8, !tbaa !1
  store %struct.VExp* %250, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %251 = getelementptr inbounds %struct.VExp* %246, i64 0, i32 0
  store i32 2, i32* %251, align 4, !tbaa !25
  %252 = getelementptr inbounds %struct.VExp* %246, i64 0, i32 3, i32 0, i32 0
  store i32 7, i32* %252, align 4, !tbaa !38
  br label %718

; <label>:253                                     ; preds = %234
  br i1 %85, label %254, label %265

; <label>:254                                     ; preds = %253
  %255 = getelementptr inbounds i8* %func_name, i64 1
  %256 = load i8* %255, align 1, !tbaa !10
  %257 = zext i8 %256 to i32
  %258 = sub nsw i32 61, %257
  %259 = icmp eq i8 %256, 61
  br i1 %259, label %260, label %265

; <label>:260                                     ; preds = %254
  %261 = getelementptr inbounds i8* %func_name, i64 2
  %262 = load i8* %261, align 1, !tbaa !10
  %263 = zext i8 %262 to i32
  %264 = sub nsw i32 0, %263
  br label %265

; <label>:265                                     ; preds = %260, %254, %253
  %__result36.0 = phi i32 [ %264, %260 ], [ %258, %254 ], [ %84, %253 ]
  %phitmp254 = icmp eq i32 %__result36.0, 0
  br i1 %phitmp254, label %266, label %284

; <label>:266                                     ; preds = %265
  %267 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %268 = icmp eq %struct.VExp* %267, null
  br i1 %268, label %269, label %newVExpNumfunc.exit318

; <label>:269                                     ; preds = %266
  %270 = tail call noalias i8* @malloc(i64 56000) #7
  %271 = bitcast i8* %270 to %struct.VExp*
  br label %272

; <label>:272                                     ; preds = %272, %269
  %indvars.iv.i.i312 = phi i64 [ 0, %269 ], [ %indvars.iv.next.i.i313, %272 ]
  %273 = phi %struct.VExp* [ null, %269 ], [ %274, %272 ]
  %274 = getelementptr inbounds %struct.VExp* %271, i64 %indvars.iv.i.i312
  %275 = getelementptr inbounds %struct.VExp* %271, i64 %indvars.iv.i.i312, i32 3
  %276 = bitcast %union.anon.1* %275 to %struct.VExp**
  store %struct.VExp* %273, %struct.VExp** %276, align 8, !tbaa !1
  %indvars.iv.next.i.i313 = add nuw nsw i64 %indvars.iv.i.i312, 1
  %exitcond.i.i314 = icmp eq i64 %indvars.iv.next.i.i313, 1000
  br i1 %exitcond.i.i314, label %.loopexit.i.i317, label %272

.loopexit.i.i317:                                 ; preds = %272
  %scevgep.i.i315 = getelementptr i8* %270, i64 55944
  %scevgep3.i.i316 = bitcast i8* %scevgep.i.i315 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i316, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNumfunc.exit318

newVExpNumfunc.exit318:                           ; preds = %266, %.loopexit.i.i317
  %277 = phi %struct.VExp* [ %scevgep3.i.i316, %.loopexit.i.i317 ], [ %267, %266 ]
  %278 = getelementptr inbounds %struct.VExp* %277, i64 0, i32 4
  store i32 1, i32* %278, align 4, !tbaa !23
  %279 = getelementptr inbounds %struct.VExp* %277, i64 0, i32 3
  %280 = bitcast %union.anon.1* %279 to %struct.VExp**
  %281 = load %struct.VExp** %280, align 8, !tbaa !1
  store %struct.VExp* %281, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %282 = getelementptr inbounds %struct.VExp* %277, i64 0, i32 0
  store i32 2, i32* %282, align 4, !tbaa !25
  %283 = getelementptr inbounds %struct.VExp* %277, i64 0, i32 3, i32 0, i32 0
  store i32 10, i32* %283, align 4, !tbaa !38
  br label %718

; <label>:284                                     ; preds = %265
  %285 = sub nsw i32 61, %2
  %286 = icmp eq i8 %1, 61
  br i1 %286, label %287, label %292

; <label>:287                                     ; preds = %284
  %288 = getelementptr inbounds i8* %func_name, i64 1
  %289 = load i8* %288, align 1, !tbaa !10
  %290 = zext i8 %289 to i32
  %291 = sub nsw i32 0, %290
  br label %292

; <label>:292                                     ; preds = %287, %284
  %__result40.0 = phi i32 [ %291, %287 ], [ %285, %284 ]
  %phitmp255 = icmp eq i32 %__result40.0, 0
  br i1 %phitmp255, label %293, label %311

; <label>:293                                     ; preds = %292
  %294 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %295 = icmp eq %struct.VExp* %294, null
  br i1 %295, label %296, label %newVExpNumfunc.exit325

; <label>:296                                     ; preds = %293
  %297 = tail call noalias i8* @malloc(i64 56000) #7
  %298 = bitcast i8* %297 to %struct.VExp*
  br label %299

; <label>:299                                     ; preds = %299, %296
  %indvars.iv.i.i319 = phi i64 [ 0, %296 ], [ %indvars.iv.next.i.i320, %299 ]
  %300 = phi %struct.VExp* [ null, %296 ], [ %301, %299 ]
  %301 = getelementptr inbounds %struct.VExp* %298, i64 %indvars.iv.i.i319
  %302 = getelementptr inbounds %struct.VExp* %298, i64 %indvars.iv.i.i319, i32 3
  %303 = bitcast %union.anon.1* %302 to %struct.VExp**
  store %struct.VExp* %300, %struct.VExp** %303, align 8, !tbaa !1
  %indvars.iv.next.i.i320 = add nuw nsw i64 %indvars.iv.i.i319, 1
  %exitcond.i.i321 = icmp eq i64 %indvars.iv.next.i.i320, 1000
  br i1 %exitcond.i.i321, label %.loopexit.i.i324, label %299

.loopexit.i.i324:                                 ; preds = %299
  %scevgep.i.i322 = getelementptr i8* %297, i64 55944
  %scevgep3.i.i323 = bitcast i8* %scevgep.i.i322 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i323, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNumfunc.exit325

newVExpNumfunc.exit325:                           ; preds = %293, %.loopexit.i.i324
  %304 = phi %struct.VExp* [ %scevgep3.i.i323, %.loopexit.i.i324 ], [ %294, %293 ]
  %305 = getelementptr inbounds %struct.VExp* %304, i64 0, i32 4
  store i32 1, i32* %305, align 4, !tbaa !23
  %306 = getelementptr inbounds %struct.VExp* %304, i64 0, i32 3
  %307 = bitcast %union.anon.1* %306 to %struct.VExp**
  %308 = load %struct.VExp** %307, align 8, !tbaa !1
  store %struct.VExp* %308, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %309 = getelementptr inbounds %struct.VExp* %304, i64 0, i32 0
  store i32 2, i32* %309, align 4, !tbaa !25
  %310 = getelementptr inbounds %struct.VExp* %304, i64 0, i32 3, i32 0, i32 0
  store i32 9, i32* %310, align 4, !tbaa !38
  br label %718

; <label>:311                                     ; preds = %292
  %312 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([6 x i8]* @.str15, i64 0, i64 0)) #7
  %313 = icmp eq i32 %312, 0
  br i1 %313, label %314, label %332

; <label>:314                                     ; preds = %311
  %315 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %316 = icmp eq %struct.VExp* %315, null
  br i1 %316, label %317, label %newVExpNumfunc.exit332

; <label>:317                                     ; preds = %314
  %318 = tail call noalias i8* @malloc(i64 56000) #7
  %319 = bitcast i8* %318 to %struct.VExp*
  br label %320

; <label>:320                                     ; preds = %320, %317
  %indvars.iv.i.i326 = phi i64 [ 0, %317 ], [ %indvars.iv.next.i.i327, %320 ]
  %321 = phi %struct.VExp* [ null, %317 ], [ %322, %320 ]
  %322 = getelementptr inbounds %struct.VExp* %319, i64 %indvars.iv.i.i326
  %323 = getelementptr inbounds %struct.VExp* %319, i64 %indvars.iv.i.i326, i32 3
  %324 = bitcast %union.anon.1* %323 to %struct.VExp**
  store %struct.VExp* %321, %struct.VExp** %324, align 8, !tbaa !1
  %indvars.iv.next.i.i327 = add nuw nsw i64 %indvars.iv.i.i326, 1
  %exitcond.i.i328 = icmp eq i64 %indvars.iv.next.i.i327, 1000
  br i1 %exitcond.i.i328, label %.loopexit.i.i331, label %320

.loopexit.i.i331:                                 ; preds = %320
  %scevgep.i.i329 = getelementptr i8* %318, i64 55944
  %scevgep3.i.i330 = bitcast i8* %scevgep.i.i329 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i330, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNumfunc.exit332

newVExpNumfunc.exit332:                           ; preds = %314, %.loopexit.i.i331
  %325 = phi %struct.VExp* [ %scevgep3.i.i330, %.loopexit.i.i331 ], [ %315, %314 ]
  %326 = getelementptr inbounds %struct.VExp* %325, i64 0, i32 4
  store i32 1, i32* %326, align 4, !tbaa !23
  %327 = getelementptr inbounds %struct.VExp* %325, i64 0, i32 3
  %328 = bitcast %union.anon.1* %327 to %struct.VExp**
  %329 = load %struct.VExp** %328, align 8, !tbaa !1
  store %struct.VExp* %329, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %330 = getelementptr inbounds %struct.VExp* %325, i64 0, i32 0
  store i32 2, i32* %330, align 4, !tbaa !25
  %331 = getelementptr inbounds %struct.VExp* %325, i64 0, i32 3, i32 0, i32 0
  store i32 13, i32* %331, align 4, !tbaa !38
  br label %718

; <label>:332                                     ; preds = %311
  %333 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([8 x i8]* @.str14, i64 0, i64 0)) #7
  %334 = icmp eq i32 %333, 0
  br i1 %334, label %335, label %353

; <label>:335                                     ; preds = %332
  %336 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %337 = icmp eq %struct.VExp* %336, null
  br i1 %337, label %338, label %newVExpNumfunc.exit339

; <label>:338                                     ; preds = %335
  %339 = tail call noalias i8* @malloc(i64 56000) #7
  %340 = bitcast i8* %339 to %struct.VExp*
  br label %341

; <label>:341                                     ; preds = %341, %338
  %indvars.iv.i.i333 = phi i64 [ 0, %338 ], [ %indvars.iv.next.i.i334, %341 ]
  %342 = phi %struct.VExp* [ null, %338 ], [ %343, %341 ]
  %343 = getelementptr inbounds %struct.VExp* %340, i64 %indvars.iv.i.i333
  %344 = getelementptr inbounds %struct.VExp* %340, i64 %indvars.iv.i.i333, i32 3
  %345 = bitcast %union.anon.1* %344 to %struct.VExp**
  store %struct.VExp* %342, %struct.VExp** %345, align 8, !tbaa !1
  %indvars.iv.next.i.i334 = add nuw nsw i64 %indvars.iv.i.i333, 1
  %exitcond.i.i335 = icmp eq i64 %indvars.iv.next.i.i334, 1000
  br i1 %exitcond.i.i335, label %.loopexit.i.i338, label %341

.loopexit.i.i338:                                 ; preds = %341
  %scevgep.i.i336 = getelementptr i8* %339, i64 55944
  %scevgep3.i.i337 = bitcast i8* %scevgep.i.i336 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i337, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNumfunc.exit339

newVExpNumfunc.exit339:                           ; preds = %335, %.loopexit.i.i338
  %346 = phi %struct.VExp* [ %scevgep3.i.i337, %.loopexit.i.i338 ], [ %336, %335 ]
  %347 = getelementptr inbounds %struct.VExp* %346, i64 0, i32 4
  store i32 1, i32* %347, align 4, !tbaa !23
  %348 = getelementptr inbounds %struct.VExp* %346, i64 0, i32 3
  %349 = bitcast %union.anon.1* %348 to %struct.VExp**
  %350 = load %struct.VExp** %349, align 8, !tbaa !1
  store %struct.VExp* %350, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %351 = getelementptr inbounds %struct.VExp* %346, i64 0, i32 0
  store i32 2, i32* %351, align 4, !tbaa !25
  %352 = getelementptr inbounds %struct.VExp* %346, i64 0, i32 3, i32 0, i32 0
  store i32 12, i32* %352, align 4, !tbaa !38
  br label %718

; <label>:353                                     ; preds = %332
  %354 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([5 x i8]* @.str16, i64 0, i64 0)) #7
  %355 = icmp eq i32 %354, 0
  br i1 %355, label %356, label %375

; <label>:356                                     ; preds = %353
  %357 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %358 = icmp eq %struct.VExp* %357, null
  br i1 %358, label %359, label %newVExpSyscall0.exit

; <label>:359                                     ; preds = %356
  %360 = tail call noalias i8* @malloc(i64 56000) #7
  %361 = bitcast i8* %360 to %struct.VExp*
  br label %362

; <label>:362                                     ; preds = %362, %359
  %indvars.iv.i.i340 = phi i64 [ 0, %359 ], [ %indvars.iv.next.i.i341, %362 ]
  %363 = phi %struct.VExp* [ null, %359 ], [ %364, %362 ]
  %364 = getelementptr inbounds %struct.VExp* %361, i64 %indvars.iv.i.i340
  %365 = getelementptr inbounds %struct.VExp* %361, i64 %indvars.iv.i.i340, i32 3
  %366 = bitcast %union.anon.1* %365 to %struct.VExp**
  store %struct.VExp* %363, %struct.VExp** %366, align 8, !tbaa !1
  %indvars.iv.next.i.i341 = add nuw nsw i64 %indvars.iv.i.i340, 1
  %exitcond.i.i342 = icmp eq i64 %indvars.iv.next.i.i341, 1000
  br i1 %exitcond.i.i342, label %.loopexit.i.i345, label %362

.loopexit.i.i345:                                 ; preds = %362
  %scevgep.i.i343 = getelementptr i8* %360, i64 55944
  %scevgep3.i.i344 = bitcast i8* %scevgep.i.i343 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i344, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit

newVExpSyscall0.exit:                             ; preds = %356, %.loopexit.i.i345
  %367 = phi %struct.VExp* [ %scevgep3.i.i344, %.loopexit.i.i345 ], [ %357, %356 ]
  %368 = getelementptr inbounds %struct.VExp* %367, i64 0, i32 4
  store i32 1, i32* %368, align 4, !tbaa !23
  %369 = getelementptr inbounds %struct.VExp* %367, i64 0, i32 3
  %370 = bitcast %union.anon.1* %369 to %struct.VExp**
  %371 = load %struct.VExp** %370, align 8, !tbaa !1
  store %struct.VExp* %371, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %372 = getelementptr inbounds %struct.VExp* %367, i64 0, i32 0
  store i32 5, i32* %372, align 4, !tbaa !25
  %373 = getelementptr inbounds %struct.VExp* %367, i64 0, i32 3, i32 0, i32 0
  store i32 0, i32* %373, align 4, !tbaa !28
  %374 = getelementptr inbounds %struct.VExp* %367, i64 0, i32 3, i32 0, i32 1
  store i32 0, i32* %374, align 4, !tbaa !26
  br label %718

; <label>:375                                     ; preds = %353
  %376 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([8 x i8]* @.str52, i64 0, i64 0)) #7
  %377 = icmp eq i32 %376, 0
  br i1 %377, label %378, label %431

; <label>:378                                     ; preds = %375
  %379 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %380 = icmp eq %struct.VExp* %379, null
  br i1 %380, label %381, label %newVExpSyscall0.exit352

; <label>:381                                     ; preds = %378
  %382 = tail call noalias i8* @malloc(i64 56000) #7
  %383 = bitcast i8* %382 to %struct.VExp*
  br label %384

; <label>:384                                     ; preds = %384, %381
  %indvars.iv.i.i346 = phi i64 [ 0, %381 ], [ %indvars.iv.next.i.i347, %384 ]
  %385 = phi %struct.VExp* [ null, %381 ], [ %386, %384 ]
  %386 = getelementptr inbounds %struct.VExp* %383, i64 %indvars.iv.i.i346
  %387 = getelementptr inbounds %struct.VExp* %383, i64 %indvars.iv.i.i346, i32 3
  %388 = bitcast %union.anon.1* %387 to %struct.VExp**
  store %struct.VExp* %385, %struct.VExp** %388, align 8, !tbaa !1
  %indvars.iv.next.i.i347 = add nuw nsw i64 %indvars.iv.i.i346, 1
  %exitcond.i.i348 = icmp eq i64 %indvars.iv.next.i.i347, 1000
  br i1 %exitcond.i.i348, label %.loopexit.i.i351, label %384

.loopexit.i.i351:                                 ; preds = %384
  %scevgep.i.i349 = getelementptr i8* %382, i64 55944
  %scevgep3.i.i350 = bitcast i8* %scevgep.i.i349 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i350, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit352

newVExpSyscall0.exit352:                          ; preds = %378, %.loopexit.i.i351
  %389 = phi %struct.VExp* [ %scevgep3.i.i350, %.loopexit.i.i351 ], [ %379, %378 ]
  %390 = getelementptr inbounds %struct.VExp* %389, i64 0, i32 4
  store i32 1, i32* %390, align 4, !tbaa !23
  %391 = getelementptr inbounds %struct.VExp* %389, i64 0, i32 3
  %392 = bitcast %union.anon.1* %391 to %struct.VExp**
  %393 = load %struct.VExp** %392, align 8, !tbaa !1
  store %struct.VExp* %393, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %394 = getelementptr inbounds %struct.VExp* %389, i64 0, i32 0
  store i32 5, i32* %394, align 4, !tbaa !25
  %395 = getelementptr inbounds %struct.VExp* %389, i64 0, i32 3, i32 0, i32 0
  store i32 4, i32* %395, align 4, !tbaa !28
  %396 = getelementptr inbounds %struct.VExp* %389, i64 0, i32 3, i32 0, i32 1
  store i32 0, i32* %396, align 4, !tbaa !26
  %397 = icmp eq %struct.VExp* %393, null
  br i1 %397, label %398, label %makeInt.exit

; <label>:398                                     ; preds = %newVExpSyscall0.exit352
  %399 = tail call noalias i8* @malloc(i64 56000) #7
  %400 = bitcast i8* %399 to %struct.VExp*
  br label %401

; <label>:401                                     ; preds = %401, %398
  %indvars.iv.i.i.i = phi i64 [ 0, %398 ], [ %indvars.iv.next.i.i.i, %401 ]
  %402 = phi %struct.VExp* [ null, %398 ], [ %403, %401 ]
  %403 = getelementptr inbounds %struct.VExp* %400, i64 %indvars.iv.i.i.i
  %404 = getelementptr inbounds %struct.VExp* %400, i64 %indvars.iv.i.i.i, i32 3
  %405 = bitcast %union.anon.1* %404 to %struct.VExp**
  store %struct.VExp* %402, %struct.VExp** %405, align 8, !tbaa !1
  %indvars.iv.next.i.i.i = add nuw nsw i64 %indvars.iv.i.i.i, 1
  %exitcond.i.i.i = icmp eq i64 %indvars.iv.next.i.i.i, 1000
  br i1 %exitcond.i.i.i, label %.loopexit.i.i.i, label %401

.loopexit.i.i.i:                                  ; preds = %401
  %scevgep.i.i.i = getelementptr i8* %399, i64 55944
  %scevgep3.i.i.i = bitcast i8* %scevgep.i.i.i to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i.i, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %makeInt.exit

makeInt.exit:                                     ; preds = %newVExpSyscall0.exit352, %.loopexit.i.i.i
  %406 = phi %struct.VExp* [ %scevgep3.i.i.i, %.loopexit.i.i.i ], [ %393, %newVExpSyscall0.exit352 ]
  %407 = getelementptr inbounds %struct.VExp* %406, i64 0, i32 4
  store i32 1, i32* %407, align 4, !tbaa !23
  %408 = getelementptr inbounds %struct.VExp* %406, i64 0, i32 3
  %409 = bitcast %union.anon.1* %408 to %struct.VExp**
  %410 = load %struct.VExp** %409, align 8, !tbaa !1
  store %struct.VExp* %410, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %411 = getelementptr inbounds %struct.VExp* %406, i64 0, i32 0
  store i32 0, i32* %411, align 4, !tbaa !25
  %412 = getelementptr inbounds %struct.VExp* %406, i64 0, i32 3, i32 0, i32 0
  store i32 0, i32* %412, align 8
  %413 = getelementptr inbounds %struct.VExp* %406, i64 0, i32 3, i32 0, i32 2, i32 0
  store %struct.IntList* inttoptr (i64 1 to %struct.IntList*), %struct.IntList** %413, align 8
  %414 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %415 = icmp eq %struct.VExp* %414, null
  br i1 %415, label %416, label %newVExpApply.exit

; <label>:416                                     ; preds = %makeInt.exit
  %417 = tail call noalias i8* @malloc(i64 56000) #7
  %418 = bitcast i8* %417 to %struct.VExp*
  br label %419

; <label>:419                                     ; preds = %419, %416
  %indvars.iv.i.i353 = phi i64 [ 0, %416 ], [ %indvars.iv.next.i.i354, %419 ]
  %420 = phi %struct.VExp* [ null, %416 ], [ %421, %419 ]
  %421 = getelementptr inbounds %struct.VExp* %418, i64 %indvars.iv.i.i353
  %422 = getelementptr inbounds %struct.VExp* %418, i64 %indvars.iv.i.i353, i32 3
  %423 = bitcast %union.anon.1* %422 to %struct.VExp**
  store %struct.VExp* %420, %struct.VExp** %423, align 8, !tbaa !1
  %indvars.iv.next.i.i354 = add nuw nsw i64 %indvars.iv.i.i353, 1
  %exitcond.i.i355 = icmp eq i64 %indvars.iv.next.i.i354, 1000
  br i1 %exitcond.i.i355, label %.loopexit.i.i358, label %419

.loopexit.i.i358:                                 ; preds = %419
  %scevgep.i.i356 = getelementptr i8* %417, i64 55944
  %scevgep3.i.i357 = bitcast i8* %scevgep.i.i356 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i357, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpApply.exit

newVExpApply.exit:                                ; preds = %makeInt.exit, %.loopexit.i.i358
  %424 = phi %struct.VExp* [ %scevgep3.i.i357, %.loopexit.i.i358 ], [ %414, %makeInt.exit ]
  %425 = getelementptr inbounds %struct.VExp* %424, i64 0, i32 4
  store i32 1, i32* %425, align 4, !tbaa !23
  %426 = getelementptr inbounds %struct.VExp* %424, i64 0, i32 3
  %427 = bitcast %union.anon.1* %426 to %struct.VExp**
  %428 = load %struct.VExp** %427, align 8, !tbaa !1
  store %struct.VExp* %428, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %429 = getelementptr inbounds %struct.VExp* %424, i64 0, i32 0
  store i32 8, i32* %429, align 4, !tbaa !25
  store %struct.VExp* %389, %struct.VExp** %427, align 8, !tbaa !18
  %430 = getelementptr inbounds %struct.VExp* %424, i64 0, i32 3, i32 0, i32 2, i32 0
  %ap_x.c.i = bitcast %struct.VExp* %406 to %struct.IntList*
  store %struct.IntList* %ap_x.c.i, %struct.IntList** %430, align 8, !tbaa !20
  br label %718

; <label>:431                                     ; preds = %375
  %432 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([9 x i8]* @.str20, i64 0, i64 0)) #7
  %433 = icmp eq i32 %432, 0
  br i1 %433, label %434, label %453

; <label>:434                                     ; preds = %431
  %435 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %436 = icmp eq %struct.VExp* %435, null
  br i1 %436, label %437, label %newVExpSyscall0.exit365

; <label>:437                                     ; preds = %434
  %438 = tail call noalias i8* @malloc(i64 56000) #7
  %439 = bitcast i8* %438 to %struct.VExp*
  br label %440

; <label>:440                                     ; preds = %440, %437
  %indvars.iv.i.i359 = phi i64 [ 0, %437 ], [ %indvars.iv.next.i.i360, %440 ]
  %441 = phi %struct.VExp* [ null, %437 ], [ %442, %440 ]
  %442 = getelementptr inbounds %struct.VExp* %439, i64 %indvars.iv.i.i359
  %443 = getelementptr inbounds %struct.VExp* %439, i64 %indvars.iv.i.i359, i32 3
  %444 = bitcast %union.anon.1* %443 to %struct.VExp**
  store %struct.VExp* %441, %struct.VExp** %444, align 8, !tbaa !1
  %indvars.iv.next.i.i360 = add nuw nsw i64 %indvars.iv.i.i359, 1
  %exitcond.i.i361 = icmp eq i64 %indvars.iv.next.i.i360, 1000
  br i1 %exitcond.i.i361, label %.loopexit.i.i364, label %440

.loopexit.i.i364:                                 ; preds = %440
  %scevgep.i.i362 = getelementptr i8* %438, i64 55944
  %scevgep3.i.i363 = bitcast i8* %scevgep.i.i362 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i363, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit365

newVExpSyscall0.exit365:                          ; preds = %434, %.loopexit.i.i364
  %445 = phi %struct.VExp* [ %scevgep3.i.i363, %.loopexit.i.i364 ], [ %435, %434 ]
  %446 = getelementptr inbounds %struct.VExp* %445, i64 0, i32 4
  store i32 1, i32* %446, align 4, !tbaa !23
  %447 = getelementptr inbounds %struct.VExp* %445, i64 0, i32 3
  %448 = bitcast %union.anon.1* %447 to %struct.VExp**
  %449 = load %struct.VExp** %448, align 8, !tbaa !1
  store %struct.VExp* %449, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %450 = getelementptr inbounds %struct.VExp* %445, i64 0, i32 0
  store i32 5, i32* %450, align 4, !tbaa !25
  %451 = getelementptr inbounds %struct.VExp* %445, i64 0, i32 3, i32 0, i32 0
  store i32 4, i32* %451, align 4, !tbaa !28
  %452 = getelementptr inbounds %struct.VExp* %445, i64 0, i32 3, i32 0, i32 1
  store i32 0, i32* %452, align 4, !tbaa !26
  br label %718

; <label>:453                                     ; preds = %431
  %454 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([8 x i8]* @.str53, i64 0, i64 0)) #7
  %455 = icmp eq i32 %454, 0
  br i1 %455, label %456, label %509

; <label>:456                                     ; preds = %453
  %457 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %458 = icmp eq %struct.VExp* %457, null
  br i1 %458, label %459, label %newVExpSyscall0.exit372

; <label>:459                                     ; preds = %456
  %460 = tail call noalias i8* @malloc(i64 56000) #7
  %461 = bitcast i8* %460 to %struct.VExp*
  br label %462

; <label>:462                                     ; preds = %462, %459
  %indvars.iv.i.i366 = phi i64 [ 0, %459 ], [ %indvars.iv.next.i.i367, %462 ]
  %463 = phi %struct.VExp* [ null, %459 ], [ %464, %462 ]
  %464 = getelementptr inbounds %struct.VExp* %461, i64 %indvars.iv.i.i366
  %465 = getelementptr inbounds %struct.VExp* %461, i64 %indvars.iv.i.i366, i32 3
  %466 = bitcast %union.anon.1* %465 to %struct.VExp**
  store %struct.VExp* %463, %struct.VExp** %466, align 8, !tbaa !1
  %indvars.iv.next.i.i367 = add nuw nsw i64 %indvars.iv.i.i366, 1
  %exitcond.i.i368 = icmp eq i64 %indvars.iv.next.i.i367, 1000
  br i1 %exitcond.i.i368, label %.loopexit.i.i371, label %462

.loopexit.i.i371:                                 ; preds = %462
  %scevgep.i.i369 = getelementptr i8* %460, i64 55944
  %scevgep3.i.i370 = bitcast i8* %scevgep.i.i369 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i370, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit372

newVExpSyscall0.exit372:                          ; preds = %456, %.loopexit.i.i371
  %467 = phi %struct.VExp* [ %scevgep3.i.i370, %.loopexit.i.i371 ], [ %457, %456 ]
  %468 = getelementptr inbounds %struct.VExp* %467, i64 0, i32 4
  store i32 1, i32* %468, align 4, !tbaa !23
  %469 = getelementptr inbounds %struct.VExp* %467, i64 0, i32 3
  %470 = bitcast %union.anon.1* %469 to %struct.VExp**
  %471 = load %struct.VExp** %470, align 8, !tbaa !1
  store %struct.VExp* %471, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %472 = getelementptr inbounds %struct.VExp* %467, i64 0, i32 0
  store i32 5, i32* %472, align 4, !tbaa !25
  %473 = getelementptr inbounds %struct.VExp* %467, i64 0, i32 3, i32 0, i32 0
  store i32 3, i32* %473, align 4, !tbaa !28
  %474 = getelementptr inbounds %struct.VExp* %467, i64 0, i32 3, i32 0, i32 1
  store i32 0, i32* %474, align 4, !tbaa !26
  %475 = icmp eq %struct.VExp* %471, null
  br i1 %475, label %476, label %makeInt.exit379

; <label>:476                                     ; preds = %newVExpSyscall0.exit372
  %477 = tail call noalias i8* @malloc(i64 56000) #7
  %478 = bitcast i8* %477 to %struct.VExp*
  br label %479

; <label>:479                                     ; preds = %479, %476
  %indvars.iv.i.i.i373 = phi i64 [ 0, %476 ], [ %indvars.iv.next.i.i.i374, %479 ]
  %480 = phi %struct.VExp* [ null, %476 ], [ %481, %479 ]
  %481 = getelementptr inbounds %struct.VExp* %478, i64 %indvars.iv.i.i.i373
  %482 = getelementptr inbounds %struct.VExp* %478, i64 %indvars.iv.i.i.i373, i32 3
  %483 = bitcast %union.anon.1* %482 to %struct.VExp**
  store %struct.VExp* %480, %struct.VExp** %483, align 8, !tbaa !1
  %indvars.iv.next.i.i.i374 = add nuw nsw i64 %indvars.iv.i.i.i373, 1
  %exitcond.i.i.i375 = icmp eq i64 %indvars.iv.next.i.i.i374, 1000
  br i1 %exitcond.i.i.i375, label %.loopexit.i.i.i378, label %479

.loopexit.i.i.i378:                               ; preds = %479
  %scevgep.i.i.i376 = getelementptr i8* %477, i64 55944
  %scevgep3.i.i.i377 = bitcast i8* %scevgep.i.i.i376 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i.i377, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %makeInt.exit379

makeInt.exit379:                                  ; preds = %newVExpSyscall0.exit372, %.loopexit.i.i.i378
  %484 = phi %struct.VExp* [ %scevgep3.i.i.i377, %.loopexit.i.i.i378 ], [ %471, %newVExpSyscall0.exit372 ]
  %485 = getelementptr inbounds %struct.VExp* %484, i64 0, i32 4
  store i32 1, i32* %485, align 4, !tbaa !23
  %486 = getelementptr inbounds %struct.VExp* %484, i64 0, i32 3
  %487 = bitcast %union.anon.1* %486 to %struct.VExp**
  %488 = load %struct.VExp** %487, align 8, !tbaa !1
  store %struct.VExp* %488, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %489 = getelementptr inbounds %struct.VExp* %484, i64 0, i32 0
  store i32 0, i32* %489, align 4, !tbaa !25
  %490 = getelementptr inbounds %struct.VExp* %484, i64 0, i32 3, i32 0, i32 0
  store i32 0, i32* %490, align 8
  %491 = getelementptr inbounds %struct.VExp* %484, i64 0, i32 3, i32 0, i32 2, i32 0
  store %struct.IntList* null, %struct.IntList** %491, align 8
  %492 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %493 = icmp eq %struct.VExp* %492, null
  br i1 %493, label %494, label %newVExpApply.exit387

; <label>:494                                     ; preds = %makeInt.exit379
  %495 = tail call noalias i8* @malloc(i64 56000) #7
  %496 = bitcast i8* %495 to %struct.VExp*
  br label %497

; <label>:497                                     ; preds = %497, %494
  %indvars.iv.i.i380 = phi i64 [ 0, %494 ], [ %indvars.iv.next.i.i381, %497 ]
  %498 = phi %struct.VExp* [ null, %494 ], [ %499, %497 ]
  %499 = getelementptr inbounds %struct.VExp* %496, i64 %indvars.iv.i.i380
  %500 = getelementptr inbounds %struct.VExp* %496, i64 %indvars.iv.i.i380, i32 3
  %501 = bitcast %union.anon.1* %500 to %struct.VExp**
  store %struct.VExp* %498, %struct.VExp** %501, align 8, !tbaa !1
  %indvars.iv.next.i.i381 = add nuw nsw i64 %indvars.iv.i.i380, 1
  %exitcond.i.i382 = icmp eq i64 %indvars.iv.next.i.i381, 1000
  br i1 %exitcond.i.i382, label %.loopexit.i.i385, label %497

.loopexit.i.i385:                                 ; preds = %497
  %scevgep.i.i383 = getelementptr i8* %495, i64 55944
  %scevgep3.i.i384 = bitcast i8* %scevgep.i.i383 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i384, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpApply.exit387

newVExpApply.exit387:                             ; preds = %makeInt.exit379, %.loopexit.i.i385
  %502 = phi %struct.VExp* [ %scevgep3.i.i384, %.loopexit.i.i385 ], [ %492, %makeInt.exit379 ]
  %503 = getelementptr inbounds %struct.VExp* %502, i64 0, i32 4
  store i32 1, i32* %503, align 4, !tbaa !23
  %504 = getelementptr inbounds %struct.VExp* %502, i64 0, i32 3
  %505 = bitcast %union.anon.1* %504 to %struct.VExp**
  %506 = load %struct.VExp** %505, align 8, !tbaa !1
  store %struct.VExp* %506, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %507 = getelementptr inbounds %struct.VExp* %502, i64 0, i32 0
  store i32 8, i32* %507, align 4, !tbaa !25
  store %struct.VExp* %467, %struct.VExp** %505, align 8, !tbaa !18
  %508 = getelementptr inbounds %struct.VExp* %502, i64 0, i32 3, i32 0, i32 2, i32 0
  %ap_x.c.i386 = bitcast %struct.VExp* %484 to %struct.IntList*
  store %struct.IntList* %ap_x.c.i386, %struct.IntList** %508, align 8, !tbaa !20
  br label %718

; <label>:509                                     ; preds = %453
  %510 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([9 x i8]* @.str19, i64 0, i64 0)) #7
  %511 = icmp eq i32 %510, 0
  br i1 %511, label %512, label %531

; <label>:512                                     ; preds = %509
  %513 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %514 = icmp eq %struct.VExp* %513, null
  br i1 %514, label %515, label %newVExpSyscall0.exit394

; <label>:515                                     ; preds = %512
  %516 = tail call noalias i8* @malloc(i64 56000) #7
  %517 = bitcast i8* %516 to %struct.VExp*
  br label %518

; <label>:518                                     ; preds = %518, %515
  %indvars.iv.i.i388 = phi i64 [ 0, %515 ], [ %indvars.iv.next.i.i389, %518 ]
  %519 = phi %struct.VExp* [ null, %515 ], [ %520, %518 ]
  %520 = getelementptr inbounds %struct.VExp* %517, i64 %indvars.iv.i.i388
  %521 = getelementptr inbounds %struct.VExp* %517, i64 %indvars.iv.i.i388, i32 3
  %522 = bitcast %union.anon.1* %521 to %struct.VExp**
  store %struct.VExp* %519, %struct.VExp** %522, align 8, !tbaa !1
  %indvars.iv.next.i.i389 = add nuw nsw i64 %indvars.iv.i.i388, 1
  %exitcond.i.i390 = icmp eq i64 %indvars.iv.next.i.i389, 1000
  br i1 %exitcond.i.i390, label %.loopexit.i.i393, label %518

.loopexit.i.i393:                                 ; preds = %518
  %scevgep.i.i391 = getelementptr i8* %516, i64 55944
  %scevgep3.i.i392 = bitcast i8* %scevgep.i.i391 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i392, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit394

newVExpSyscall0.exit394:                          ; preds = %512, %.loopexit.i.i393
  %523 = phi %struct.VExp* [ %scevgep3.i.i392, %.loopexit.i.i393 ], [ %513, %512 ]
  %524 = getelementptr inbounds %struct.VExp* %523, i64 0, i32 4
  store i32 1, i32* %524, align 4, !tbaa !23
  %525 = getelementptr inbounds %struct.VExp* %523, i64 0, i32 3
  %526 = bitcast %union.anon.1* %525 to %struct.VExp**
  %527 = load %struct.VExp** %526, align 8, !tbaa !1
  store %struct.VExp* %527, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %528 = getelementptr inbounds %struct.VExp* %523, i64 0, i32 0
  store i32 5, i32* %528, align 4, !tbaa !25
  %529 = getelementptr inbounds %struct.VExp* %523, i64 0, i32 3, i32 0, i32 0
  store i32 3, i32* %529, align 4, !tbaa !28
  %530 = getelementptr inbounds %struct.VExp* %523, i64 0, i32 3, i32 0, i32 1
  store i32 0, i32* %530, align 4, !tbaa !26
  br label %718

; <label>:531                                     ; preds = %509
  %532 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([9 x i8]* @.str54, i64 0, i64 0)) #7
  %533 = icmp eq i32 %532, 0
  br i1 %533, label %534, label %587

; <label>:534                                     ; preds = %531
  %535 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %536 = icmp eq %struct.VExp* %535, null
  br i1 %536, label %537, label %newVExpSyscall0.exit401

; <label>:537                                     ; preds = %534
  %538 = tail call noalias i8* @malloc(i64 56000) #7
  %539 = bitcast i8* %538 to %struct.VExp*
  br label %540

; <label>:540                                     ; preds = %540, %537
  %indvars.iv.i.i395 = phi i64 [ 0, %537 ], [ %indvars.iv.next.i.i396, %540 ]
  %541 = phi %struct.VExp* [ null, %537 ], [ %542, %540 ]
  %542 = getelementptr inbounds %struct.VExp* %539, i64 %indvars.iv.i.i395
  %543 = getelementptr inbounds %struct.VExp* %539, i64 %indvars.iv.i.i395, i32 3
  %544 = bitcast %union.anon.1* %543 to %struct.VExp**
  store %struct.VExp* %541, %struct.VExp** %544, align 8, !tbaa !1
  %indvars.iv.next.i.i396 = add nuw nsw i64 %indvars.iv.i.i395, 1
  %exitcond.i.i397 = icmp eq i64 %indvars.iv.next.i.i396, 1000
  br i1 %exitcond.i.i397, label %.loopexit.i.i400, label %540

.loopexit.i.i400:                                 ; preds = %540
  %scevgep.i.i398 = getelementptr i8* %538, i64 55944
  %scevgep3.i.i399 = bitcast i8* %scevgep.i.i398 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i399, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit401

newVExpSyscall0.exit401:                          ; preds = %534, %.loopexit.i.i400
  %545 = phi %struct.VExp* [ %scevgep3.i.i399, %.loopexit.i.i400 ], [ %535, %534 ]
  %546 = getelementptr inbounds %struct.VExp* %545, i64 0, i32 4
  store i32 1, i32* %546, align 4, !tbaa !23
  %547 = getelementptr inbounds %struct.VExp* %545, i64 0, i32 3
  %548 = bitcast %union.anon.1* %547 to %struct.VExp**
  %549 = load %struct.VExp** %548, align 8, !tbaa !1
  store %struct.VExp* %549, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %550 = getelementptr inbounds %struct.VExp* %545, i64 0, i32 0
  store i32 5, i32* %550, align 4, !tbaa !25
  %551 = getelementptr inbounds %struct.VExp* %545, i64 0, i32 3, i32 0, i32 0
  store i32 5, i32* %551, align 4, !tbaa !28
  %552 = getelementptr inbounds %struct.VExp* %545, i64 0, i32 3, i32 0, i32 1
  store i32 0, i32* %552, align 4, !tbaa !26
  %553 = icmp eq %struct.VExp* %549, null
  br i1 %553, label %554, label %makeInt.exit408

; <label>:554                                     ; preds = %newVExpSyscall0.exit401
  %555 = tail call noalias i8* @malloc(i64 56000) #7
  %556 = bitcast i8* %555 to %struct.VExp*
  br label %557

; <label>:557                                     ; preds = %557, %554
  %indvars.iv.i.i.i402 = phi i64 [ 0, %554 ], [ %indvars.iv.next.i.i.i403, %557 ]
  %558 = phi %struct.VExp* [ null, %554 ], [ %559, %557 ]
  %559 = getelementptr inbounds %struct.VExp* %556, i64 %indvars.iv.i.i.i402
  %560 = getelementptr inbounds %struct.VExp* %556, i64 %indvars.iv.i.i.i402, i32 3
  %561 = bitcast %union.anon.1* %560 to %struct.VExp**
  store %struct.VExp* %558, %struct.VExp** %561, align 8, !tbaa !1
  %indvars.iv.next.i.i.i403 = add nuw nsw i64 %indvars.iv.i.i.i402, 1
  %exitcond.i.i.i404 = icmp eq i64 %indvars.iv.next.i.i.i403, 1000
  br i1 %exitcond.i.i.i404, label %.loopexit.i.i.i407, label %557

.loopexit.i.i.i407:                               ; preds = %557
  %scevgep.i.i.i405 = getelementptr i8* %555, i64 55944
  %scevgep3.i.i.i406 = bitcast i8* %scevgep.i.i.i405 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i.i406, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %makeInt.exit408

makeInt.exit408:                                  ; preds = %newVExpSyscall0.exit401, %.loopexit.i.i.i407
  %562 = phi %struct.VExp* [ %scevgep3.i.i.i406, %.loopexit.i.i.i407 ], [ %549, %newVExpSyscall0.exit401 ]
  %563 = getelementptr inbounds %struct.VExp* %562, i64 0, i32 4
  store i32 1, i32* %563, align 4, !tbaa !23
  %564 = getelementptr inbounds %struct.VExp* %562, i64 0, i32 3
  %565 = bitcast %union.anon.1* %564 to %struct.VExp**
  %566 = load %struct.VExp** %565, align 8, !tbaa !1
  store %struct.VExp* %566, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %567 = getelementptr inbounds %struct.VExp* %562, i64 0, i32 0
  store i32 0, i32* %567, align 4, !tbaa !25
  %568 = getelementptr inbounds %struct.VExp* %562, i64 0, i32 3, i32 0, i32 0
  store i32 0, i32* %568, align 8
  %569 = getelementptr inbounds %struct.VExp* %562, i64 0, i32 3, i32 0, i32 2, i32 0
  store %struct.IntList* null, %struct.IntList** %569, align 8
  %570 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %571 = icmp eq %struct.VExp* %570, null
  br i1 %571, label %572, label %newVExpApply.exit416

; <label>:572                                     ; preds = %makeInt.exit408
  %573 = tail call noalias i8* @malloc(i64 56000) #7
  %574 = bitcast i8* %573 to %struct.VExp*
  br label %575

; <label>:575                                     ; preds = %575, %572
  %indvars.iv.i.i409 = phi i64 [ 0, %572 ], [ %indvars.iv.next.i.i410, %575 ]
  %576 = phi %struct.VExp* [ null, %572 ], [ %577, %575 ]
  %577 = getelementptr inbounds %struct.VExp* %574, i64 %indvars.iv.i.i409
  %578 = getelementptr inbounds %struct.VExp* %574, i64 %indvars.iv.i.i409, i32 3
  %579 = bitcast %union.anon.1* %578 to %struct.VExp**
  store %struct.VExp* %576, %struct.VExp** %579, align 8, !tbaa !1
  %indvars.iv.next.i.i410 = add nuw nsw i64 %indvars.iv.i.i409, 1
  %exitcond.i.i411 = icmp eq i64 %indvars.iv.next.i.i410, 1000
  br i1 %exitcond.i.i411, label %.loopexit.i.i414, label %575

.loopexit.i.i414:                                 ; preds = %575
  %scevgep.i.i412 = getelementptr i8* %573, i64 55944
  %scevgep3.i.i413 = bitcast i8* %scevgep.i.i412 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i413, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpApply.exit416

newVExpApply.exit416:                             ; preds = %makeInt.exit408, %.loopexit.i.i414
  %580 = phi %struct.VExp* [ %scevgep3.i.i413, %.loopexit.i.i414 ], [ %570, %makeInt.exit408 ]
  %581 = getelementptr inbounds %struct.VExp* %580, i64 0, i32 4
  store i32 1, i32* %581, align 4, !tbaa !23
  %582 = getelementptr inbounds %struct.VExp* %580, i64 0, i32 3
  %583 = bitcast %union.anon.1* %582 to %struct.VExp**
  %584 = load %struct.VExp** %583, align 8, !tbaa !1
  store %struct.VExp* %584, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %585 = getelementptr inbounds %struct.VExp* %580, i64 0, i32 0
  store i32 8, i32* %585, align 4, !tbaa !25
  store %struct.VExp* %545, %struct.VExp** %583, align 8, !tbaa !18
  %586 = getelementptr inbounds %struct.VExp* %580, i64 0, i32 3, i32 0, i32 2, i32 0
  %ap_x.c.i415 = bitcast %struct.VExp* %562 to %struct.IntList*
  store %struct.IntList* %ap_x.c.i415, %struct.IntList** %586, align 8, !tbaa !20
  br label %718

; <label>:587                                     ; preds = %531
  %588 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([10 x i8]* @.str21, i64 0, i64 0)) #7
  %589 = icmp eq i32 %588, 0
  br i1 %589, label %590, label %609

; <label>:590                                     ; preds = %587
  %591 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %592 = icmp eq %struct.VExp* %591, null
  br i1 %592, label %593, label %newVExpSyscall0.exit423

; <label>:593                                     ; preds = %590
  %594 = tail call noalias i8* @malloc(i64 56000) #7
  %595 = bitcast i8* %594 to %struct.VExp*
  br label %596

; <label>:596                                     ; preds = %596, %593
  %indvars.iv.i.i417 = phi i64 [ 0, %593 ], [ %indvars.iv.next.i.i418, %596 ]
  %597 = phi %struct.VExp* [ null, %593 ], [ %598, %596 ]
  %598 = getelementptr inbounds %struct.VExp* %595, i64 %indvars.iv.i.i417
  %599 = getelementptr inbounds %struct.VExp* %595, i64 %indvars.iv.i.i417, i32 3
  %600 = bitcast %union.anon.1* %599 to %struct.VExp**
  store %struct.VExp* %597, %struct.VExp** %600, align 8, !tbaa !1
  %indvars.iv.next.i.i418 = add nuw nsw i64 %indvars.iv.i.i417, 1
  %exitcond.i.i419 = icmp eq i64 %indvars.iv.next.i.i418, 1000
  br i1 %exitcond.i.i419, label %.loopexit.i.i422, label %596

.loopexit.i.i422:                                 ; preds = %596
  %scevgep.i.i420 = getelementptr i8* %594, i64 55944
  %scevgep3.i.i421 = bitcast i8* %scevgep.i.i420 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i421, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit423

newVExpSyscall0.exit423:                          ; preds = %590, %.loopexit.i.i422
  %601 = phi %struct.VExp* [ %scevgep3.i.i421, %.loopexit.i.i422 ], [ %591, %590 ]
  %602 = getelementptr inbounds %struct.VExp* %601, i64 0, i32 4
  store i32 1, i32* %602, align 4, !tbaa !23
  %603 = getelementptr inbounds %struct.VExp* %601, i64 0, i32 3
  %604 = bitcast %union.anon.1* %603 to %struct.VExp**
  %605 = load %struct.VExp** %604, align 8, !tbaa !1
  store %struct.VExp* %605, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %606 = getelementptr inbounds %struct.VExp* %601, i64 0, i32 0
  store i32 5, i32* %606, align 4, !tbaa !25
  %607 = getelementptr inbounds %struct.VExp* %601, i64 0, i32 3, i32 0, i32 0
  store i32 5, i32* %607, align 4, !tbaa !28
  %608 = getelementptr inbounds %struct.VExp* %601, i64 0, i32 3, i32 0, i32 1
  store i32 0, i32* %608, align 4, !tbaa !26
  br label %718

; <label>:609                                     ; preds = %587
  %610 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([6 x i8]* @.str18, i64 0, i64 0)) #7
  %611 = icmp eq i32 %610, 0
  br i1 %611, label %612, label %631

; <label>:612                                     ; preds = %609
  %613 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %614 = icmp eq %struct.VExp* %613, null
  br i1 %614, label %615, label %newVExpSyscall0.exit430

; <label>:615                                     ; preds = %612
  %616 = tail call noalias i8* @malloc(i64 56000) #7
  %617 = bitcast i8* %616 to %struct.VExp*
  br label %618

; <label>:618                                     ; preds = %618, %615
  %indvars.iv.i.i424 = phi i64 [ 0, %615 ], [ %indvars.iv.next.i.i425, %618 ]
  %619 = phi %struct.VExp* [ null, %615 ], [ %620, %618 ]
  %620 = getelementptr inbounds %struct.VExp* %617, i64 %indvars.iv.i.i424
  %621 = getelementptr inbounds %struct.VExp* %617, i64 %indvars.iv.i.i424, i32 3
  %622 = bitcast %union.anon.1* %621 to %struct.VExp**
  store %struct.VExp* %619, %struct.VExp** %622, align 8, !tbaa !1
  %indvars.iv.next.i.i425 = add nuw nsw i64 %indvars.iv.i.i424, 1
  %exitcond.i.i426 = icmp eq i64 %indvars.iv.next.i.i425, 1000
  br i1 %exitcond.i.i426, label %.loopexit.i.i429, label %618

.loopexit.i.i429:                                 ; preds = %618
  %scevgep.i.i427 = getelementptr i8* %616, i64 55944
  %scevgep3.i.i428 = bitcast i8* %scevgep.i.i427 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i428, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit430

newVExpSyscall0.exit430:                          ; preds = %612, %.loopexit.i.i429
  %623 = phi %struct.VExp* [ %scevgep3.i.i428, %.loopexit.i.i429 ], [ %613, %612 ]
  %624 = getelementptr inbounds %struct.VExp* %623, i64 0, i32 4
  store i32 1, i32* %624, align 4, !tbaa !23
  %625 = getelementptr inbounds %struct.VExp* %623, i64 0, i32 3
  %626 = bitcast %union.anon.1* %625 to %struct.VExp**
  %627 = load %struct.VExp** %626, align 8, !tbaa !1
  store %struct.VExp* %627, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %628 = getelementptr inbounds %struct.VExp* %623, i64 0, i32 0
  store i32 5, i32* %628, align 4, !tbaa !25
  %629 = getelementptr inbounds %struct.VExp* %623, i64 0, i32 3, i32 0, i32 0
  store i32 2, i32* %629, align 4, !tbaa !28
  %630 = getelementptr inbounds %struct.VExp* %623, i64 0, i32 3, i32 0, i32 1
  store i32 0, i32* %630, align 4, !tbaa !26
  br label %718

; <label>:631                                     ; preds = %609
  %632 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([8 x i8]* @.str17, i64 0, i64 0)) #7
  %633 = icmp eq i32 %632, 0
  br i1 %633, label %634, label %653

; <label>:634                                     ; preds = %631
  %635 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %636 = icmp eq %struct.VExp* %635, null
  br i1 %636, label %637, label %newVExpSyscall0.exit437

; <label>:637                                     ; preds = %634
  %638 = tail call noalias i8* @malloc(i64 56000) #7
  %639 = bitcast i8* %638 to %struct.VExp*
  br label %640

; <label>:640                                     ; preds = %640, %637
  %indvars.iv.i.i431 = phi i64 [ 0, %637 ], [ %indvars.iv.next.i.i432, %640 ]
  %641 = phi %struct.VExp* [ null, %637 ], [ %642, %640 ]
  %642 = getelementptr inbounds %struct.VExp* %639, i64 %indvars.iv.i.i431
  %643 = getelementptr inbounds %struct.VExp* %639, i64 %indvars.iv.i.i431, i32 3
  %644 = bitcast %union.anon.1* %643 to %struct.VExp**
  store %struct.VExp* %641, %struct.VExp** %644, align 8, !tbaa !1
  %indvars.iv.next.i.i432 = add nuw nsw i64 %indvars.iv.i.i431, 1
  %exitcond.i.i433 = icmp eq i64 %indvars.iv.next.i.i432, 1000
  br i1 %exitcond.i.i433, label %.loopexit.i.i436, label %640

.loopexit.i.i436:                                 ; preds = %640
  %scevgep.i.i434 = getelementptr i8* %638, i64 55944
  %scevgep3.i.i435 = bitcast i8* %scevgep.i.i434 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i435, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit437

newVExpSyscall0.exit437:                          ; preds = %634, %.loopexit.i.i436
  %645 = phi %struct.VExp* [ %scevgep3.i.i435, %.loopexit.i.i436 ], [ %635, %634 ]
  %646 = getelementptr inbounds %struct.VExp* %645, i64 0, i32 4
  store i32 1, i32* %646, align 4, !tbaa !23
  %647 = getelementptr inbounds %struct.VExp* %645, i64 0, i32 3
  %648 = bitcast %union.anon.1* %647 to %struct.VExp**
  %649 = load %struct.VExp** %648, align 8, !tbaa !1
  store %struct.VExp* %649, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %650 = getelementptr inbounds %struct.VExp* %645, i64 0, i32 0
  store i32 5, i32* %650, align 4, !tbaa !25
  %651 = getelementptr inbounds %struct.VExp* %645, i64 0, i32 3, i32 0, i32 0
  store i32 1, i32* %651, align 4, !tbaa !28
  %652 = getelementptr inbounds %struct.VExp* %645, i64 0, i32 3, i32 0, i32 1
  store i32 0, i32* %652, align 4, !tbaa !26
  br label %718

; <label>:653                                     ; preds = %631
  %654 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([12 x i8]* @.str55, i64 0, i64 0)) #7
  %655 = icmp eq i32 %654, 0
  br i1 %655, label %656, label %674

; <label>:656                                     ; preds = %653
  %657 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %658 = icmp eq %struct.VExp* %657, null
  br i1 %658, label %659, label %newVExpIntList.exit

; <label>:659                                     ; preds = %656
  %660 = tail call noalias i8* @malloc(i64 56000) #7
  %661 = bitcast i8* %660 to %struct.VExp*
  br label %662

; <label>:662                                     ; preds = %662, %659
  %indvars.iv.i.i438 = phi i64 [ 0, %659 ], [ %indvars.iv.next.i.i439, %662 ]
  %663 = phi %struct.VExp* [ null, %659 ], [ %664, %662 ]
  %664 = getelementptr inbounds %struct.VExp* %661, i64 %indvars.iv.i.i438
  %665 = getelementptr inbounds %struct.VExp* %661, i64 %indvars.iv.i.i438, i32 3
  %666 = bitcast %union.anon.1* %665 to %struct.VExp**
  store %struct.VExp* %663, %struct.VExp** %666, align 8, !tbaa !1
  %indvars.iv.next.i.i439 = add nuw nsw i64 %indvars.iv.i.i438, 1
  %exitcond.i.i440 = icmp eq i64 %indvars.iv.next.i.i439, 1000
  br i1 %exitcond.i.i440, label %.loopexit.i.i443, label %662

.loopexit.i.i443:                                 ; preds = %662
  %scevgep.i.i441 = getelementptr i8* %660, i64 55944
  %scevgep3.i.i442 = bitcast i8* %scevgep.i.i441 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i442, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpIntList.exit

newVExpIntList.exit:                              ; preds = %656, %.loopexit.i.i443
  %667 = phi %struct.VExp* [ %scevgep3.i.i442, %.loopexit.i.i443 ], [ %657, %656 ]
  %668 = getelementptr inbounds %struct.VExp* %667, i64 0, i32 4
  store i32 1, i32* %668, align 4, !tbaa !23
  %669 = getelementptr inbounds %struct.VExp* %667, i64 0, i32 3
  %670 = bitcast %union.anon.1* %669 to %struct.VExp**
  %671 = load %struct.VExp** %670, align 8, !tbaa !1
  store %struct.VExp* %671, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %672 = getelementptr inbounds %struct.VExp* %667, i64 0, i32 0
  store i32 4, i32* %672, align 4, !tbaa !25
  %673 = bitcast %union.anon.1* %669 to %struct.IntList**
  store %struct.IntList* null, %struct.IntList** %673, align 8, !tbaa !21
  br label %718

; <label>:674                                     ; preds = %653
  %675 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([7 x i8]* @.str22, i64 0, i64 0)) #7
  %676 = icmp eq i32 %675, 0
  br i1 %676, label %677, label %696

; <label>:677                                     ; preds = %674
  %678 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %679 = icmp eq %struct.VExp* %678, null
  br i1 %679, label %680, label %newVExpSyscall0.exit450

; <label>:680                                     ; preds = %677
  %681 = tail call noalias i8* @malloc(i64 56000) #7
  %682 = bitcast i8* %681 to %struct.VExp*
  br label %683

; <label>:683                                     ; preds = %683, %680
  %indvars.iv.i.i444 = phi i64 [ 0, %680 ], [ %indvars.iv.next.i.i445, %683 ]
  %684 = phi %struct.VExp* [ null, %680 ], [ %685, %683 ]
  %685 = getelementptr inbounds %struct.VExp* %682, i64 %indvars.iv.i.i444
  %686 = getelementptr inbounds %struct.VExp* %682, i64 %indvars.iv.i.i444, i32 3
  %687 = bitcast %union.anon.1* %686 to %struct.VExp**
  store %struct.VExp* %684, %struct.VExp** %687, align 8, !tbaa !1
  %indvars.iv.next.i.i445 = add nuw nsw i64 %indvars.iv.i.i444, 1
  %exitcond.i.i446 = icmp eq i64 %indvars.iv.next.i.i445, 1000
  br i1 %exitcond.i.i446, label %.loopexit.i.i449, label %683

.loopexit.i.i449:                                 ; preds = %683
  %scevgep.i.i447 = getelementptr i8* %681, i64 55944
  %scevgep3.i.i448 = bitcast i8* %scevgep.i.i447 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i448, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit450

newVExpSyscall0.exit450:                          ; preds = %677, %.loopexit.i.i449
  %688 = phi %struct.VExp* [ %scevgep3.i.i448, %.loopexit.i.i449 ], [ %678, %677 ]
  %689 = getelementptr inbounds %struct.VExp* %688, i64 0, i32 4
  store i32 1, i32* %689, align 4, !tbaa !23
  %690 = getelementptr inbounds %struct.VExp* %688, i64 0, i32 3
  %691 = bitcast %union.anon.1* %690 to %struct.VExp**
  %692 = load %struct.VExp** %691, align 8, !tbaa !1
  store %struct.VExp* %692, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %693 = getelementptr inbounds %struct.VExp* %688, i64 0, i32 0
  store i32 5, i32* %693, align 4, !tbaa !25
  %694 = getelementptr inbounds %struct.VExp* %688, i64 0, i32 3, i32 0, i32 0
  store i32 6, i32* %694, align 4, !tbaa !28
  %695 = getelementptr inbounds %struct.VExp* %688, i64 0, i32 3, i32 0, i32 1
  store i32 0, i32* %695, align 4, !tbaa !26
  br label %718

; <label>:696                                     ; preds = %674
  %697 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([10 x i8]* @.str23, i64 0, i64 0)) #7
  %698 = icmp eq i32 %697, 0
  br i1 %698, label %699, label %718

; <label>:699                                     ; preds = %696
  %700 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %701 = icmp eq %struct.VExp* %700, null
  br i1 %701, label %702, label %newVExpSyscall0.exit457

; <label>:702                                     ; preds = %699
  %703 = tail call noalias i8* @malloc(i64 56000) #7
  %704 = bitcast i8* %703 to %struct.VExp*
  br label %705

; <label>:705                                     ; preds = %705, %702
  %indvars.iv.i.i451 = phi i64 [ 0, %702 ], [ %indvars.iv.next.i.i452, %705 ]
  %706 = phi %struct.VExp* [ null, %702 ], [ %707, %705 ]
  %707 = getelementptr inbounds %struct.VExp* %704, i64 %indvars.iv.i.i451
  %708 = getelementptr inbounds %struct.VExp* %704, i64 %indvars.iv.i.i451, i32 3
  %709 = bitcast %union.anon.1* %708 to %struct.VExp**
  store %struct.VExp* %706, %struct.VExp** %709, align 8, !tbaa !1
  %indvars.iv.next.i.i452 = add nuw nsw i64 %indvars.iv.i.i451, 1
  %exitcond.i.i453 = icmp eq i64 %indvars.iv.next.i.i452, 1000
  br i1 %exitcond.i.i453, label %.loopexit.i.i456, label %705

.loopexit.i.i456:                                 ; preds = %705
  %scevgep.i.i454 = getelementptr i8* %703, i64 55944
  %scevgep3.i.i455 = bitcast i8* %scevgep.i.i454 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i455, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit457

newVExpSyscall0.exit457:                          ; preds = %699, %.loopexit.i.i456
  %710 = phi %struct.VExp* [ %scevgep3.i.i455, %.loopexit.i.i456 ], [ %700, %699 ]
  %711 = getelementptr inbounds %struct.VExp* %710, i64 0, i32 4
  store i32 1, i32* %711, align 4, !tbaa !23
  %712 = getelementptr inbounds %struct.VExp* %710, i64 0, i32 3
  %713 = bitcast %union.anon.1* %712 to %struct.VExp**
  %714 = load %struct.VExp** %713, align 8, !tbaa !1
  store %struct.VExp* %714, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %715 = getelementptr inbounds %struct.VExp* %710, i64 0, i32 0
  store i32 5, i32* %715, align 4, !tbaa !25
  %716 = getelementptr inbounds %struct.VExp* %710, i64 0, i32 3, i32 0, i32 0
  store i32 7, i32* %716, align 4, !tbaa !28
  %717 = getelementptr inbounds %struct.VExp* %710, i64 0, i32 3, i32 0, i32 1
  store i32 0, i32* %717, align 4, !tbaa !26
  br label %718

; <label>:718                                     ; preds = %696, %newVExpSyscall0.exit457, %newVExpSyscall0.exit450, %newVExpIntList.exit, %newVExpSyscall0.exit437, %newVExpSyscall0.exit430, %newVExpSyscall0.exit423, %newVExpApply.exit416, %newVExpSyscall0.exit394, %newVExpApply.exit387, %newVExpSyscall0.exit365, %newVExpApply.exit, %newVExpSyscall0.exit, %newVExpNumfunc.exit339, %newVExpNumfunc.exit332, %newVExpNumfunc.exit325, %newVExpNumfunc.exit318, %newVExpNumfunc.exit311, %newVExpNumfunc.exit304, %newVExpNumfunc.exit297, %newVExpNumfunc.exit290, %newVExpNumfunc.exit283, %newVExpNumfunc.exit276, %newVExpNumfunc.exit269, %newVExpNumfunc.exit262, %newVExpNumfunc.exit
  %.0 = phi %struct.VExp* [ %22, %newVExpNumfunc.exit ], [ %49, %newVExpNumfunc.exit262 ], [ %76, %newVExpNumfunc.exit269 ], [ %103, %newVExpNumfunc.exit276 ], [ %130, %newVExpNumfunc.exit283 ], [ %157, %newVExpNumfunc.exit290 ], [ %190, %newVExpNumfunc.exit297 ], [ %215, %newVExpNumfunc.exit304 ], [ %246, %newVExpNumfunc.exit311 ], [ %277, %newVExpNumfunc.exit318 ], [ %304, %newVExpNumfunc.exit325 ], [ %325, %newVExpNumfunc.exit332 ], [ %346, %newVExpNumfunc.exit339 ], [ %367, %newVExpSyscall0.exit ], [ %424, %newVExpApply.exit ], [ %445, %newVExpSyscall0.exit365 ], [ %502, %newVExpApply.exit387 ], [ %523, %newVExpSyscall0.exit394 ], [ %580, %newVExpApply.exit416 ], [ %601, %newVExpSyscall0.exit423 ], [ %623, %newVExpSyscall0.exit430 ], [ %645, %newVExpSyscall0.exit437 ], [ %667, %newVExpIntList.exit ], [ %688, %newVExpSyscall0.exit450 ], [ %710, %newVExpSyscall0.exit457 ], [ null, %696 ]
  ret %struct.VExp* %.0
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) #6

; Function Attrs: nounwind uwtable
define i32 @executeVExp(%struct.VExp* %exp, i32 %argc, i8** nocapture readonly %argv) #1 {
  %1 = load %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %2 = icmp eq %struct.Value* %1, null
  br i1 %2, label %3, label %newRunningValue.exit

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
  br label %newRunningValue.exit

newRunningValue.exit:                             ; preds = %0, %.loopexit.i.i
  %10 = phi %struct.Value* [ %scevgep4.i.i, %.loopexit.i.i ], [ %1, %0 ]
  %11 = getelementptr inbounds %struct.Value* %10, i64 0, i32 2
  store i32 1, i32* %11, align 4, !tbaa !31
  %12 = getelementptr inbounds %struct.Value* %10, i64 0, i32 1
  %13 = bitcast %union.anon.0* %12 to %struct.Value**
  %14 = load %struct.Value** %13, align 8, !tbaa !1
  store %struct.Value* %14, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %15 = getelementptr inbounds %struct.Value* %10, i64 0, i32 0
  store i32 2, i32* %15, align 4, !tbaa !33
  %16 = getelementptr inbounds %struct.Value* %10, i64 0, i32 1, i32 0, i32 0
  %17 = getelementptr inbounds %struct.Value* %10, i64 0, i32 1, i32 0, i32 2
  %18 = bitcast %struct.VExp** %16 to i8*
  call void @llvm.memset.p0i8.i64(i8* %18, i8 0, i64 24, i32 8, i1 false)
  %19 = load %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  %20 = icmp eq %struct.Continuation* %19, null
  br i1 %20, label %21, label %pushEvalContinuation.exit

; <label>:21                                      ; preds = %newRunningValue.exit
  %22 = tail call noalias i8* @malloc(i64 32000) #7
  %23 = bitcast i8* %22 to %struct.Continuation*
  br label %24

; <label>:24                                      ; preds = %24, %21
  %indvars.iv.i.i1 = phi i64 [ 0, %21 ], [ %indvars.iv.next.i.i2, %24 ]
  %25 = phi %struct.Continuation* [ null, %21 ], [ %26, %24 ]
  %26 = getelementptr inbounds %struct.Continuation* %23, i64 %indvars.iv.i.i1
  %27 = getelementptr inbounds %struct.Continuation* %23, i64 %indvars.iv.i.i1, i32 2
  store %struct.Continuation* %25, %struct.Continuation** %27, align 8, !tbaa !15
  %indvars.iv.next.i.i2 = add nuw nsw i64 %indvars.iv.i.i1, 1
  %exitcond.i.i3 = icmp eq i64 %indvars.iv.next.i.i2, 1000
  br i1 %exitcond.i.i3, label %.loopexit.i.i5, label %24

.loopexit.i.i5:                                   ; preds = %24
  %scevgep.i.i4 = getelementptr i8* %22, i64 31968
  %scevgep3.i.i = bitcast i8* %scevgep.i.i4 to %struct.Continuation*
  store %struct.Continuation* %scevgep3.i.i, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  br label %pushEvalContinuation.exit

pushEvalContinuation.exit:                        ; preds = %newRunningValue.exit, %.loopexit.i.i5
  %28 = phi %struct.Continuation* [ %scevgep3.i.i, %.loopexit.i.i5 ], [ %19, %newRunningValue.exit ]
  %29 = getelementptr inbounds %struct.Continuation* %28, i64 0, i32 2
  %30 = load %struct.Continuation** %29, align 8, !tbaa !15
  store %struct.Continuation* %30, %struct.Continuation** @allocateContinuation.pool, align 8, !tbaa !1
  %31 = getelementptr inbounds %struct.Continuation* %28, i64 0, i32 0
  store i32 0, i32* %31, align 4, !tbaa !17
  %32 = getelementptr inbounds %struct.Continuation* %28, i64 0, i32 1, i32 0, i32 0
  store %struct.VExp* %exp, %struct.VExp** %32, align 8, !tbaa !18
  %33 = getelementptr inbounds %struct.Continuation* %28, i64 0, i32 1, i32 0, i32 1
  store %struct.VContext* null, %struct.VContext** %33, align 8, !tbaa !20
  %34 = load %struct.Continuation** %17, align 8, !tbaa !37
  store %struct.Continuation* %34, %struct.Continuation** %29, align 8, !tbaa !15
  store %struct.Continuation* %28, %struct.Continuation** %17, align 8, !tbaa !37
  %35 = tail call i32 @executeValue(%struct.Value* %10, i32 %argc, i8** %argv)
  ret i32 %35
}

; Function Attrs: nounwind
declare i32 @putchar(i32) #7

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
attributes #8 = { cold nounwind }
attributes #9 = { nounwind readnone }

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
!15 = metadata !{metadata !16, metadata !2, i64 24}
!16 = metadata !{metadata !"Continuation", metadata !3, i64 0, metadata !3, i64 8, metadata !2, i64 24}
!17 = metadata !{metadata !16, metadata !3, i64 0}
!18 = metadata !{metadata !19, metadata !2, i64 0}
!19 = metadata !{metadata !"", metadata !2, i64 0, metadata !2, i64 8}
!20 = metadata !{metadata !19, metadata !2, i64 8}
!21 = metadata !{metadata !22, metadata !2, i64 0}
!22 = metadata !{metadata !"", metadata !2, i64 0}
!23 = metadata !{metadata !24, metadata !7, i64 48}
!24 = metadata !{metadata !"VExp", metadata !3, i64 0, metadata !3, i64 4, metadata !3, i64 8, metadata !3, i64 16, metadata !7, i64 48}
!25 = metadata !{metadata !24, metadata !3, i64 0}
!26 = metadata !{metadata !27, metadata !7, i64 4}
!27 = metadata !{metadata !"", metadata !3, i64 0, metadata !7, i64 4, metadata !3, i64 8, metadata !7, i64 16, metadata !2, i64 24}
!28 = metadata !{metadata !27, metadata !3, i64 0}
!29 = metadata !{metadata !7, metadata !7, i64 0}
!30 = metadata !{metadata !27, metadata !2, i64 24}
!31 = metadata !{metadata !32, metadata !7, i64 32}
!32 = metadata !{metadata !"Value", metadata !3, i64 0, metadata !3, i64 8, metadata !7, i64 32}
!33 = metadata !{metadata !32, metadata !3, i64 0}
!34 = metadata !{metadata !35, metadata !2, i64 0}
!35 = metadata !{metadata !"", metadata !2, i64 0, metadata !2, i64 8, metadata !2, i64 16}
!36 = metadata !{metadata !35, metadata !2, i64 8}
!37 = metadata !{metadata !35, metadata !2, i64 16}
!38 = metadata !{metadata !39, metadata !3, i64 0}
!39 = metadata !{metadata !"", metadata !3, i64 0}
!40 = metadata !{metadata !41, metadata !3, i64 0}
!41 = metadata !{metadata !"", metadata !3, i64 0, metadata !42, i64 8}
!42 = metadata !{metadata !"Number", metadata !3, i64 0, metadata !3, i64 8}
!43 = metadata !{metadata !27, metadata !7, i64 16}
!44 = metadata !{metadata !42, metadata !3, i64 0}
!45 = metadata !{metadata !46, metadata !46, i64 0}
!46 = metadata !{metadata !"long", metadata !3, i64 0}
!47 = metadata !{metadata !48, metadata !48, i64 0}
!48 = metadata !{metadata !"double", metadata !3, i64 0}
!49 = metadata !{metadata !49, metadata !50, metadata !51}
!50 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!51 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!52 = metadata !{metadata !52, metadata !50, metadata !51}
