; ModuleID = 'simpleruntime.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

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
@.str2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str3 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
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
@.str14 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str15 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str16 = private unnamed_addr constant [3 x i8] c"ab\00", align 1
@.str17 = private unnamed_addr constant [4 x i8] c"rwb\00", align 1
@.str29 = private unnamed_addr constant [6 x i8] c"toInt\00", align 1
@.str30 = private unnamed_addr constant [8 x i8] c"toFloat\00", align 1
@.str31 = private unnamed_addr constant [5 x i8] c"exit\00", align 1
@.str32 = private unnamed_addr constant [8 x i8] c"putChar\00", align 1
@.str33 = private unnamed_addr constant [9 x i8] c"putCharF\00", align 1
@.str34 = private unnamed_addr constant [8 x i8] c"getChar\00", align 1
@.str35 = private unnamed_addr constant [9 x i8] c"getCharF\00", align 1
@.str36 = private unnamed_addr constant [9 x i8] c"peekChar\00", align 1
@.str37 = private unnamed_addr constant [10 x i8] c"peekCharF\00", align 1
@.str38 = private unnamed_addr constant [6 x i8] c"close\00", align 1
@.str39 = private unnamed_addr constant [12 x i8] c"makeIntList\00", align 1
@str = private unnamed_addr constant [45 x i8] c"exception: insufficient arguments to syscall\00"
@switch.table = private unnamed_addr constant [4 x i8*] [i8* getelementptr inbounds ([3 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str15, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str16, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8]* @.str17, i64 0, i64 0)]

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
  %14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str2, i64 0, i64 0), i32 %13) #7
  br label %19

; <label>:15                                      ; preds = %4
  %16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0), double %9) #7
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
  br label %854

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds %struct.Continuation* %3, i64 0, i32 0
  %9 = load i32* %8, align 4, !tbaa !42
  switch i32 %9, label %854 [
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
  switch i32 %16, label %854 [
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
  switch i32 %45, label %855 [
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
  br label %854

; <label>:65                                      ; preds = %lookUpRef.exit
  %66 = getelementptr inbounds %struct.Value* %v, i64 0, i32 0
  store i32 1, i32* %66, align 4, !tbaa !30
  %67 = getelementptr inbounds %struct.Value* %43, i64 0, i32 1
  %68 = bitcast %union.anon.0* %67 to i8**
  %69 = load i8** %68, align 8, !tbaa !1
  %70 = getelementptr inbounds %union.anon.0* %1, i64 0, i32 0, i32 0
  %.c39 = bitcast i8* %69 to %struct.VExp*
  store %struct.VExp* %.c39, %struct.VExp** %70, align 8, !tbaa !1
  br label %854

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
  br label %854

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
  switch i32 %133, label %854 [
    i32 0, label %134
    i32 1, label %136
    i32 2, label %164
    i32 3, label %281
    i32 4, label %772
    i32 5, label %840
  ]

; <label>:134                                     ; preds = %124
  %135 = getelementptr inbounds %struct.Value* %v, i64 0, i32 0
  store i32 1, i32* %135, align 4, !tbaa !30
  store %struct.VExp* bitcast ([37 x i8]* @.str8 to %struct.VExp*), %struct.VExp** %125, align 8, !tbaa !1
  br label %854

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
  br label %854

; <label>:164                                     ; preds = %124
  %165 = getelementptr inbounds %struct.Value* %131, i64 0, i32 0
  %166 = load i32* %165, align 4, !tbaa !30
  %switch = icmp ult i32 %166, 2
  br i1 %switch, label %167, label %855

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
  br label %854

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
  br label %854

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
  br i1 %262, label %263, label %newVExpNum.exit119

; <label>:263                                     ; preds = %255
  %264 = tail call noalias i8* @malloc(i64 56000) #7
  %265 = bitcast i8* %264 to %struct.VExp*
  br label %266

; <label>:266                                     ; preds = %266, %263
  %indvars.iv.i.i112 = phi i64 [ 0, %263 ], [ %indvars.iv.next.i.i113, %266 ]
  %267 = phi %struct.VExp* [ null, %263 ], [ %268, %266 ]
  %268 = getelementptr inbounds %struct.VExp* %265, i64 %indvars.iv.i.i112
  %269 = getelementptr inbounds %struct.VExp* %265, i64 %indvars.iv.i.i112, i32 3
  %270 = bitcast %union.anon.1* %269 to %struct.VExp**
  store %struct.VExp* %267, %struct.VExp** %270, align 8, !tbaa !1
  %indvars.iv.next.i.i113 = add nuw nsw i64 %indvars.iv.i.i112, 1
  %exitcond.i.i114 = icmp eq i64 %indvars.iv.next.i.i113, 1000
  br i1 %exitcond.i.i114, label %.loopexit.i.i117, label %266

.loopexit.i.i117:                                 ; preds = %266
  %scevgep.i.i115 = getelementptr i8* %264, i64 55944
  %scevgep3.i.i116 = bitcast i8* %scevgep.i.i115 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i116, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNum.exit119

newVExpNum.exit119:                               ; preds = %255, %.loopexit.i.i117
  %271 = phi %struct.VExp* [ %scevgep3.i.i116, %.loopexit.i.i117 ], [ %261, %255 ]
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
  %num_val.coerce1.c.i118 = inttoptr i64 %260 to %struct.IntList*
  store %struct.IntList* %num_val.coerce1.c.i118, %struct.IntList** %278, align 8
  br label %retainVExp.exit73

retainVExp.exit73:                                ; preds = %219, %217, %212, %newVExpNum.exit94, %retainVExp.exit95, %newVExpNum.exit119, %newVExpNumfunc1.exit
  %nexp.0 = phi %struct.VExp* [ %202, %newVExpNumfunc1.exit ], [ %240, %newVExpNum.exit94 ], [ %176, %retainVExp.exit95 ], [ %271, %newVExpNum.exit119 ], [ null, %212 ], [ null, %217 ], [ %176, %219 ]
  %279 = getelementptr inbounds %struct.Continuation* %3, i64 0, i32 2
  %280 = load %struct.Continuation** %279, align 8, !tbaa !44
  store %struct.VExp* %nexp.0, %struct.VExp** %125, align 8, !tbaa !31
  store %struct.VContext* null, %struct.VContext** %127, align 8, !tbaa !33
  store %struct.Continuation* %280, %struct.Continuation** %2, align 8, !tbaa !34
  br label %854

; <label>:281                                     ; preds = %124
  %282 = getelementptr inbounds %struct.Value* %131, i64 0, i32 0
  %283 = load i32* %282, align 4, !tbaa !30
  %switch40 = icmp ult i32 %283, 2
  br i1 %switch40, label %284, label %855

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
  br label %854

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
  br label %854

; <label>:299                                     ; preds = %291
  %300 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 3, i32 0, i32 0
  %301 = load i32* %300, align 4, !tbaa !37
  switch i32 %301, label %702 [
    i32 0, label %302
    i32 1, label %338
    i32 2, label %374
    i32 3, label %410
    i32 4, label %454
    i32 6, label %498
    i32 5, label %531
    i32 8, label %564
    i32 7, label %597
    i32 9, label %630
    i32 10, label %663
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
  br label %.thread124

; <label>:320                                     ; preds = %316
  %321 = trunc i64 %308 to i32
  %322 = sitofp i32 %321 to double
  %323 = bitcast i64 %313 to double
  %324 = fadd double %322, %323
  %325 = bitcast double %324 to i64
  br label %.thread124

; <label>:326                                     ; preds = %302
  %327 = bitcast i64 %308 to double
  br i1 %315, label %328, label %334

; <label>:328                                     ; preds = %326
  %329 = trunc i64 %313 to i32
  %330 = sitofp i32 %329 to double
  %331 = fadd double %327, %330
  %332 = fptosi double %331 to i32
  %333 = zext i32 %332 to i64
  br label %.thread124

; <label>:334                                     ; preds = %326
  %335 = bitcast i64 %313 to double
  %336 = fadd double %327, %335
  %337 = bitcast double %336 to i64
  br label %.thread124

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
  br label %.thread124

; <label>:356                                     ; preds = %352
  %357 = trunc i64 %344 to i32
  %358 = sitofp i32 %357 to double
  %359 = bitcast i64 %349 to double
  %360 = fsub double %358, %359
  %361 = bitcast double %360 to i64
  br label %.thread124

; <label>:362                                     ; preds = %338
  %363 = bitcast i64 %344 to double
  br i1 %351, label %364, label %370

; <label>:364                                     ; preds = %362
  %365 = trunc i64 %349 to i32
  %366 = sitofp i32 %365 to double
  %367 = fsub double %363, %366
  %368 = fptosi double %367 to i32
  %369 = zext i32 %368 to i64
  br label %.thread124

; <label>:370                                     ; preds = %362
  %371 = bitcast i64 %349 to double
  %372 = fsub double %363, %371
  %373 = bitcast double %372 to i64
  br label %.thread124

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
  br label %.thread124

; <label>:392                                     ; preds = %388
  %393 = trunc i64 %380 to i32
  %394 = sitofp i32 %393 to double
  %395 = bitcast i64 %385 to double
  %396 = fmul double %394, %395
  %397 = bitcast double %396 to i64
  br label %.thread124

; <label>:398                                     ; preds = %374
  %399 = bitcast i64 %380 to double
  br i1 %387, label %400, label %406

; <label>:400                                     ; preds = %398
  %401 = trunc i64 %385 to i32
  %402 = sitofp i32 %401 to double
  %403 = fmul double %399, %402
  %404 = fptosi double %403 to i32
  %405 = zext i32 %404 to i64
  br label %.thread124

; <label>:406                                     ; preds = %398
  %407 = bitcast i64 %385 to double
  %408 = fmul double %399, %407
  %409 = bitcast double %408 to i64
  br label %.thread124

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
  br i1 %427, label %divNumber.exit105, label %428

; <label>:428                                     ; preds = %425
  %429 = trunc i64 %416 to i32
  %430 = sdiv i32 %429, %426
  %phitmp8.i101 = zext i32 %430 to i64
  br label %divNumber.exit105

; <label>:431                                     ; preds = %424
  %432 = trunc i64 %416 to i32
  %433 = sitofp i32 %432 to double
  %434 = bitcast i64 %421 to double
  %435 = fdiv double %433, %434
  %436 = bitcast double %435 to i64
  br label %divNumber.exit105

; <label>:437                                     ; preds = %410
  br i1 %423, label %438, label %446

; <label>:438                                     ; preds = %437
  %439 = trunc i64 %421 to i32
  %440 = icmp eq i32 %439, 0
  br i1 %440, label %divNumber.exit105, label %441

; <label>:441                                     ; preds = %438
  %442 = bitcast i64 %416 to double
  %443 = sitofp i32 %439 to double
  %444 = fdiv double %442, %443
  %445 = fptosi double %444 to i32
  %phitmp.i102 = zext i32 %445 to i64
  br label %divNumber.exit105

; <label>:446                                     ; preds = %437
  %447 = bitcast i64 %416 to double
  %448 = bitcast i64 %421 to double
  %449 = fdiv double %447, %448
  %450 = bitcast double %449 to i64
  br label %divNumber.exit105

divNumber.exit105:                                ; preds = %438, %425, %428, %431, %441, %446
  %451 = phi i8* [ null, %431 ], [ null, %446 ], [ null, %428 ], [ null, %441 ], [ getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), %425 ], [ getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), %438 ]
  %.sroa.0.0.i103 = phi i32 [ 1, %431 ], [ 1, %446 ], [ 0, %428 ], [ 1, %441 ], [ 0, %425 ], [ 1, %438 ]
  %.sroa.9.0.i104 = phi i64 [ %436, %431 ], [ %450, %446 ], [ %phitmp8.i101, %428 ], [ %phitmp.i102, %441 ], [ 0, %425 ], [ 0, %438 ]
  %452 = insertvalue { i32, i64 } undef, i32 %.sroa.0.0.i103, 0
  %453 = insertvalue { i32, i64 } %452, i64 %.sroa.9.0.i104, 1
  br label %696

; <label>:454                                     ; preds = %299
  %455 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 3, i32 0, i32 2
  %456 = bitcast %union.SyscallArg* %455 to i32*
  %457 = load i32* %456, align 1
  %458 = getelementptr %union.SyscallArg* %455, i64 1
  %459 = bitcast %union.SyscallArg* %458 to i64*
  %460 = load i64* %459, align 1
  %461 = getelementptr inbounds %struct.VExp* %293, i64 0, i32 3, i32 0, i32 0
  %462 = load i32* %461, align 1
  %463 = getelementptr %struct.VExp* %293, i64 0, i32 3, i32 0, i32 2
  %464 = bitcast %union.SyscallArg* %463 to i64*
  %465 = load i64* %464, align 1
  %466 = icmp eq i32 %457, 0
  %467 = icmp eq i32 %462, 0
  br i1 %466, label %468, label %481

; <label>:468                                     ; preds = %454
  br i1 %467, label %469, label %475

; <label>:469                                     ; preds = %468
  %470 = trunc i64 %465 to i32
  %471 = icmp eq i32 %470, 0
  br i1 %471, label %divNumber.exit, label %472

; <label>:472                                     ; preds = %469
  %473 = trunc i64 %460 to i32
  %474 = sdiv i32 %473, %470
  %phitmp8.i = zext i32 %474 to i64
  br label %divNumber.exit

; <label>:475                                     ; preds = %468
  %476 = trunc i64 %460 to i32
  %477 = sitofp i32 %476 to double
  %478 = bitcast i64 %465 to double
  %479 = fdiv double %477, %478
  %480 = bitcast double %479 to i64
  br label %divNumber.exit

; <label>:481                                     ; preds = %454
  br i1 %467, label %482, label %490

; <label>:482                                     ; preds = %481
  %483 = trunc i64 %465 to i32
  %484 = icmp eq i32 %483, 0
  br i1 %484, label %divNumber.exit, label %485

; <label>:485                                     ; preds = %482
  %486 = bitcast i64 %460 to double
  %487 = sitofp i32 %483 to double
  %488 = fdiv double %486, %487
  %489 = fptosi double %488 to i32
  %phitmp.i = zext i32 %489 to i64
  br label %divNumber.exit

; <label>:490                                     ; preds = %481
  %491 = bitcast i64 %460 to double
  %492 = bitcast i64 %465 to double
  %493 = fdiv double %491, %492
  %494 = bitcast double %493 to i64
  br label %divNumber.exit

divNumber.exit:                                   ; preds = %482, %469, %472, %475, %485, %490
  %495 = phi i8* [ null, %475 ], [ null, %490 ], [ null, %472 ], [ null, %485 ], [ getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), %469 ], [ getelementptr inbounds ([16 x i8]* @.str, i64 0, i64 0), %482 ]
  %.sroa.0.0.i = phi i32 [ 1, %475 ], [ 1, %490 ], [ 0, %472 ], [ 1, %485 ], [ 0, %469 ], [ 1, %482 ]
  %.sroa.9.0.i = phi i64 [ %480, %475 ], [ %494, %490 ], [ %phitmp8.i, %472 ], [ %phitmp.i, %485 ], [ 0, %469 ], [ 0, %482 ]
  %496 = insertvalue { i32, i64 } undef, i32 %.sroa.0.0.i, 0
  %497 = insertvalue { i32, i64 } %496, i64 %.sroa.9.0.i, 1
  br label %696

; <label>:498                                     ; preds = %299
  %499 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 3, i32 0, i32 2
  %500 = bitcast %union.SyscallArg* %499 to i32*
  %501 = load i32* %500, align 1
  %502 = getelementptr %union.SyscallArg* %499, i64 1
  %503 = bitcast %union.SyscallArg* %502 to i64*
  %504 = load i64* %503, align 1
  %505 = getelementptr inbounds %struct.VExp* %293, i64 0, i32 3, i32 0, i32 0
  %506 = load i32* %505, align 1
  %507 = getelementptr %struct.VExp* %293, i64 0, i32 3, i32 0, i32 2
  %508 = bitcast %union.SyscallArg* %507 to i64*
  %509 = load i64* %508, align 1
  %510 = icmp eq i32 %501, 0
  %511 = icmp eq i32 %506, 0
  br i1 %510, label %512, label %521

; <label>:512                                     ; preds = %498
  %513 = trunc i64 %504 to i32
  br i1 %511, label %514, label %517

; <label>:514                                     ; preds = %512
  %515 = trunc i64 %509 to i32
  %516 = icmp slt i32 %513, %515
  br label %leNumber.exit

; <label>:517                                     ; preds = %512
  %518 = sitofp i32 %513 to double
  %519 = bitcast i64 %509 to double
  %520 = fcmp olt double %518, %519
  br label %leNumber.exit

; <label>:521                                     ; preds = %498
  %522 = bitcast i64 %504 to double
  br i1 %511, label %523, label %527

; <label>:523                                     ; preds = %521
  %524 = trunc i64 %509 to i32
  %525 = sitofp i32 %524 to double
  %526 = fcmp olt double %522, %525
  br label %leNumber.exit

; <label>:527                                     ; preds = %521
  %528 = bitcast i64 %509 to double
  %529 = fcmp olt double %522, %528
  br label %leNumber.exit

leNumber.exit:                                    ; preds = %514, %517, %523, %527
  %.0.i100 = phi i1 [ %516, %514 ], [ %520, %517 ], [ %526, %523 ], [ %529, %527 ]
  %530 = zext i1 %.0.i100 to i32
  br label %702

; <label>:531                                     ; preds = %299
  %532 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 3, i32 0, i32 2
  %533 = bitcast %union.SyscallArg* %532 to i32*
  %534 = load i32* %533, align 1
  %535 = getelementptr %union.SyscallArg* %532, i64 1
  %536 = bitcast %union.SyscallArg* %535 to i64*
  %537 = load i64* %536, align 1
  %538 = getelementptr inbounds %struct.VExp* %293, i64 0, i32 3, i32 0, i32 0
  %539 = load i32* %538, align 1
  %540 = getelementptr %struct.VExp* %293, i64 0, i32 3, i32 0, i32 2
  %541 = bitcast %union.SyscallArg* %540 to i64*
  %542 = load i64* %541, align 1
  %543 = icmp eq i32 %534, 0
  %544 = icmp eq i32 %539, 0
  br i1 %543, label %545, label %554

; <label>:545                                     ; preds = %531
  %546 = trunc i64 %537 to i32
  br i1 %544, label %547, label %550

; <label>:547                                     ; preds = %545
  %548 = trunc i64 %542 to i32
  %549 = icmp sgt i32 %546, %548
  br label %geNumber.exit

; <label>:550                                     ; preds = %545
  %551 = sitofp i32 %546 to double
  %552 = bitcast i64 %542 to double
  %553 = fcmp ogt double %551, %552
  br label %geNumber.exit

; <label>:554                                     ; preds = %531
  %555 = bitcast i64 %537 to double
  br i1 %544, label %556, label %560

; <label>:556                                     ; preds = %554
  %557 = trunc i64 %542 to i32
  %558 = sitofp i32 %557 to double
  %559 = fcmp ogt double %555, %558
  br label %geNumber.exit

; <label>:560                                     ; preds = %554
  %561 = bitcast i64 %542 to double
  %562 = fcmp ogt double %555, %561
  br label %geNumber.exit

geNumber.exit:                                    ; preds = %547, %550, %556, %560
  %.0.i99 = phi i1 [ %549, %547 ], [ %553, %550 ], [ %559, %556 ], [ %562, %560 ]
  %563 = zext i1 %.0.i99 to i32
  br label %702

; <label>:564                                     ; preds = %299
  %565 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 3, i32 0, i32 2
  %566 = bitcast %union.SyscallArg* %565 to i32*
  %567 = load i32* %566, align 1
  %568 = getelementptr %union.SyscallArg* %565, i64 1
  %569 = bitcast %union.SyscallArg* %568 to i64*
  %570 = load i64* %569, align 1
  %571 = getelementptr inbounds %struct.VExp* %293, i64 0, i32 3, i32 0, i32 0
  %572 = load i32* %571, align 1
  %573 = getelementptr %struct.VExp* %293, i64 0, i32 3, i32 0, i32 2
  %574 = bitcast %union.SyscallArg* %573 to i64*
  %575 = load i64* %574, align 1
  %576 = icmp eq i32 %567, 0
  %577 = icmp eq i32 %572, 0
  br i1 %576, label %578, label %587

; <label>:578                                     ; preds = %564
  %579 = trunc i64 %570 to i32
  br i1 %577, label %580, label %583

; <label>:580                                     ; preds = %578
  %581 = trunc i64 %575 to i32
  %582 = icmp sge i32 %579, %581
  br label %nleNumber.exit

; <label>:583                                     ; preds = %578
  %584 = sitofp i32 %579 to double
  %585 = bitcast i64 %575 to double
  %586 = fcmp oge double %584, %585
  br label %nleNumber.exit

; <label>:587                                     ; preds = %564
  %588 = bitcast i64 %570 to double
  br i1 %577, label %589, label %593

; <label>:589                                     ; preds = %587
  %590 = trunc i64 %575 to i32
  %591 = sitofp i32 %590 to double
  %592 = fcmp oge double %588, %591
  br label %nleNumber.exit

; <label>:593                                     ; preds = %587
  %594 = bitcast i64 %575 to double
  %595 = fcmp oge double %588, %594
  br label %nleNumber.exit

nleNumber.exit:                                   ; preds = %580, %583, %589, %593
  %.0.i98 = phi i1 [ %582, %580 ], [ %586, %583 ], [ %592, %589 ], [ %595, %593 ]
  %596 = zext i1 %.0.i98 to i32
  br label %702

; <label>:597                                     ; preds = %299
  %598 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 3, i32 0, i32 2
  %599 = bitcast %union.SyscallArg* %598 to i32*
  %600 = load i32* %599, align 1
  %601 = getelementptr %union.SyscallArg* %598, i64 1
  %602 = bitcast %union.SyscallArg* %601 to i64*
  %603 = load i64* %602, align 1
  %604 = getelementptr inbounds %struct.VExp* %293, i64 0, i32 3, i32 0, i32 0
  %605 = load i32* %604, align 1
  %606 = getelementptr %struct.VExp* %293, i64 0, i32 3, i32 0, i32 2
  %607 = bitcast %union.SyscallArg* %606 to i64*
  %608 = load i64* %607, align 1
  %609 = icmp eq i32 %600, 0
  %610 = icmp eq i32 %605, 0
  br i1 %609, label %611, label %620

; <label>:611                                     ; preds = %597
  %612 = trunc i64 %603 to i32
  br i1 %610, label %613, label %616

; <label>:613                                     ; preds = %611
  %614 = trunc i64 %608 to i32
  %615 = icmp sle i32 %612, %614
  br label %ngeNumber.exit

; <label>:616                                     ; preds = %611
  %617 = sitofp i32 %612 to double
  %618 = bitcast i64 %608 to double
  %619 = fcmp ole double %617, %618
  br label %ngeNumber.exit

; <label>:620                                     ; preds = %597
  %621 = bitcast i64 %603 to double
  br i1 %610, label %622, label %626

; <label>:622                                     ; preds = %620
  %623 = trunc i64 %608 to i32
  %624 = sitofp i32 %623 to double
  %625 = fcmp ole double %621, %624
  br label %ngeNumber.exit

; <label>:626                                     ; preds = %620
  %627 = bitcast i64 %608 to double
  %628 = fcmp ole double %621, %627
  br label %ngeNumber.exit

ngeNumber.exit:                                   ; preds = %613, %616, %622, %626
  %.0.i97 = phi i1 [ %615, %613 ], [ %619, %616 ], [ %625, %622 ], [ %628, %626 ]
  %629 = zext i1 %.0.i97 to i32
  br label %702

; <label>:630                                     ; preds = %299
  %631 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 3, i32 0, i32 2
  %632 = bitcast %union.SyscallArg* %631 to i32*
  %633 = load i32* %632, align 1
  %634 = getelementptr %union.SyscallArg* %631, i64 1
  %635 = bitcast %union.SyscallArg* %634 to i64*
  %636 = load i64* %635, align 1
  %637 = getelementptr inbounds %struct.VExp* %293, i64 0, i32 3, i32 0, i32 0
  %638 = load i32* %637, align 1
  %639 = getelementptr %struct.VExp* %293, i64 0, i32 3, i32 0, i32 2
  %640 = bitcast %union.SyscallArg* %639 to i64*
  %641 = load i64* %640, align 1
  %642 = icmp eq i32 %633, 0
  %643 = icmp eq i32 %638, 0
  br i1 %642, label %644, label %653

; <label>:644                                     ; preds = %630
  %645 = trunc i64 %636 to i32
  br i1 %643, label %646, label %649

; <label>:646                                     ; preds = %644
  %647 = trunc i64 %641 to i32
  %648 = icmp eq i32 %645, %647
  br label %eqNumber.exit

; <label>:649                                     ; preds = %644
  %650 = sitofp i32 %645 to double
  %651 = bitcast i64 %641 to double
  %652 = fcmp oeq double %650, %651
  br label %eqNumber.exit

; <label>:653                                     ; preds = %630
  %654 = bitcast i64 %636 to double
  br i1 %643, label %655, label %659

; <label>:655                                     ; preds = %653
  %656 = trunc i64 %641 to i32
  %657 = sitofp i32 %656 to double
  %658 = fcmp oeq double %654, %657
  br label %eqNumber.exit

; <label>:659                                     ; preds = %653
  %660 = bitcast i64 %641 to double
  %661 = fcmp oeq double %654, %660
  br label %eqNumber.exit

eqNumber.exit:                                    ; preds = %646, %649, %655, %659
  %.0.i96 = phi i1 [ %648, %646 ], [ %652, %649 ], [ %658, %655 ], [ %661, %659 ]
  %662 = zext i1 %.0.i96 to i32
  br label %702

; <label>:663                                     ; preds = %299
  %664 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 3, i32 0, i32 2
  %665 = bitcast %union.SyscallArg* %664 to i32*
  %666 = load i32* %665, align 1
  %667 = getelementptr %union.SyscallArg* %664, i64 1
  %668 = bitcast %union.SyscallArg* %667 to i64*
  %669 = load i64* %668, align 1
  %670 = getelementptr inbounds %struct.VExp* %293, i64 0, i32 3, i32 0, i32 0
  %671 = load i32* %670, align 1
  %672 = getelementptr %struct.VExp* %293, i64 0, i32 3, i32 0, i32 2
  %673 = bitcast %union.SyscallArg* %672 to i64*
  %674 = load i64* %673, align 1
  %675 = icmp eq i32 %666, 0
  %676 = icmp eq i32 %671, 0
  br i1 %675, label %677, label %686

; <label>:677                                     ; preds = %663
  %678 = trunc i64 %669 to i32
  br i1 %676, label %679, label %682

; <label>:679                                     ; preds = %677
  %680 = trunc i64 %674 to i32
  %681 = icmp ne i32 %678, %680
  br label %neqNumber.exit

; <label>:682                                     ; preds = %677
  %683 = sitofp i32 %678 to double
  %684 = bitcast i64 %674 to double
  %685 = fcmp une double %683, %684
  br label %neqNumber.exit

; <label>:686                                     ; preds = %663
  %687 = bitcast i64 %669 to double
  br i1 %676, label %688, label %692

; <label>:688                                     ; preds = %686
  %689 = trunc i64 %674 to i32
  %690 = sitofp i32 %689 to double
  %691 = fcmp une double %687, %690
  br label %neqNumber.exit

; <label>:692                                     ; preds = %686
  %693 = bitcast i64 %674 to double
  %694 = fcmp une double %687, %693
  br label %neqNumber.exit

neqNumber.exit:                                   ; preds = %679, %682, %688, %692
  %.0.i = phi i1 [ %681, %679 ], [ %685, %682 ], [ %691, %688 ], [ %694, %692 ]
  %695 = zext i1 %.0.i to i32
  br label %702

; <label>:696                                     ; preds = %divNumber.exit105, %divNumber.exit
  %.sink = phi { i32, i64 } [ %453, %divNumber.exit105 ], [ %497, %divNumber.exit ]
  %697 = phi i8* [ %451, %divNumber.exit105 ], [ %495, %divNumber.exit ]
  %result.sroa.0.0 = phi i32 [ %.sroa.0.0.i103, %divNumber.exit105 ], [ %.sroa.0.0.i, %divNumber.exit ]
  %698 = extractvalue { i32, i64 } %.sink, 1
  %699 = icmp eq i8* %697, null
  br i1 %699, label %.thread124, label %700

; <label>:700                                     ; preds = %696
  %701 = getelementptr inbounds %struct.Value* %v, i64 0, i32 0
  store i32 1, i32* %701, align 4, !tbaa !30
  %.c35 = bitcast i8* %697 to %struct.VExp*
  store %struct.VExp* %.c35, %struct.VExp** %125, align 8, !tbaa !1
  br label %854

; <label>:702                                     ; preds = %leNumber.exit, %geNumber.exit, %nleNumber.exit, %ngeNumber.exit, %eqNumber.exit, %neqNumber.exit, %299
  %result_bool.0.ph.ph = phi i32 [ %530, %leNumber.exit ], [ %563, %geNumber.exit ], [ %596, %nleNumber.exit ], [ %629, %ngeNumber.exit ], [ %662, %eqNumber.exit ], [ %695, %neqNumber.exit ], [ 0, %299 ]
  %703 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %704 = icmp eq %struct.VExp* %703, null
  br i1 %704, label %705, label %newVExpRef.exit

; <label>:705                                     ; preds = %702
  %706 = tail call noalias i8* @malloc(i64 56000) #7
  %707 = bitcast i8* %706 to %struct.VExp*
  br label %708

; <label>:708                                     ; preds = %708, %705
  %indvars.iv.i.i81 = phi i64 [ 0, %705 ], [ %indvars.iv.next.i.i82, %708 ]
  %709 = phi %struct.VExp* [ null, %705 ], [ %710, %708 ]
  %710 = getelementptr inbounds %struct.VExp* %707, i64 %indvars.iv.i.i81
  %711 = getelementptr inbounds %struct.VExp* %707, i64 %indvars.iv.i.i81, i32 3
  %712 = bitcast %union.anon.1* %711 to %struct.VExp**
  store %struct.VExp* %709, %struct.VExp** %712, align 8, !tbaa !1
  %indvars.iv.next.i.i82 = add nuw nsw i64 %indvars.iv.i.i81, 1
  %exitcond.i.i83 = icmp eq i64 %indvars.iv.next.i.i82, 1000
  br i1 %exitcond.i.i83, label %.loopexit.i.i86, label %708

.loopexit.i.i86:                                  ; preds = %708
  %scevgep.i.i84 = getelementptr i8* %706, i64 55944
  %scevgep3.i.i85 = bitcast i8* %scevgep.i.i84 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i85, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpRef.exit

newVExpRef.exit:                                  ; preds = %702, %.loopexit.i.i86
  %713 = phi %struct.VExp* [ %scevgep3.i.i85, %.loopexit.i.i86 ], [ %703, %702 ]
  %714 = getelementptr inbounds %struct.VExp* %713, i64 0, i32 4
  store i32 1, i32* %714, align 4, !tbaa !17
  %715 = getelementptr inbounds %struct.VExp* %713, i64 0, i32 3
  %716 = bitcast %union.anon.1* %715 to %struct.VExp**
  %717 = load %struct.VExp** %716, align 8, !tbaa !1
  store %struct.VExp* %717, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %718 = getelementptr inbounds %struct.VExp* %713, i64 0, i32 0
  store i32 7, i32* %718, align 4, !tbaa !15
  %719 = getelementptr inbounds %struct.VExp* %713, i64 0, i32 3, i32 0, i32 0
  store i32 %result_bool.0.ph.ph, i32* %719, align 4, !tbaa !26
  %720 = icmp eq %struct.VExp* %717, null
  br i1 %720, label %721, label %newVExpAbs.exit80

; <label>:721                                     ; preds = %newVExpRef.exit
  %722 = tail call noalias i8* @malloc(i64 56000) #7
  %723 = bitcast i8* %722 to %struct.VExp*
  br label %724

; <label>:724                                     ; preds = %724, %721
  %indvars.iv.i.i74 = phi i64 [ 0, %721 ], [ %indvars.iv.next.i.i75, %724 ]
  %725 = phi %struct.VExp* [ null, %721 ], [ %726, %724 ]
  %726 = getelementptr inbounds %struct.VExp* %723, i64 %indvars.iv.i.i74
  %727 = getelementptr inbounds %struct.VExp* %723, i64 %indvars.iv.i.i74, i32 3
  %728 = bitcast %union.anon.1* %727 to %struct.VExp**
  store %struct.VExp* %725, %struct.VExp** %728, align 8, !tbaa !1
  %indvars.iv.next.i.i75 = add nuw nsw i64 %indvars.iv.i.i74, 1
  %exitcond.i.i76 = icmp eq i64 %indvars.iv.next.i.i75, 1000
  br i1 %exitcond.i.i76, label %.loopexit.i.i79, label %724

.loopexit.i.i79:                                  ; preds = %724
  %scevgep.i.i77 = getelementptr i8* %722, i64 55944
  %scevgep3.i.i78 = bitcast i8* %scevgep.i.i77 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i78, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpAbs.exit80

newVExpAbs.exit80:                                ; preds = %newVExpRef.exit, %.loopexit.i.i79
  %729 = phi %struct.VExp* [ %scevgep3.i.i78, %.loopexit.i.i79 ], [ %717, %newVExpRef.exit ]
  %730 = getelementptr inbounds %struct.VExp* %729, i64 0, i32 4
  store i32 1, i32* %730, align 4, !tbaa !17
  %731 = getelementptr inbounds %struct.VExp* %729, i64 0, i32 3
  %732 = bitcast %union.anon.1* %731 to %struct.VExp**
  %733 = load %struct.VExp** %732, align 8, !tbaa !1
  store %struct.VExp* %733, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %734 = getelementptr inbounds %struct.VExp* %729, i64 0, i32 0
  store i32 1, i32* %734, align 4, !tbaa !15
  store %struct.VExp* %713, %struct.VExp** %732, align 8, !tbaa !1
  %735 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %736 = icmp eq %struct.VExp* %735, null
  br i1 %736, label %737, label %newVExpAbs.exit

; <label>:737                                     ; preds = %newVExpAbs.exit80
  %738 = tail call noalias i8* @malloc(i64 56000) #7
  %739 = bitcast i8* %738 to %struct.VExp*
  br label %740

; <label>:740                                     ; preds = %740, %737
  %indvars.iv.i.i56 = phi i64 [ 0, %737 ], [ %indvars.iv.next.i.i57, %740 ]
  %741 = phi %struct.VExp* [ null, %737 ], [ %742, %740 ]
  %742 = getelementptr inbounds %struct.VExp* %739, i64 %indvars.iv.i.i56
  %743 = getelementptr inbounds %struct.VExp* %739, i64 %indvars.iv.i.i56, i32 3
  %744 = bitcast %union.anon.1* %743 to %struct.VExp**
  store %struct.VExp* %741, %struct.VExp** %744, align 8, !tbaa !1
  %indvars.iv.next.i.i57 = add nuw nsw i64 %indvars.iv.i.i56, 1
  %exitcond.i.i58 = icmp eq i64 %indvars.iv.next.i.i57, 1000
  br i1 %exitcond.i.i58, label %.loopexit.i.i61, label %740

.loopexit.i.i61:                                  ; preds = %740
  %scevgep.i.i59 = getelementptr i8* %738, i64 55944
  %scevgep3.i.i60 = bitcast i8* %scevgep.i.i59 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i60, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpAbs.exit

newVExpAbs.exit:                                  ; preds = %newVExpAbs.exit80, %.loopexit.i.i61
  %745 = phi %struct.VExp* [ %scevgep3.i.i60, %.loopexit.i.i61 ], [ %735, %newVExpAbs.exit80 ]
  %746 = getelementptr inbounds %struct.VExp* %745, i64 0, i32 4
  store i32 1, i32* %746, align 4, !tbaa !17
  %747 = getelementptr inbounds %struct.VExp* %745, i64 0, i32 3
  %748 = bitcast %union.anon.1* %747 to %struct.VExp**
  %749 = load %struct.VExp** %748, align 8, !tbaa !1
  store %struct.VExp* %749, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %750 = getelementptr inbounds %struct.VExp* %745, i64 0, i32 0
  store i32 1, i32* %750, align 4, !tbaa !15
  store %struct.VExp* %729, %struct.VExp** %748, align 8, !tbaa !1
  br label %769

.thread124:                                       ; preds = %406, %400, %392, %389, %370, %364, %356, %353, %334, %328, %320, %317, %696
  %result.sroa.0.0122126 = phi i32 [ %result.sroa.0.0, %696 ], [ 0, %317 ], [ 1, %320 ], [ 1, %328 ], [ 1, %334 ], [ 0, %353 ], [ 1, %356 ], [ 1, %364 ], [ 1, %370 ], [ 0, %389 ], [ 1, %392 ], [ 1, %400 ], [ 1, %406 ]
  %result.sroa.11.0123125 = phi i64 [ %698, %696 ], [ %319, %317 ], [ %325, %320 ], [ %333, %328 ], [ %337, %334 ], [ %355, %353 ], [ %361, %356 ], [ %369, %364 ], [ %373, %370 ], [ %391, %389 ], [ %397, %392 ], [ %405, %400 ], [ %409, %406 ]
  %751 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %752 = icmp eq %struct.VExp* %751, null
  br i1 %752, label %753, label %newVExpNum.exit

; <label>:753                                     ; preds = %.thread124
  %754 = tail call noalias i8* @malloc(i64 56000) #7
  %755 = bitcast i8* %754 to %struct.VExp*
  br label %756

; <label>:756                                     ; preds = %756, %753
  %indvars.iv.i.i49 = phi i64 [ 0, %753 ], [ %indvars.iv.next.i.i50, %756 ]
  %757 = phi %struct.VExp* [ null, %753 ], [ %758, %756 ]
  %758 = getelementptr inbounds %struct.VExp* %755, i64 %indvars.iv.i.i49
  %759 = getelementptr inbounds %struct.VExp* %755, i64 %indvars.iv.i.i49, i32 3
  %760 = bitcast %union.anon.1* %759 to %struct.VExp**
  store %struct.VExp* %757, %struct.VExp** %760, align 8, !tbaa !1
  %indvars.iv.next.i.i50 = add nuw nsw i64 %indvars.iv.i.i49, 1
  %exitcond.i.i51 = icmp eq i64 %indvars.iv.next.i.i50, 1000
  br i1 %exitcond.i.i51, label %.loopexit.i.i54, label %756

.loopexit.i.i54:                                  ; preds = %756
  %scevgep.i.i52 = getelementptr i8* %754, i64 55944
  %scevgep3.i.i53 = bitcast i8* %scevgep.i.i52 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i53, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNum.exit

newVExpNum.exit:                                  ; preds = %.thread124, %.loopexit.i.i54
  %761 = phi %struct.VExp* [ %scevgep3.i.i53, %.loopexit.i.i54 ], [ %751, %.thread124 ]
  %762 = getelementptr inbounds %struct.VExp* %761, i64 0, i32 4
  store i32 1, i32* %762, align 4, !tbaa !17
  %763 = getelementptr inbounds %struct.VExp* %761, i64 0, i32 3
  %764 = bitcast %union.anon.1* %763 to %struct.VExp**
  %765 = load %struct.VExp** %764, align 8, !tbaa !1
  store %struct.VExp* %765, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %766 = getelementptr inbounds %struct.VExp* %761, i64 0, i32 0
  store i32 0, i32* %766, align 4, !tbaa !15
  %767 = getelementptr inbounds %struct.VExp* %761, i64 0, i32 3, i32 0, i32 0
  store i32 %result.sroa.0.0122126, i32* %767, align 8
  %768 = getelementptr inbounds %struct.VExp* %761, i64 0, i32 3, i32 0, i32 2, i32 0
  %num_val.coerce1.c.i = inttoptr i64 %result.sroa.11.0123125 to %struct.IntList*
  store %struct.IntList* %num_val.coerce1.c.i, %struct.IntList** %768, align 8
  br label %769

; <label>:769                                     ; preds = %newVExpNum.exit, %newVExpAbs.exit
  %nexp9.0 = phi %struct.VExp* [ %745, %newVExpAbs.exit ], [ %761, %newVExpNum.exit ]
  %770 = getelementptr inbounds %struct.Continuation* %3, i64 0, i32 2
  %771 = load %struct.Continuation** %770, align 8, !tbaa !44
  store %struct.VExp* %nexp9.0, %struct.VExp** %125, align 8, !tbaa !31
  store %struct.VContext* null, %struct.VContext** %127, align 8, !tbaa !33
  store %struct.Continuation* %771, %struct.Continuation** %2, align 8, !tbaa !34
  br label %854

; <label>:772                                     ; preds = %124
  %773 = getelementptr inbounds %struct.Value* %131, i64 0, i32 0
  %774 = load i32* %773, align 4, !tbaa !30
  %switch41 = icmp ult i32 %774, 2
  br i1 %switch41, label %775, label %855

; <label>:775                                     ; preds = %772
  %776 = icmp eq i32 %774, 1
  %777 = getelementptr inbounds %struct.Value* %131, i64 0, i32 1
  br i1 %776, label %778, label %782

; <label>:778                                     ; preds = %775
  %779 = bitcast %union.anon.0* %777 to i8**
  %780 = load i8** %779, align 8, !tbaa !1
  %781 = getelementptr inbounds %struct.Value* %v, i64 0, i32 0
  store i32 1, i32* %781, align 4, !tbaa !30
  %.c34 = bitcast i8* %780 to %struct.VExp*
  store %struct.VExp* %.c34, %struct.VExp** %125, align 8, !tbaa !1
  br label %854

; <label>:782                                     ; preds = %775
  %783 = getelementptr inbounds %union.anon.0* %777, i64 0, i32 0, i32 0
  %784 = load %struct.VExp** %783, align 8, !tbaa !18
  %785 = getelementptr inbounds %struct.VExp* %784, i64 0, i32 0
  %786 = load i32* %785, align 4, !tbaa !15
  %787 = icmp eq i32 %786, 0
  br i1 %787, label %790, label %788

; <label>:788                                     ; preds = %782
  %789 = getelementptr inbounds %struct.Value* %v, i64 0, i32 0
  store i32 1, i32* %789, align 4, !tbaa !30
  store %struct.VExp* bitcast ([52 x i8]* @.str9 to %struct.VExp*), %struct.VExp** %125, align 8, !tbaa !1
  br label %854

; <label>:790                                     ; preds = %782
  %791 = getelementptr inbounds %struct.VExp* %784, i64 0, i32 3, i32 0, i32 0
  %792 = load i32* %791, align 4, !tbaa !40
  %793 = icmp eq i32 %792, 0
  br i1 %793, label %796, label %794

; <label>:794                                     ; preds = %790
  %795 = getelementptr inbounds %struct.Value* %v, i64 0, i32 0
  store i32 1, i32* %795, align 4, !tbaa !30
  store %struct.VExp* bitcast ([44 x i8]* @.str10 to %struct.VExp*), %struct.VExp** %125, align 8, !tbaa !1
  br label %854

; <label>:796                                     ; preds = %790
  %797 = getelementptr inbounds %struct.VExp* %784, i64 0, i32 3, i32 0, i32 2
  %798 = bitcast %union.SyscallArg* %797 to i32*
  %799 = load i32* %798, align 4, !tbaa !26
  %800 = getelementptr inbounds %struct.VExp* %126, i64 0, i32 3
  %801 = bitcast %union.anon.1* %800 to %struct.IntList**
  %802 = load %struct.IntList** %801, align 8, !tbaa !21
  %803 = icmp eq %struct.IntList* %802, null
  br i1 %803, label %retainIntList.exit, label %804

; <label>:804                                     ; preds = %796
  %805 = getelementptr inbounds %struct.IntList* %802, i64 0, i32 2
  %806 = load i32* %805, align 4, !tbaa !8
  %807 = add nsw i32 %806, 1
  store i32 %807, i32* %805, align 4, !tbaa !8
  br label %retainIntList.exit

retainIntList.exit:                               ; preds = %796, %804
  %808 = load %struct.IntList** @allocateIntList.pool, align 8, !tbaa !1
  %809 = icmp eq %struct.IntList* %808, null
  br i1 %809, label %810, label %newIntList.exit

; <label>:810                                     ; preds = %retainIntList.exit
  %811 = tail call noalias i8* @malloc(i64 24000) #7
  %812 = bitcast i8* %811 to %struct.IntList*
  br label %813

; <label>:813                                     ; preds = %813, %810
  %indvars.iv.i.i42 = phi i64 [ 0, %810 ], [ %indvars.iv.next.i.i43, %813 ]
  %814 = phi %struct.IntList* [ null, %810 ], [ %815, %813 ]
  %815 = getelementptr inbounds %struct.IntList* %812, i64 %indvars.iv.i.i42
  %816 = getelementptr inbounds %struct.IntList* %812, i64 %indvars.iv.i.i42, i32 1
  store %struct.IntList* %814, %struct.IntList** %816, align 8, !tbaa !5
  %indvars.iv.next.i.i43 = add nuw nsw i64 %indvars.iv.i.i42, 1
  %exitcond.i.i44 = icmp eq i64 %indvars.iv.next.i.i43, 1000
  br i1 %exitcond.i.i44, label %.loopexit.i.i47, label %813

.loopexit.i.i47:                                  ; preds = %813
  %scevgep.i.i45 = getelementptr i8* %811, i64 23976
  %scevgep3.i.i46 = bitcast i8* %scevgep.i.i45 to %struct.IntList*
  store %struct.IntList* %scevgep3.i.i46, %struct.IntList** @allocateIntList.pool, align 8, !tbaa !1
  br label %newIntList.exit

newIntList.exit:                                  ; preds = %retainIntList.exit, %.loopexit.i.i47
  %817 = phi %struct.IntList* [ %scevgep3.i.i46, %.loopexit.i.i47 ], [ %808, %retainIntList.exit ]
  %818 = getelementptr inbounds %struct.IntList* %817, i64 0, i32 1
  %819 = load %struct.IntList** %818, align 8, !tbaa !5
  store %struct.IntList* %819, %struct.IntList** @allocateIntList.pool, align 8, !tbaa !1
  %820 = getelementptr inbounds %struct.IntList* %817, i64 0, i32 0
  store i32 %799, i32* %820, align 4, !tbaa !9
  store %struct.IntList* %802, %struct.IntList** %818, align 8, !tbaa !5
  %821 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %822 = icmp eq %struct.VExp* %821, null
  br i1 %822, label %823, label %newVExpIntList.exit

; <label>:823                                     ; preds = %newIntList.exit
  %824 = tail call noalias i8* @malloc(i64 56000) #7
  %825 = bitcast i8* %824 to %struct.VExp*
  br label %826

; <label>:826                                     ; preds = %826, %823
  %indvars.iv.i.i = phi i64 [ 0, %823 ], [ %indvars.iv.next.i.i, %826 ]
  %827 = phi %struct.VExp* [ null, %823 ], [ %828, %826 ]
  %828 = getelementptr inbounds %struct.VExp* %825, i64 %indvars.iv.i.i
  %829 = getelementptr inbounds %struct.VExp* %825, i64 %indvars.iv.i.i, i32 3
  %830 = bitcast %union.anon.1* %829 to %struct.VExp**
  store %struct.VExp* %827, %struct.VExp** %830, align 8, !tbaa !1
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %exitcond.i.i = icmp eq i64 %indvars.iv.next.i.i, 1000
  br i1 %exitcond.i.i, label %.loopexit.i.i, label %826

.loopexit.i.i:                                    ; preds = %826
  %scevgep.i.i = getelementptr i8* %824, i64 55944
  %scevgep3.i.i = bitcast i8* %scevgep.i.i to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpIntList.exit

newVExpIntList.exit:                              ; preds = %newIntList.exit, %.loopexit.i.i
  %831 = phi %struct.VExp* [ %scevgep3.i.i, %.loopexit.i.i ], [ %821, %newIntList.exit ]
  %832 = getelementptr inbounds %struct.VExp* %831, i64 0, i32 4
  store i32 1, i32* %832, align 4, !tbaa !17
  %833 = getelementptr inbounds %struct.VExp* %831, i64 0, i32 3
  %834 = bitcast %union.anon.1* %833 to %struct.VExp**
  %835 = load %struct.VExp** %834, align 8, !tbaa !1
  store %struct.VExp* %835, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %836 = getelementptr inbounds %struct.VExp* %831, i64 0, i32 0
  store i32 4, i32* %836, align 4, !tbaa !15
  %837 = bitcast %union.anon.1* %833 to %struct.IntList**
  store %struct.IntList* %817, %struct.IntList** %837, align 8, !tbaa !21
  %838 = getelementptr inbounds %struct.Continuation* %3, i64 0, i32 2
  %839 = load %struct.Continuation** %838, align 8, !tbaa !44
  store %struct.VExp* %831, %struct.VExp** %125, align 8, !tbaa !31
  store %struct.VContext* null, %struct.VContext** %127, align 8, !tbaa !33
  store %struct.Continuation* %839, %struct.Continuation** %2, align 8, !tbaa !34
  br label %854

; <label>:840                                     ; preds = %124
  %841 = call %struct.VExp* @appendSyscallArg(%struct.VExp* %126, %struct.Value* %131, i8** %error_message, %struct.Value** %to_resolve)
  %842 = icmp eq %struct.VExp* %841, null
  br i1 %842, label %843, label %851

; <label>:843                                     ; preds = %840
  %844 = load i8** %error_message, align 8, !tbaa !1
  %845 = icmp eq i8* %844, null
  br i1 %845, label %848, label %846

; <label>:846                                     ; preds = %843
  %847 = getelementptr inbounds %struct.Value* %v, i64 0, i32 0
  store i32 1, i32* %847, align 4, !tbaa !30
  %.c = bitcast i8* %844 to %struct.VExp*
  store %struct.VExp* %.c, %struct.VExp** %125, align 8, !tbaa !1
  br label %854

; <label>:848                                     ; preds = %843
  %849 = load %struct.Value** %to_resolve, align 8, !tbaa !1
  %850 = icmp eq %struct.Value* %849, null
  br i1 %850, label %854, label %855

; <label>:851                                     ; preds = %840
  %852 = getelementptr inbounds %struct.Continuation* %3, i64 0, i32 2
  %853 = load %struct.Continuation** %852, align 8, !tbaa !44
  store %struct.VExp* %841, %struct.VExp** %125, align 8, !tbaa !31
  store %struct.VContext* %128, %struct.VContext** %127, align 8, !tbaa !33
  store %struct.Continuation* %853, %struct.Continuation** %2, align 8, !tbaa !34
  br label %854

; <label>:854                                     ; preds = %124, %7, %34, %848, %newValue.exit, %retainVContext.exit55, %65, %134, %180, %retainVExp.exit73, %170, %788, %newVExpIntList.exit, %794, %778, %851, %846, %287, %700, %769, %297, %insertRef.exit, %5
  br label %855

; <label>:855                                     ; preds = %772, %281, %164, %848, %lookUpRef.exit, %854
  %.0 = phi %struct.Value* [ null, %854 ], [ %43, %lookUpRef.exit ], [ %131, %164 ], [ %131, %281 ], [ %131, %772 ], [ %849, %848 ]
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

.backedge:                                        ; preds = %resolveAllValue.exit33, %newValue.exit46, %4
  %files_buflen.0 = phi i32 [ 2, %4 ], [ %files_buflen.2, %newValue.exit46 ], [ %files_buflen.2, %resolveAllValue.exit33 ]
  %files.0 = phi %struct._IO_FILE** [ %6, %4 ], [ %files.2, %newValue.exit46 ], [ %files.2, %resolveAllValue.exit33 ]
  %cur_arg.1 = phi i8* [ %cur_arg.0, %4 ], [ %cur_arg.2, %newValue.exit46 ], [ %cur_arg.2, %resolveAllValue.exit33 ]
  %cur_argi.0 = phi i32 [ 0, %4 ], [ %cur_argi.1, %newValue.exit46 ], [ %cur_argi.1, %resolveAllValue.exit33 ]
  %.0 = phi %struct.Value* [ %v, %4 ], [ %315, %newValue.exit46 ], [ %231, %resolveAllValue.exit33 ]
  %11 = getelementptr inbounds %struct.Value* %.0, i64 0, i32 0
  %12 = load i32* %11, align 4, !tbaa !30
  %switch = icmp ult i32 %12, 2
  br i1 %switch, label %resolveAllValue.exit, label %13

; <label>:13                                      ; preds = %.backedge
  %14 = tail call noalias i8* @malloc(i64 16) #7
  %15 = bitcast i8* %14 to %struct.Value**
  store %struct.Value* %.0, %struct.Value** %15, align 8, !tbaa !47
  %16 = getelementptr inbounds i8* %14, i64 8
  %17 = bitcast i8* %16 to %struct.ValueStack**
  store %struct.ValueStack* null, %struct.ValueStack** %17, align 8, !tbaa !49
  %18 = icmp eq i8* %14, null
  br i1 %18, label %resolveAllValue.exitthread-pre-split, label %.lr.ph.lr.ph.i

.lr.ph.lr.ph.i:                                   ; preds = %13
  %19 = bitcast i8* %14 to %struct.ValueStack*
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.outer.backedge.i, %.lr.ph.lr.ph.i
  %head.0.ph1.i = phi %struct.ValueStack* [ %19, %.lr.ph.lr.ph.i ], [ %head.0.ph.be.i, %.outer.backedge.i ]
  %20 = getelementptr inbounds %struct.ValueStack* %head.0.ph1.i, i64 0, i32 0
  %21 = load %struct.Value** %20, align 8, !tbaa !47
  %22 = getelementptr inbounds %struct.Value* %21, i64 0, i32 0
  %23 = load i32* %22, align 4, !tbaa !30
  %switch.i49 = icmp ult i32 %23, 2
  br i1 %switch.i49, label %.backedge.i._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.i, %.backedge.i.backedge
  %24 = phi %struct.Value* [ %27, %.backedge.i.backedge ], [ %21, %.lr.ph.i ]
  %25 = tail call %struct.Value* @resolveValue(%struct.Value* %24) #7
  %26 = icmp eq %struct.Value* %25, null
  %.pre98 = load %struct.Value** %20, align 8, !tbaa !47
  br i1 %26, label %.backedge.i.backedge, label %30

.backedge.i.backedge:                             ; preds = %.lr.ph, %30
  %27 = phi %struct.Value* [ %25, %30 ], [ %.pre98, %.lr.ph ]
  %28 = getelementptr inbounds %struct.Value* %27, i64 0, i32 0
  %29 = load i32* %28, align 4, !tbaa !30
  %switch.i = icmp ult i32 %29, 2
  br i1 %switch.i, label %.backedge.i._crit_edge, label %.lr.ph

; <label>:30                                      ; preds = %.lr.ph
  %31 = icmp eq %struct.Value* %25, %.pre98
  br i1 %31, label %.backedge.i.backedge, label %32

; <label>:32                                      ; preds = %30
  %33 = tail call noalias i8* @malloc(i64 16) #7
  %34 = bitcast i8* %33 to %struct.ValueStack*
  %35 = bitcast i8* %33 to %struct.Value**
  store %struct.Value* %25, %struct.Value** %35, align 8, !tbaa !47
  %36 = getelementptr inbounds i8* %33, i64 8
  %37 = bitcast i8* %36 to %struct.ValueStack**
  store %struct.ValueStack* %head.0.ph1.i, %struct.ValueStack** %37, align 8, !tbaa !49
  br label %.outer.backedge.i

.outer.backedge.i:                                ; preds = %.backedge.i._crit_edge, %32
  %head.0.ph.be.i = phi %struct.ValueStack* [ %34, %32 ], [ %40, %.backedge.i._crit_edge ]
  %38 = icmp eq %struct.ValueStack* %head.0.ph.be.i, null
  br i1 %38, label %resolveAllValue.exitthread-pre-split, label %.lr.ph.i

.backedge.i._crit_edge:                           ; preds = %.backedge.i.backedge, %.lr.ph.i
  %39 = getelementptr inbounds %struct.ValueStack* %head.0.ph1.i, i64 0, i32 1
  %40 = load %struct.ValueStack** %39, align 8, !tbaa !49
  br label %.outer.backedge.i

resolveAllValue.exitthread-pre-split:             ; preds = %.outer.backedge.i, %13
  %.pr = load i32* %11, align 4, !tbaa !30
  br label %resolveAllValue.exit

resolveAllValue.exit:                             ; preds = %resolveAllValue.exitthread-pre-split, %.backedge
  %41 = phi i32 [ %.pr, %resolveAllValue.exitthread-pre-split ], [ %12, %.backedge ]
  %42 = icmp eq i32 %41, 1
  %43 = getelementptr inbounds %struct.Value* %.0, i64 0, i32 1
  br i1 %42, label %44, label %48

; <label>:44                                      ; preds = %resolveAllValue.exit
  %45 = bitcast %union.anon.0* %43 to i8**
  %46 = load i8** %45, align 8, !tbaa !1
  %47 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str11, i64 0, i64 0), i8* %46) #7
  br label %328

; <label>:48                                      ; preds = %resolveAllValue.exit
  %49 = getelementptr inbounds %union.anon.0* %43, i64 0, i32 0, i32 0
  %50 = load %struct.VExp** %49, align 8, !tbaa !18
  %51 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 0
  %52 = load i32* %51, align 4, !tbaa !15
  switch i32 %52, label %66 [
    i32 5, label %68
    i32 0, label %53
  ]

; <label>:53                                      ; preds = %48
  %54 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 0
  %55 = load i32* %54, align 8
  %56 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 2
  %57 = bitcast %union.SyscallArg* %56 to double*
  %58 = load double* %57, align 8
  %59 = icmp eq i32 %55, 0
  br i1 %59, label %60, label %64

; <label>:60                                      ; preds = %53
  %61 = bitcast double %58 to i64
  %62 = trunc i64 %61 to i32
  %63 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str2, i64 0, i64 0), i32 %62) #7
  br label %displayExp.exit

; <label>:64                                      ; preds = %53
  %65 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0), double %58) #7
  br label %displayExp.exit

; <label>:66                                      ; preds = %48
  %67 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str4, i64 0, i64 0)) #7
  br label %displayExp.exit

displayExp.exit:                                  ; preds = %60, %64, %66
  %putchar = tail call i32 @putchar(i32 10) #7
  br label %328

; <label>:68                                      ; preds = %48
  %69 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 0
  %70 = load i32* %69, align 4, !tbaa !25
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds [8 x [4 x i32]]* @syscall_arginfo, i64 0, i64 %71, i64 0
  %73 = load i32* %72, align 16, !tbaa !26
  %74 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 1
  %75 = load i32* %74, align 4, !tbaa !23
  %76 = icmp sgt i32 %73, %75
  br i1 %76, label %77, label %78

; <label>:77                                      ; preds = %68
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([45 x i8]* @str, i64 0, i64 0)) #7
  br label %328

; <label>:78                                      ; preds = %68
  switch i32 %70, label %.critedge [
    i32 0, label %79
    i32 1, label %83
    i32 3, label %136
    i32 4, label %149
    i32 5, label %165
    i32 6, label %181
    i32 2, label %196
    i32 7, label %209
  ]

; <label>:79                                      ; preds = %78
  %80 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 2
  %81 = bitcast %union.SyscallArg* %80 to i32*
  %82 = load i32* %81, align 4, !tbaa !26
  br label %328

; <label>:83                                      ; preds = %78
  %84 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 3
  %85 = load i32* %84, align 4, !tbaa !41
  %86 = icmp ult i32 %85, 4
  br i1 %86, label %87, label %.critedge

; <label>:87                                      ; preds = %83
  %88 = sext i32 %85 to i64
  %switch.gep = getelementptr inbounds [4 x i8*]* @switch.table, i64 0, i64 %88
  %switch.load = load i8** %switch.gep, align 8
  %89 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 2, i32 0
  %90 = load %struct.IntList** %89, align 8, !tbaa !1
  %91 = icmp eq %struct.IntList* %90, null
  br i1 %91, label %.thread.i, label %.lr.ph7.i

.thread.i:                                        ; preds = %87
  %92 = tail call noalias i8* @malloc(i64 1) #7
  br label %convertIntListToString.exit

.lr.ph7.i:                                        ; preds = %87, %.lr.ph7.i
  %l.05.i = phi i32 [ %phitmp.i, %.lr.ph7.i ], [ 1, %87 ]
  %p.04.i = phi %struct.IntList* [ %94, %.lr.ph7.i ], [ %90, %87 ]
  %93 = getelementptr inbounds %struct.IntList* %p.04.i, i64 0, i32 1
  %94 = load %struct.IntList** %93, align 8, !tbaa !5
  %phitmp.i = add i32 %l.05.i, 1
  %95 = icmp eq %struct.IntList* %94, null
  br i1 %95, label %.lr.ph.i10.preheader, label %.lr.ph7.i

.lr.ph.i10.preheader:                             ; preds = %.lr.ph7.i
  %phitmp10.i = sext i32 %phitmp.i to i64
  %96 = tail call noalias i8* @malloc(i64 %phitmp10.i) #7
  br label %.lr.ph.i10

.lr.ph.i10:                                       ; preds = %.lr.ph.i10.preheader, %.lr.ph.i10
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %.lr.ph.i10 ], [ 0, %.lr.ph.i10.preheader ]
  %p1.03.i = phi %struct.IntList* [ %103, %.lr.ph.i10 ], [ %90, %.lr.ph.i10.preheader ]
  %i.02.i = phi i32 [ %101, %.lr.ph.i10 ], [ 0, %.lr.ph.i10.preheader ]
  %97 = getelementptr inbounds %struct.IntList* %p1.03.i, i64 0, i32 0
  %98 = load i32* %97, align 4, !tbaa !9
  %99 = trunc i32 %98 to i8
  %100 = getelementptr inbounds i8* %96, i64 %indvars.iv.i
  store i8 %99, i8* %100, align 1, !tbaa !10
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %101 = add nsw i32 %i.02.i, 1
  %102 = getelementptr inbounds %struct.IntList* %p1.03.i, i64 0, i32 1
  %103 = load %struct.IntList** %102, align 8, !tbaa !5
  %104 = icmp eq %struct.IntList* %103, null
  br i1 %104, label %._crit_edge.i, label %.lr.ph.i10

._crit_edge.i:                                    ; preds = %.lr.ph.i10
  %phitmp11.i = sext i32 %101 to i64
  br label %convertIntListToString.exit

convertIntListToString.exit:                      ; preds = %.thread.i, %._crit_edge.i
  %105 = phi i8* [ %96, %._crit_edge.i ], [ %92, %.thread.i ]
  %i.0.lcssa.i = phi i64 [ %phitmp11.i, %._crit_edge.i ], [ 0, %.thread.i ]
  %106 = getelementptr inbounds i8* %105, i64 %i.0.lcssa.i
  store i8 0, i8* %106, align 1, !tbaa !10
  %107 = tail call %struct._IO_FILE* @fopen(i8* %105, i8* %switch.load) #7
  tail call void @free(i8* %105) #7
  %108 = icmp eq %struct._IO_FILE* %107, null
  br i1 %108, label %.critedge, label %.preheader

.preheader:                                       ; preds = %convertIntListToString.exit
  %109 = icmp sgt i32 %files_buflen.0, 0
  br i1 %109, label %.lr.ph54, label %.thread47.thread

.thread47.thread:                                 ; preds = %.preheader
  %110 = bitcast %struct._IO_FILE** %files.0 to i8*
  %111 = sext i32 %files_buflen.0 to i64
  %112 = shl nsw i64 %111, 4
  %113 = tail call i8* @realloc(i8* %110, i64 %112) #7
  %114 = bitcast i8* %113 to %struct._IO_FILE**
  br label %133

; <label>:115                                     ; preds = %.lr.ph54
  %116 = add nsw i32 %i.053, 1
  %117 = trunc i64 %indvars.iv.next to i32
  %118 = icmp slt i32 %117, %files_buflen.0
  br i1 %118, label %.lr.ph54, label %.thread47

.lr.ph54:                                         ; preds = %.preheader, %115
  %indvars.iv = phi i64 [ %indvars.iv.next, %115 ], [ 0, %.preheader ]
  %i.053 = phi i32 [ %116, %115 ], [ 0, %.preheader ]
  %119 = getelementptr inbounds %struct._IO_FILE** %files.0, i64 %indvars.iv
  %120 = load %struct._IO_FILE** %119, align 8, !tbaa !1
  %121 = icmp eq %struct._IO_FILE* %120, null
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %121, label %122, label %115

; <label>:122                                     ; preds = %.lr.ph54
  %123 = icmp eq i32 %i.053, -1
  br i1 %123, label %.thread47, label %.critedge

.thread47:                                        ; preds = %115, %122
  %124 = bitcast %struct._IO_FILE** %files.0 to i8*
  %125 = sext i32 %files_buflen.0 to i64
  %126 = shl nsw i64 %125, 4
  %127 = tail call i8* @realloc(i8* %124, i64 %126) #7
  %128 = bitcast i8* %127 to %struct._IO_FILE**
  br i1 %109, label %.lr.ph56, label %133

.lr.ph56:                                         ; preds = %.thread47
  %129 = add i32 %files_buflen.0, -1
  %130 = zext i32 %129 to i64
  %131 = shl nuw nsw i64 %130, 3
  %132 = add i64 %131, 8
  call void @llvm.memset.p0i8.i64(i8* %127, i8 0, i64 %132, i32 8, i1 false)
  br label %133

; <label>:133                                     ; preds = %.thread47.thread, %.lr.ph56, %.thread47
  %134 = phi %struct._IO_FILE** [ %114, %.thread47.thread ], [ %128, %.lr.ph56 ], [ %128, %.thread47 ]
  %135 = shl nsw i32 %files_buflen.0, 1
  br label %.critedge

; <label>:136                                     ; preds = %78
  %137 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 2
  %138 = bitcast %union.SyscallArg* %137 to i32*
  %139 = load i32* %138, align 4, !tbaa !26
  %140 = icmp sgt i32 %139, -1
  %141 = icmp slt i32 %139, %files_buflen.0
  %or.cond = and i1 %140, %141
  br i1 %or.cond, label %142, label %.critedge

; <label>:142                                     ; preds = %136
  %143 = sext i32 %139 to i64
  %144 = getelementptr inbounds %struct._IO_FILE** %files.0, i64 %143
  %145 = load %struct._IO_FILE** %144, align 8, !tbaa !1
  %146 = icmp eq %struct._IO_FILE* %145, null
  br i1 %146, label %.critedge, label %147

; <label>:147                                     ; preds = %142
  %148 = tail call i32 @fgetc(%struct._IO_FILE* %145) #7
  br label %.critedge

; <label>:149                                     ; preds = %78
  %150 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 2
  %151 = bitcast %union.SyscallArg* %150 to i32*
  %152 = load i32* %151, align 4, !tbaa !26
  %153 = icmp sgt i32 %152, -1
  %154 = icmp slt i32 %152, %files_buflen.0
  %or.cond7 = and i1 %153, %154
  br i1 %or.cond7, label %155, label %.critedge

; <label>:155                                     ; preds = %149
  %156 = sext i32 %152 to i64
  %157 = getelementptr inbounds %struct._IO_FILE** %files.0, i64 %156
  %158 = load %struct._IO_FILE** %157, align 8, !tbaa !1
  %159 = icmp eq %struct._IO_FILE* %158, null
  br i1 %159, label %.critedge, label %160

; <label>:160                                     ; preds = %155
  %161 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 3
  %162 = load i32* %161, align 4, !tbaa !41
  %163 = tail call i32 @fputc(i32 %162, %struct._IO_FILE* %158) #7
  %164 = icmp eq i32 %163, -1
  %. = zext i1 %164 to i32
  br label %.critedge

; <label>:165                                     ; preds = %78
  %166 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 2
  %167 = bitcast %union.SyscallArg* %166 to i32*
  %168 = load i32* %167, align 4, !tbaa !26
  %169 = icmp sgt i32 %168, -1
  %170 = icmp slt i32 %168, %files_buflen.0
  %or.cond8 = and i1 %169, %170
  br i1 %or.cond8, label %171, label %.critedge

; <label>:171                                     ; preds = %165
  %172 = sext i32 %168 to i64
  %173 = getelementptr inbounds %struct._IO_FILE** %files.0, i64 %172
  %174 = load %struct._IO_FILE** %173, align 8, !tbaa !1
  %175 = icmp eq %struct._IO_FILE* %174, null
  br i1 %175, label %.critedge, label %176

; <label>:176                                     ; preds = %171
  %177 = tail call i32 @fgetc(%struct._IO_FILE* %174) #7
  %178 = icmp eq i32 %177, -1
  br i1 %178, label %.critedge, label %179

; <label>:179                                     ; preds = %176
  %180 = tail call i32 @ungetc(i32 %177, %struct._IO_FILE* %174) #7
  br label %.critedge

; <label>:181                                     ; preds = %78
  %182 = icmp slt i32 %cur_argi.0, %argc
  br i1 %182, label %183, label %.critedge

; <label>:183                                     ; preds = %181
  %184 = load i8* %cur_arg.1, align 1, !tbaa !10
  %185 = icmp eq i8 %184, 0
  br i1 %185, label %189, label %186

; <label>:186                                     ; preds = %183
  %187 = sext i8 %184 to i32
  %188 = getelementptr inbounds i8* %cur_arg.1, i64 1
  br label %.critedge

; <label>:189                                     ; preds = %183
  %190 = add nsw i32 %cur_argi.0, 1
  %191 = icmp slt i32 %190, %argc
  br i1 %191, label %192, label %.critedge

; <label>:192                                     ; preds = %189
  %193 = sext i32 %190 to i64
  %194 = getelementptr inbounds i8** %args, i64 %193
  %195 = load i8** %194, align 8, !tbaa !1
  br label %.critedge

; <label>:196                                     ; preds = %78
  %197 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 2
  %198 = bitcast %union.SyscallArg* %197 to i32*
  %199 = load i32* %198, align 4, !tbaa !26
  %200 = icmp sgt i32 %199, -1
  %201 = icmp slt i32 %199, %files_buflen.0
  %or.cond9 = and i1 %200, %201
  br i1 %or.cond9, label %202, label %.critedge

; <label>:202                                     ; preds = %196
  %203 = sext i32 %199 to i64
  %204 = getelementptr inbounds %struct._IO_FILE** %files.0, i64 %203
  %205 = load %struct._IO_FILE** %204, align 8, !tbaa !1
  %206 = icmp eq %struct._IO_FILE* %205, null
  br i1 %206, label %.critedge, label %207

; <label>:207                                     ; preds = %202
  %208 = tail call i32 @fclose(%struct._IO_FILE* %205) #7
  store %struct._IO_FILE* null, %struct._IO_FILE** %204, align 8, !tbaa !1
  br label %.critedge

; <label>:209                                     ; preds = %78
  %210 = getelementptr inbounds %struct.VExp* %50, i64 0, i32 3, i32 0, i32 2, i32 0
  %211 = load %struct.IntList** %210, align 8, !tbaa !1
  %212 = icmp eq %struct.IntList* %211, null
  br i1 %212, label %.thread.i11, label %.lr.ph7.i15

.thread.i11:                                      ; preds = %209
  %213 = tail call noalias i8* @malloc(i64 1) #7
  br label %convertIntListToString.exit25

.lr.ph7.i15:                                      ; preds = %209, %.lr.ph7.i15
  %l.05.i12 = phi i32 [ %phitmp.i14, %.lr.ph7.i15 ], [ 1, %209 ]
  %p.04.i13 = phi %struct.IntList* [ %215, %.lr.ph7.i15 ], [ %211, %209 ]
  %214 = getelementptr inbounds %struct.IntList* %p.04.i13, i64 0, i32 1
  %215 = load %struct.IntList** %214, align 8, !tbaa !5
  %phitmp.i14 = add i32 %l.05.i12, 1
  %216 = icmp eq %struct.IntList* %215, null
  br i1 %216, label %.lr.ph.i21.preheader, label %.lr.ph7.i15

.lr.ph.i21.preheader:                             ; preds = %.lr.ph7.i15
  %phitmp10.i16 = sext i32 %phitmp.i14 to i64
  %217 = tail call noalias i8* @malloc(i64 %phitmp10.i16) #7
  br label %.lr.ph.i21

.lr.ph.i21:                                       ; preds = %.lr.ph.i21.preheader, %.lr.ph.i21
  %indvars.iv.i17 = phi i64 [ %indvars.iv.next.i20, %.lr.ph.i21 ], [ 0, %.lr.ph.i21.preheader ]
  %p1.03.i18 = phi %struct.IntList* [ %224, %.lr.ph.i21 ], [ %211, %.lr.ph.i21.preheader ]
  %i.02.i19 = phi i32 [ %222, %.lr.ph.i21 ], [ 0, %.lr.ph.i21.preheader ]
  %218 = getelementptr inbounds %struct.IntList* %p1.03.i18, i64 0, i32 0
  %219 = load i32* %218, align 4, !tbaa !9
  %220 = trunc i32 %219 to i8
  %221 = getelementptr inbounds i8* %217, i64 %indvars.iv.i17
  store i8 %220, i8* %221, align 1, !tbaa !10
  %indvars.iv.next.i20 = add nuw nsw i64 %indvars.iv.i17, 1
  %222 = add nsw i32 %i.02.i19, 1
  %223 = getelementptr inbounds %struct.IntList* %p1.03.i18, i64 0, i32 1
  %224 = load %struct.IntList** %223, align 8, !tbaa !5
  %225 = icmp eq %struct.IntList* %224, null
  br i1 %225, label %._crit_edge.i23, label %.lr.ph.i21

._crit_edge.i23:                                  ; preds = %.lr.ph.i21
  %phitmp11.i22 = sext i32 %222 to i64
  br label %convertIntListToString.exit25

convertIntListToString.exit25:                    ; preds = %.thread.i11, %._crit_edge.i23
  %226 = phi i8* [ %217, %._crit_edge.i23 ], [ %213, %.thread.i11 ]
  %i.0.lcssa.i24 = phi i64 [ %phitmp11.i22, %._crit_edge.i23 ], [ 0, %.thread.i11 ]
  %227 = getelementptr inbounds i8* %226, i64 %i.0.lcssa.i24
  store i8 0, i8* %227, align 1, !tbaa !10
  %228 = tail call i32 @system(i8* %226) #7
  tail call void @free(i8* %226) #7
  br label %.critedge

.critedge:                                        ; preds = %83, %78, %202, %196, %181, %171, %165, %160, %155, %149, %142, %136, %122, %133, %convertIntListToString.exit, %176, %192, %189, %186, %convertIntListToString.exit25, %207, %179, %147
  %resultcode.1 = phi i32 [ %148, %147 ], [ %177, %179 ], [ -1, %176 ], [ %187, %186 ], [ 0, %192 ], [ 0, %189 ], [ %208, %207 ], [ %228, %convertIntListToString.exit25 ], [ -1, %convertIntListToString.exit ], [ %files_buflen.0, %133 ], [ %i.053, %122 ], [ -2, %136 ], [ -2, %142 ], [ -2, %149 ], [ -2, %155 ], [ %., %160 ], [ -2, %165 ], [ -2, %171 ], [ -1, %181 ], [ -2, %196 ], [ -2, %202 ], [ 0, %78 ], [ -2, %83 ]
  %files_buflen.2 = phi i32 [ %files_buflen.0, %147 ], [ %files_buflen.0, %179 ], [ %files_buflen.0, %176 ], [ %files_buflen.0, %186 ], [ %files_buflen.0, %192 ], [ %files_buflen.0, %189 ], [ %files_buflen.0, %207 ], [ %files_buflen.0, %convertIntListToString.exit25 ], [ %files_buflen.0, %convertIntListToString.exit ], [ %135, %133 ], [ %files_buflen.0, %122 ], [ %files_buflen.0, %136 ], [ %files_buflen.0, %142 ], [ %files_buflen.0, %149 ], [ %files_buflen.0, %155 ], [ %files_buflen.0, %160 ], [ %files_buflen.0, %165 ], [ %files_buflen.0, %171 ], [ %files_buflen.0, %181 ], [ %files_buflen.0, %196 ], [ %files_buflen.0, %202 ], [ %files_buflen.0, %78 ], [ %files_buflen.0, %83 ]
  %files.2 = phi %struct._IO_FILE** [ %files.0, %147 ], [ %files.0, %179 ], [ %files.0, %176 ], [ %files.0, %186 ], [ %files.0, %192 ], [ %files.0, %189 ], [ %files.0, %207 ], [ %files.0, %convertIntListToString.exit25 ], [ %files.0, %convertIntListToString.exit ], [ %134, %133 ], [ %files.0, %122 ], [ %files.0, %136 ], [ %files.0, %142 ], [ %files.0, %149 ], [ %files.0, %155 ], [ %files.0, %160 ], [ %files.0, %165 ], [ %files.0, %171 ], [ %files.0, %181 ], [ %files.0, %196 ], [ %files.0, %202 ], [ %files.0, %78 ], [ %files.0, %83 ]
  %cur_arg.2 = phi i8* [ %cur_arg.1, %147 ], [ %cur_arg.1, %179 ], [ %cur_arg.1, %176 ], [ %188, %186 ], [ %195, %192 ], [ %cur_arg.1, %189 ], [ %cur_arg.1, %207 ], [ %cur_arg.1, %convertIntListToString.exit25 ], [ %cur_arg.1, %convertIntListToString.exit ], [ %cur_arg.1, %133 ], [ %cur_arg.1, %122 ], [ %cur_arg.1, %136 ], [ %cur_arg.1, %142 ], [ %cur_arg.1, %149 ], [ %cur_arg.1, %155 ], [ %cur_arg.1, %160 ], [ %cur_arg.1, %165 ], [ %cur_arg.1, %171 ], [ %cur_arg.1, %181 ], [ %cur_arg.1, %196 ], [ %cur_arg.1, %202 ], [ %cur_arg.1, %78 ], [ %cur_arg.1, %83 ]
  %cur_argi.1 = phi i32 [ %cur_argi.0, %147 ], [ %cur_argi.0, %179 ], [ %cur_argi.0, %176 ], [ %cur_argi.0, %186 ], [ %190, %192 ], [ %190, %189 ], [ %cur_argi.0, %207 ], [ %cur_argi.0, %convertIntListToString.exit25 ], [ %cur_argi.0, %convertIntListToString.exit ], [ %cur_argi.0, %133 ], [ %cur_argi.0, %122 ], [ %cur_argi.0, %136 ], [ %cur_argi.0, %142 ], [ %cur_argi.0, %149 ], [ %cur_argi.0, %155 ], [ %cur_argi.0, %160 ], [ %cur_argi.0, %165 ], [ %cur_argi.0, %171 ], [ %cur_argi.0, %181 ], [ %cur_argi.0, %196 ], [ %cur_argi.0, %202 ], [ %cur_argi.0, %78 ], [ %cur_argi.0, %83 ]
  %229 = load %struct.VExp** %49, align 8, !tbaa !18
  %230 = getelementptr inbounds %struct.VExp* %229, i64 0, i32 3, i32 0, i32 4
  %231 = load %struct.Value** %230, align 8, !tbaa !27
  %232 = tail call noalias i8* @malloc(i64 16) #7
  %233 = bitcast i8* %232 to %struct.Value**
  store %struct.Value* %231, %struct.Value** %233, align 8, !tbaa !47
  %234 = getelementptr inbounds i8* %232, i64 8
  %235 = bitcast i8* %234 to %struct.ValueStack**
  store %struct.ValueStack* null, %struct.ValueStack** %235, align 8, !tbaa !49
  %236 = icmp eq i8* %232, null
  br i1 %236, label %resolveAllValue.exit33, label %.lr.ph.lr.ph.i26

.lr.ph.lr.ph.i26:                                 ; preds = %.critedge
  %237 = bitcast i8* %232 to %struct.ValueStack*
  br label %.lr.ph.i28

.lr.ph.i28:                                       ; preds = %.outer.backedge.i32, %.lr.ph.lr.ph.i26
  %head.0.ph1.i27 = phi %struct.ValueStack* [ %237, %.lr.ph.lr.ph.i26 ], [ %head.0.ph.be.i31, %.outer.backedge.i32 ]
  %238 = getelementptr inbounds %struct.ValueStack* %head.0.ph1.i27, i64 0, i32 0
  %239 = load %struct.Value** %238, align 8, !tbaa !47
  %240 = getelementptr inbounds %struct.Value* %239, i64 0, i32 0
  %241 = load i32* %240, align 4, !tbaa !30
  %switch.i2958 = icmp ult i32 %241, 2
  br i1 %switch.i2958, label %.backedge.i30._crit_edge, label %.lr.ph59

.lr.ph59:                                         ; preds = %.lr.ph.i28, %.backedge.i30.backedge
  %242 = phi %struct.Value* [ %245, %.backedge.i30.backedge ], [ %239, %.lr.ph.i28 ]
  %243 = tail call %struct.Value* @resolveValue(%struct.Value* %242) #7
  %244 = icmp eq %struct.Value* %243, null
  %.pre = load %struct.Value** %238, align 8, !tbaa !47
  br i1 %244, label %.backedge.i30.backedge, label %248

.backedge.i30.backedge:                           ; preds = %.lr.ph59, %248
  %245 = phi %struct.Value* [ %243, %248 ], [ %.pre, %.lr.ph59 ]
  %246 = getelementptr inbounds %struct.Value* %245, i64 0, i32 0
  %247 = load i32* %246, align 4, !tbaa !30
  %switch.i29 = icmp ult i32 %247, 2
  br i1 %switch.i29, label %.backedge.i30._crit_edge, label %.lr.ph59

; <label>:248                                     ; preds = %.lr.ph59
  %249 = icmp eq %struct.Value* %243, %.pre
  br i1 %249, label %.backedge.i30.backedge, label %250

; <label>:250                                     ; preds = %248
  %251 = tail call noalias i8* @malloc(i64 16) #7
  %252 = bitcast i8* %251 to %struct.ValueStack*
  %253 = bitcast i8* %251 to %struct.Value**
  store %struct.Value* %243, %struct.Value** %253, align 8, !tbaa !47
  %254 = getelementptr inbounds i8* %251, i64 8
  %255 = bitcast i8* %254 to %struct.ValueStack**
  store %struct.ValueStack* %head.0.ph1.i27, %struct.ValueStack** %255, align 8, !tbaa !49
  br label %.outer.backedge.i32

.outer.backedge.i32:                              ; preds = %.backedge.i30._crit_edge, %250
  %head.0.ph.be.i31 = phi %struct.ValueStack* [ %252, %250 ], [ %258, %.backedge.i30._crit_edge ]
  %256 = icmp eq %struct.ValueStack* %head.0.ph.be.i31, null
  br i1 %256, label %resolveAllValue.exit33, label %.lr.ph.i28

.backedge.i30._crit_edge:                         ; preds = %.backedge.i30.backedge, %.lr.ph.i28
  %257 = getelementptr inbounds %struct.ValueStack* %head.0.ph1.i27, i64 0, i32 1
  %258 = load %struct.ValueStack** %257, align 8, !tbaa !49
  br label %.outer.backedge.i32

resolveAllValue.exit33:                           ; preds = %.outer.backedge.i32, %.critedge
  %259 = getelementptr inbounds %struct.Value* %231, i64 0, i32 0
  %260 = load i32* %259, align 4, !tbaa !30
  %261 = icmp eq i32 %260, 1
  br i1 %261, label %.backedge, label %262

; <label>:262                                     ; preds = %resolveAllValue.exit33
  %263 = load %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %264 = icmp eq %struct.Value* %263, null
  br i1 %264, label %265, label %newValue.exit

; <label>:265                                     ; preds = %262
  %266 = tail call noalias i8* @malloc(i64 40000) #7
  %267 = bitcast i8* %266 to %struct.Value*
  br label %268

; <label>:268                                     ; preds = %268, %265
  %indvars.iv.i.i = phi i64 [ 0, %265 ], [ %indvars.iv.next.i.i, %268 ]
  %269 = phi %struct.Value* [ null, %265 ], [ %270, %268 ]
  %270 = getelementptr inbounds %struct.Value* %267, i64 %indvars.iv.i.i
  %271 = getelementptr inbounds %struct.Value* %267, i64 %indvars.iv.i.i, i32 1, i32 0, i32 0
  %.c.i.i = bitcast %struct.Value* %269 to %struct.VExp*
  store %struct.VExp* %.c.i.i, %struct.VExp** %271, align 8, !tbaa !1
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %exitcond.i.i = icmp eq i64 %indvars.iv.next.i.i, 1000
  br i1 %exitcond.i.i, label %.loopexit.i.i, label %268

.loopexit.i.i:                                    ; preds = %268
  %scevgep.i.i = getelementptr i8* %266, i64 39960
  %scevgep4.i.i = bitcast i8* %scevgep.i.i to %struct.Value*
  store %struct.Value* %scevgep4.i.i, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  br label %newValue.exit

newValue.exit:                                    ; preds = %262, %.loopexit.i.i
  %272 = phi %struct.Value* [ %scevgep4.i.i, %.loopexit.i.i ], [ %263, %262 ]
  %273 = getelementptr inbounds %struct.Value* %272, i64 0, i32 2
  store i32 1, i32* %273, align 4, !tbaa !28
  %274 = getelementptr inbounds %struct.Value* %272, i64 0, i32 1
  %275 = bitcast %union.anon.0* %274 to %struct.Value**
  %276 = load %struct.Value** %275, align 8, !tbaa !1
  store %struct.Value* %276, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %277 = getelementptr inbounds %struct.Value* %272, i64 0, i32 0
  store i32 0, i32* %277, align 4, !tbaa !30
  %278 = zext i32 %resultcode.1 to i64
  %279 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %280 = icmp eq %struct.VExp* %279, null
  br i1 %280, label %281, label %newVExpNum.exit

; <label>:281                                     ; preds = %newValue.exit
  %282 = tail call noalias i8* @malloc(i64 56000) #7
  %283 = bitcast i8* %282 to %struct.VExp*
  br label %284

; <label>:284                                     ; preds = %284, %281
  %indvars.iv.i.i34 = phi i64 [ 0, %281 ], [ %indvars.iv.next.i.i35, %284 ]
  %285 = phi %struct.VExp* [ null, %281 ], [ %286, %284 ]
  %286 = getelementptr inbounds %struct.VExp* %283, i64 %indvars.iv.i.i34
  %287 = getelementptr inbounds %struct.VExp* %283, i64 %indvars.iv.i.i34, i32 3
  %288 = bitcast %union.anon.1* %287 to %struct.VExp**
  store %struct.VExp* %285, %struct.VExp** %288, align 8, !tbaa !1
  %indvars.iv.next.i.i35 = add nuw nsw i64 %indvars.iv.i.i34, 1
  %exitcond.i.i36 = icmp eq i64 %indvars.iv.next.i.i35, 1000
  br i1 %exitcond.i.i36, label %.loopexit.i.i38, label %284

.loopexit.i.i38:                                  ; preds = %284
  %scevgep.i.i37 = getelementptr i8* %282, i64 55944
  %scevgep3.i.i = bitcast i8* %scevgep.i.i37 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNum.exit

newVExpNum.exit:                                  ; preds = %newValue.exit, %.loopexit.i.i38
  %289 = phi %struct.VExp* [ %scevgep3.i.i, %.loopexit.i.i38 ], [ %279, %newValue.exit ]
  %290 = getelementptr inbounds %struct.VExp* %289, i64 0, i32 4
  store i32 1, i32* %290, align 4, !tbaa !17
  %291 = getelementptr inbounds %struct.VExp* %289, i64 0, i32 3
  %292 = bitcast %union.anon.1* %291 to %struct.VExp**
  %293 = load %struct.VExp** %292, align 8, !tbaa !1
  store %struct.VExp* %293, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %294 = getelementptr inbounds %struct.VExp* %289, i64 0, i32 0
  store i32 0, i32* %294, align 4, !tbaa !15
  %295 = getelementptr inbounds %struct.VExp* %289, i64 0, i32 3, i32 0, i32 0
  store i32 0, i32* %295, align 8
  %296 = getelementptr inbounds %struct.VExp* %289, i64 0, i32 3, i32 0, i32 2, i32 0
  %num_val.coerce1.c.i = inttoptr i64 %278 to %struct.IntList*
  store %struct.IntList* %num_val.coerce1.c.i, %struct.IntList** %296, align 8
  %297 = getelementptr inbounds %struct.Value* %272, i64 0, i32 1, i32 0, i32 0
  store %struct.VExp* %289, %struct.VExp** %297, align 8, !tbaa !18
  %298 = getelementptr inbounds %struct.Value* %272, i64 0, i32 1, i32 0, i32 1
  store %struct.VContext* null, %struct.VContext** %298, align 8, !tbaa !20
  %299 = tail call noalias i8* @malloc(i64 32) #7
  %300 = bitcast i8* %299 to %struct.Continuation*
  %301 = bitcast i8* %299 to i32*
  store i32 1, i32* %301, align 4, !tbaa !42
  %302 = getelementptr inbounds i8* %299, i64 8
  %303 = bitcast i8* %302 to %struct.VExp**
  %.c = bitcast %struct.Value* %272 to %struct.VExp*
  store %struct.VExp* %.c, %struct.VExp** %303, align 8, !tbaa !21
  %304 = getelementptr inbounds i8* %299, i64 24
  %305 = bitcast i8* %304 to %struct.Continuation**
  store %struct.Continuation* null, %struct.Continuation** %305, align 8, !tbaa !44
  %306 = load %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %307 = icmp eq %struct.Value* %306, null
  br i1 %307, label %308, label %newValue.exit46

; <label>:308                                     ; preds = %newVExpNum.exit
  %309 = tail call noalias i8* @malloc(i64 40000) #7
  %310 = bitcast i8* %309 to %struct.Value*
  br label %311

; <label>:311                                     ; preds = %311, %308
  %indvars.iv.i.i39 = phi i64 [ 0, %308 ], [ %indvars.iv.next.i.i41, %311 ]
  %312 = phi %struct.Value* [ null, %308 ], [ %313, %311 ]
  %313 = getelementptr inbounds %struct.Value* %310, i64 %indvars.iv.i.i39
  %314 = getelementptr inbounds %struct.Value* %310, i64 %indvars.iv.i.i39, i32 1, i32 0, i32 0
  %.c.i.i40 = bitcast %struct.Value* %312 to %struct.VExp*
  store %struct.VExp* %.c.i.i40, %struct.VExp** %314, align 8, !tbaa !1
  %indvars.iv.next.i.i41 = add nuw nsw i64 %indvars.iv.i.i39, 1
  %exitcond.i.i42 = icmp eq i64 %indvars.iv.next.i.i41, 1000
  br i1 %exitcond.i.i42, label %.loopexit.i.i45, label %311

.loopexit.i.i45:                                  ; preds = %311
  %scevgep.i.i43 = getelementptr i8* %309, i64 39960
  %scevgep4.i.i44 = bitcast i8* %scevgep.i.i43 to %struct.Value*
  store %struct.Value* %scevgep4.i.i44, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  br label %newValue.exit46

newValue.exit46:                                  ; preds = %newVExpNum.exit, %.loopexit.i.i45
  %315 = phi %struct.Value* [ %scevgep4.i.i44, %.loopexit.i.i45 ], [ %306, %newVExpNum.exit ]
  %316 = getelementptr inbounds %struct.Value* %315, i64 0, i32 2
  store i32 1, i32* %316, align 4, !tbaa !28
  %317 = getelementptr inbounds %struct.Value* %315, i64 0, i32 1
  %318 = bitcast %union.anon.0* %317 to %struct.Value**
  %319 = load %struct.Value** %318, align 8, !tbaa !1
  store %struct.Value* %319, %struct.Value** @allocateValue.pool, align 8, !tbaa !1
  %320 = getelementptr inbounds %struct.Value* %315, i64 0, i32 0
  store i32 2, i32* %320, align 4, !tbaa !30
  %321 = getelementptr inbounds %struct.Value* %231, i64 0, i32 1, i32 0, i32 0
  %322 = load %struct.VExp** %321, align 8, !tbaa !18
  %323 = getelementptr inbounds %struct.Value* %315, i64 0, i32 1, i32 0, i32 0
  store %struct.VExp* %322, %struct.VExp** %323, align 8, !tbaa !31
  %324 = getelementptr inbounds %struct.Value* %231, i64 0, i32 1, i32 0, i32 1
  %325 = load %struct.VContext** %324, align 8, !tbaa !20
  %326 = getelementptr inbounds %struct.Value* %315, i64 0, i32 1, i32 0, i32 1
  store %struct.VContext* %325, %struct.VContext** %326, align 8, !tbaa !33
  %327 = getelementptr inbounds %struct.Value* %315, i64 0, i32 1, i32 0, i32 2
  store %struct.Continuation* %300, %struct.Continuation** %327, align 8, !tbaa !34
  br label %.backedge

; <label>:328                                     ; preds = %79, %77, %displayExp.exit, %44
  %exitcode.0 = phi i32 [ 1, %44 ], [ 0, %displayExp.exit ], [ 1, %77 ], [ %82, %79 ]
  %329 = bitcast %struct._IO_FILE** %files.0 to i8*
  tail call void @free(i8* %329) #7
  ret i32 %exitcode.0
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

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
  br i1 %phitmp, label %418, label %11

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
  %phitmp216 = icmp eq i32 %__result4.0, 0
  br i1 %phitmp216, label %418, label %20

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
  %phitmp217 = icmp eq i32 %__result8.0, 0
  br i1 %phitmp217, label %418, label %29

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
  %phitmp218 = icmp eq i32 %__result12.0, 0
  br i1 %phitmp218, label %418, label %38

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
  %phitmp219 = icmp eq i32 %__result16.0, 0
  br i1 %phitmp219, label %418, label %47

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
  %phitmp220 = icmp eq i32 %__result20.0, 0
  br i1 %phitmp220, label %418, label %56

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
  %phitmp221 = icmp eq i32 %__result24.0, 0
  br i1 %phitmp221, label %418, label %71

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
  %phitmp222 = icmp eq i32 %__result28.0, 0
  br i1 %phitmp222, label %418, label %78

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
  %phitmp223 = icmp eq i32 %__result32.0, 0
  br i1 %phitmp223, label %418, label %91

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
  %phitmp224 = icmp eq i32 %__result36.0, 0
  br i1 %phitmp224, label %418, label %104

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
  %phitmp225 = icmp eq i32 %__result40.0, 0
  br i1 %phitmp225, label %418, label %113

; <label>:113                                     ; preds = %112
  %114 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([6 x i8]* @.str29, i64 0, i64 0)) #7
  %115 = icmp eq i32 %114, 0
  br i1 %115, label %418, label %116

; <label>:116                                     ; preds = %113
  %117 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([8 x i8]* @.str30, i64 0, i64 0)) #7
  %118 = icmp eq i32 %117, 0
  br i1 %118, label %418, label %119

; <label>:119                                     ; preds = %116
  %120 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([5 x i8]* @.str31, i64 0, i64 0)) #7
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
  br label %436

; <label>:141                                     ; preds = %119
  %142 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([8 x i8]* @.str32, i64 0, i64 0)) #7
  %143 = icmp eq i32 %142, 0
  br i1 %143, label %144, label %197

; <label>:144                                     ; preds = %141
  %145 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %146 = icmp eq %struct.VExp* %145, null
  br i1 %146, label %147, label %newVExpSyscall0.exit232

; <label>:147                                     ; preds = %144
  %148 = tail call noalias i8* @malloc(i64 56000) #7
  %149 = bitcast i8* %148 to %struct.VExp*
  br label %150

; <label>:150                                     ; preds = %150, %147
  %indvars.iv.i.i226 = phi i64 [ 0, %147 ], [ %indvars.iv.next.i.i227, %150 ]
  %151 = phi %struct.VExp* [ null, %147 ], [ %152, %150 ]
  %152 = getelementptr inbounds %struct.VExp* %149, i64 %indvars.iv.i.i226
  %153 = getelementptr inbounds %struct.VExp* %149, i64 %indvars.iv.i.i226, i32 3
  %154 = bitcast %union.anon.1* %153 to %struct.VExp**
  store %struct.VExp* %151, %struct.VExp** %154, align 8, !tbaa !1
  %indvars.iv.next.i.i227 = add nuw nsw i64 %indvars.iv.i.i226, 1
  %exitcond.i.i228 = icmp eq i64 %indvars.iv.next.i.i227, 1000
  br i1 %exitcond.i.i228, label %.loopexit.i.i231, label %150

.loopexit.i.i231:                                 ; preds = %150
  %scevgep.i.i229 = getelementptr i8* %148, i64 55944
  %scevgep3.i.i230 = bitcast i8* %scevgep.i.i229 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i230, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit232

newVExpSyscall0.exit232:                          ; preds = %144, %.loopexit.i.i231
  %155 = phi %struct.VExp* [ %scevgep3.i.i230, %.loopexit.i.i231 ], [ %145, %144 ]
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

; <label>:164                                     ; preds = %newVExpSyscall0.exit232
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

makeInt.exit:                                     ; preds = %newVExpSyscall0.exit232, %.loopexit.i.i.i
  %172 = phi %struct.VExp* [ %scevgep3.i.i.i, %.loopexit.i.i.i ], [ %159, %newVExpSyscall0.exit232 ]
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
  %indvars.iv.i.i233 = phi i64 [ 0, %182 ], [ %indvars.iv.next.i.i234, %185 ]
  %186 = phi %struct.VExp* [ null, %182 ], [ %187, %185 ]
  %187 = getelementptr inbounds %struct.VExp* %184, i64 %indvars.iv.i.i233
  %188 = getelementptr inbounds %struct.VExp* %184, i64 %indvars.iv.i.i233, i32 3
  %189 = bitcast %union.anon.1* %188 to %struct.VExp**
  store %struct.VExp* %186, %struct.VExp** %189, align 8, !tbaa !1
  %indvars.iv.next.i.i234 = add nuw nsw i64 %indvars.iv.i.i233, 1
  %exitcond.i.i235 = icmp eq i64 %indvars.iv.next.i.i234, 1000
  br i1 %exitcond.i.i235, label %.loopexit.i.i238, label %185

.loopexit.i.i238:                                 ; preds = %185
  %scevgep.i.i236 = getelementptr i8* %183, i64 55944
  %scevgep3.i.i237 = bitcast i8* %scevgep.i.i236 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i237, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpApply.exit

newVExpApply.exit:                                ; preds = %makeInt.exit, %.loopexit.i.i238
  %190 = phi %struct.VExp* [ %scevgep3.i.i237, %.loopexit.i.i238 ], [ %180, %makeInt.exit ]
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
  br label %436

; <label>:197                                     ; preds = %141
  %198 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([9 x i8]* @.str33, i64 0, i64 0)) #7
  %199 = icmp eq i32 %198, 0
  br i1 %199, label %200, label %219

; <label>:200                                     ; preds = %197
  %201 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %202 = icmp eq %struct.VExp* %201, null
  br i1 %202, label %203, label %newVExpSyscall0.exit245

; <label>:203                                     ; preds = %200
  %204 = tail call noalias i8* @malloc(i64 56000) #7
  %205 = bitcast i8* %204 to %struct.VExp*
  br label %206

; <label>:206                                     ; preds = %206, %203
  %indvars.iv.i.i239 = phi i64 [ 0, %203 ], [ %indvars.iv.next.i.i240, %206 ]
  %207 = phi %struct.VExp* [ null, %203 ], [ %208, %206 ]
  %208 = getelementptr inbounds %struct.VExp* %205, i64 %indvars.iv.i.i239
  %209 = getelementptr inbounds %struct.VExp* %205, i64 %indvars.iv.i.i239, i32 3
  %210 = bitcast %union.anon.1* %209 to %struct.VExp**
  store %struct.VExp* %207, %struct.VExp** %210, align 8, !tbaa !1
  %indvars.iv.next.i.i240 = add nuw nsw i64 %indvars.iv.i.i239, 1
  %exitcond.i.i241 = icmp eq i64 %indvars.iv.next.i.i240, 1000
  br i1 %exitcond.i.i241, label %.loopexit.i.i244, label %206

.loopexit.i.i244:                                 ; preds = %206
  %scevgep.i.i242 = getelementptr i8* %204, i64 55944
  %scevgep3.i.i243 = bitcast i8* %scevgep.i.i242 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i243, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit245

newVExpSyscall0.exit245:                          ; preds = %200, %.loopexit.i.i244
  %211 = phi %struct.VExp* [ %scevgep3.i.i243, %.loopexit.i.i244 ], [ %201, %200 ]
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
  br label %436

; <label>:219                                     ; preds = %197
  %220 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([8 x i8]* @.str34, i64 0, i64 0)) #7
  %221 = icmp eq i32 %220, 0
  br i1 %221, label %222, label %275

; <label>:222                                     ; preds = %219
  %223 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %224 = icmp eq %struct.VExp* %223, null
  br i1 %224, label %225, label %newVExpSyscall0.exit252

; <label>:225                                     ; preds = %222
  %226 = tail call noalias i8* @malloc(i64 56000) #7
  %227 = bitcast i8* %226 to %struct.VExp*
  br label %228

; <label>:228                                     ; preds = %228, %225
  %indvars.iv.i.i246 = phi i64 [ 0, %225 ], [ %indvars.iv.next.i.i247, %228 ]
  %229 = phi %struct.VExp* [ null, %225 ], [ %230, %228 ]
  %230 = getelementptr inbounds %struct.VExp* %227, i64 %indvars.iv.i.i246
  %231 = getelementptr inbounds %struct.VExp* %227, i64 %indvars.iv.i.i246, i32 3
  %232 = bitcast %union.anon.1* %231 to %struct.VExp**
  store %struct.VExp* %229, %struct.VExp** %232, align 8, !tbaa !1
  %indvars.iv.next.i.i247 = add nuw nsw i64 %indvars.iv.i.i246, 1
  %exitcond.i.i248 = icmp eq i64 %indvars.iv.next.i.i247, 1000
  br i1 %exitcond.i.i248, label %.loopexit.i.i251, label %228

.loopexit.i.i251:                                 ; preds = %228
  %scevgep.i.i249 = getelementptr i8* %226, i64 55944
  %scevgep3.i.i250 = bitcast i8* %scevgep.i.i249 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i250, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit252

newVExpSyscall0.exit252:                          ; preds = %222, %.loopexit.i.i251
  %233 = phi %struct.VExp* [ %scevgep3.i.i250, %.loopexit.i.i251 ], [ %223, %222 ]
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
  br i1 %241, label %242, label %makeInt.exit259

; <label>:242                                     ; preds = %newVExpSyscall0.exit252
  %243 = tail call noalias i8* @malloc(i64 56000) #7
  %244 = bitcast i8* %243 to %struct.VExp*
  br label %245

; <label>:245                                     ; preds = %245, %242
  %indvars.iv.i.i.i253 = phi i64 [ 0, %242 ], [ %indvars.iv.next.i.i.i254, %245 ]
  %246 = phi %struct.VExp* [ null, %242 ], [ %247, %245 ]
  %247 = getelementptr inbounds %struct.VExp* %244, i64 %indvars.iv.i.i.i253
  %248 = getelementptr inbounds %struct.VExp* %244, i64 %indvars.iv.i.i.i253, i32 3
  %249 = bitcast %union.anon.1* %248 to %struct.VExp**
  store %struct.VExp* %246, %struct.VExp** %249, align 8, !tbaa !1
  %indvars.iv.next.i.i.i254 = add nuw nsw i64 %indvars.iv.i.i.i253, 1
  %exitcond.i.i.i255 = icmp eq i64 %indvars.iv.next.i.i.i254, 1000
  br i1 %exitcond.i.i.i255, label %.loopexit.i.i.i258, label %245

.loopexit.i.i.i258:                               ; preds = %245
  %scevgep.i.i.i256 = getelementptr i8* %243, i64 55944
  %scevgep3.i.i.i257 = bitcast i8* %scevgep.i.i.i256 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i.i257, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %makeInt.exit259

makeInt.exit259:                                  ; preds = %newVExpSyscall0.exit252, %.loopexit.i.i.i258
  %250 = phi %struct.VExp* [ %scevgep3.i.i.i257, %.loopexit.i.i.i258 ], [ %237, %newVExpSyscall0.exit252 ]
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
  br i1 %259, label %260, label %newVExpApply.exit267

; <label>:260                                     ; preds = %makeInt.exit259
  %261 = tail call noalias i8* @malloc(i64 56000) #7
  %262 = bitcast i8* %261 to %struct.VExp*
  br label %263

; <label>:263                                     ; preds = %263, %260
  %indvars.iv.i.i260 = phi i64 [ 0, %260 ], [ %indvars.iv.next.i.i261, %263 ]
  %264 = phi %struct.VExp* [ null, %260 ], [ %265, %263 ]
  %265 = getelementptr inbounds %struct.VExp* %262, i64 %indvars.iv.i.i260
  %266 = getelementptr inbounds %struct.VExp* %262, i64 %indvars.iv.i.i260, i32 3
  %267 = bitcast %union.anon.1* %266 to %struct.VExp**
  store %struct.VExp* %264, %struct.VExp** %267, align 8, !tbaa !1
  %indvars.iv.next.i.i261 = add nuw nsw i64 %indvars.iv.i.i260, 1
  %exitcond.i.i262 = icmp eq i64 %indvars.iv.next.i.i261, 1000
  br i1 %exitcond.i.i262, label %.loopexit.i.i265, label %263

.loopexit.i.i265:                                 ; preds = %263
  %scevgep.i.i263 = getelementptr i8* %261, i64 55944
  %scevgep3.i.i264 = bitcast i8* %scevgep.i.i263 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i264, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpApply.exit267

newVExpApply.exit267:                             ; preds = %makeInt.exit259, %.loopexit.i.i265
  %268 = phi %struct.VExp* [ %scevgep3.i.i264, %.loopexit.i.i265 ], [ %258, %makeInt.exit259 ]
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
  %ap_x.c.i266 = bitcast %struct.VExp* %250 to %struct.IntList*
  store %struct.IntList* %ap_x.c.i266, %struct.IntList** %274, align 8, !tbaa !20
  br label %436

; <label>:275                                     ; preds = %219
  %276 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([9 x i8]* @.str35, i64 0, i64 0)) #7
  %277 = icmp eq i32 %276, 0
  br i1 %277, label %278, label %297

; <label>:278                                     ; preds = %275
  %279 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %280 = icmp eq %struct.VExp* %279, null
  br i1 %280, label %281, label %newVExpSyscall0.exit274

; <label>:281                                     ; preds = %278
  %282 = tail call noalias i8* @malloc(i64 56000) #7
  %283 = bitcast i8* %282 to %struct.VExp*
  br label %284

; <label>:284                                     ; preds = %284, %281
  %indvars.iv.i.i268 = phi i64 [ 0, %281 ], [ %indvars.iv.next.i.i269, %284 ]
  %285 = phi %struct.VExp* [ null, %281 ], [ %286, %284 ]
  %286 = getelementptr inbounds %struct.VExp* %283, i64 %indvars.iv.i.i268
  %287 = getelementptr inbounds %struct.VExp* %283, i64 %indvars.iv.i.i268, i32 3
  %288 = bitcast %union.anon.1* %287 to %struct.VExp**
  store %struct.VExp* %285, %struct.VExp** %288, align 8, !tbaa !1
  %indvars.iv.next.i.i269 = add nuw nsw i64 %indvars.iv.i.i268, 1
  %exitcond.i.i270 = icmp eq i64 %indvars.iv.next.i.i269, 1000
  br i1 %exitcond.i.i270, label %.loopexit.i.i273, label %284

.loopexit.i.i273:                                 ; preds = %284
  %scevgep.i.i271 = getelementptr i8* %282, i64 55944
  %scevgep3.i.i272 = bitcast i8* %scevgep.i.i271 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i272, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit274

newVExpSyscall0.exit274:                          ; preds = %278, %.loopexit.i.i273
  %289 = phi %struct.VExp* [ %scevgep3.i.i272, %.loopexit.i.i273 ], [ %279, %278 ]
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
  br label %436

; <label>:297                                     ; preds = %275
  %298 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([9 x i8]* @.str36, i64 0, i64 0)) #7
  %299 = icmp eq i32 %298, 0
  br i1 %299, label %300, label %353

; <label>:300                                     ; preds = %297
  %301 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %302 = icmp eq %struct.VExp* %301, null
  br i1 %302, label %303, label %newVExpSyscall0.exit281

; <label>:303                                     ; preds = %300
  %304 = tail call noalias i8* @malloc(i64 56000) #7
  %305 = bitcast i8* %304 to %struct.VExp*
  br label %306

; <label>:306                                     ; preds = %306, %303
  %indvars.iv.i.i275 = phi i64 [ 0, %303 ], [ %indvars.iv.next.i.i276, %306 ]
  %307 = phi %struct.VExp* [ null, %303 ], [ %308, %306 ]
  %308 = getelementptr inbounds %struct.VExp* %305, i64 %indvars.iv.i.i275
  %309 = getelementptr inbounds %struct.VExp* %305, i64 %indvars.iv.i.i275, i32 3
  %310 = bitcast %union.anon.1* %309 to %struct.VExp**
  store %struct.VExp* %307, %struct.VExp** %310, align 8, !tbaa !1
  %indvars.iv.next.i.i276 = add nuw nsw i64 %indvars.iv.i.i275, 1
  %exitcond.i.i277 = icmp eq i64 %indvars.iv.next.i.i276, 1000
  br i1 %exitcond.i.i277, label %.loopexit.i.i280, label %306

.loopexit.i.i280:                                 ; preds = %306
  %scevgep.i.i278 = getelementptr i8* %304, i64 55944
  %scevgep3.i.i279 = bitcast i8* %scevgep.i.i278 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i279, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit281

newVExpSyscall0.exit281:                          ; preds = %300, %.loopexit.i.i280
  %311 = phi %struct.VExp* [ %scevgep3.i.i279, %.loopexit.i.i280 ], [ %301, %300 ]
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
  br i1 %319, label %320, label %makeInt.exit288

; <label>:320                                     ; preds = %newVExpSyscall0.exit281
  %321 = tail call noalias i8* @malloc(i64 56000) #7
  %322 = bitcast i8* %321 to %struct.VExp*
  br label %323

; <label>:323                                     ; preds = %323, %320
  %indvars.iv.i.i.i282 = phi i64 [ 0, %320 ], [ %indvars.iv.next.i.i.i283, %323 ]
  %324 = phi %struct.VExp* [ null, %320 ], [ %325, %323 ]
  %325 = getelementptr inbounds %struct.VExp* %322, i64 %indvars.iv.i.i.i282
  %326 = getelementptr inbounds %struct.VExp* %322, i64 %indvars.iv.i.i.i282, i32 3
  %327 = bitcast %union.anon.1* %326 to %struct.VExp**
  store %struct.VExp* %324, %struct.VExp** %327, align 8, !tbaa !1
  %indvars.iv.next.i.i.i283 = add nuw nsw i64 %indvars.iv.i.i.i282, 1
  %exitcond.i.i.i284 = icmp eq i64 %indvars.iv.next.i.i.i283, 1000
  br i1 %exitcond.i.i.i284, label %.loopexit.i.i.i287, label %323

.loopexit.i.i.i287:                               ; preds = %323
  %scevgep.i.i.i285 = getelementptr i8* %321, i64 55944
  %scevgep3.i.i.i286 = bitcast i8* %scevgep.i.i.i285 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i.i286, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %makeInt.exit288

makeInt.exit288:                                  ; preds = %newVExpSyscall0.exit281, %.loopexit.i.i.i287
  %328 = phi %struct.VExp* [ %scevgep3.i.i.i286, %.loopexit.i.i.i287 ], [ %315, %newVExpSyscall0.exit281 ]
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
  br i1 %337, label %338, label %newVExpApply.exit296

; <label>:338                                     ; preds = %makeInt.exit288
  %339 = tail call noalias i8* @malloc(i64 56000) #7
  %340 = bitcast i8* %339 to %struct.VExp*
  br label %341

; <label>:341                                     ; preds = %341, %338
  %indvars.iv.i.i289 = phi i64 [ 0, %338 ], [ %indvars.iv.next.i.i290, %341 ]
  %342 = phi %struct.VExp* [ null, %338 ], [ %343, %341 ]
  %343 = getelementptr inbounds %struct.VExp* %340, i64 %indvars.iv.i.i289
  %344 = getelementptr inbounds %struct.VExp* %340, i64 %indvars.iv.i.i289, i32 3
  %345 = bitcast %union.anon.1* %344 to %struct.VExp**
  store %struct.VExp* %342, %struct.VExp** %345, align 8, !tbaa !1
  %indvars.iv.next.i.i290 = add nuw nsw i64 %indvars.iv.i.i289, 1
  %exitcond.i.i291 = icmp eq i64 %indvars.iv.next.i.i290, 1000
  br i1 %exitcond.i.i291, label %.loopexit.i.i294, label %341

.loopexit.i.i294:                                 ; preds = %341
  %scevgep.i.i292 = getelementptr i8* %339, i64 55944
  %scevgep3.i.i293 = bitcast i8* %scevgep.i.i292 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i293, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpApply.exit296

newVExpApply.exit296:                             ; preds = %makeInt.exit288, %.loopexit.i.i294
  %346 = phi %struct.VExp* [ %scevgep3.i.i293, %.loopexit.i.i294 ], [ %336, %makeInt.exit288 ]
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
  %ap_x.c.i295 = bitcast %struct.VExp* %328 to %struct.IntList*
  store %struct.IntList* %ap_x.c.i295, %struct.IntList** %352, align 8, !tbaa !20
  br label %436

; <label>:353                                     ; preds = %297
  %354 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([10 x i8]* @.str37, i64 0, i64 0)) #7
  %355 = icmp eq i32 %354, 0
  br i1 %355, label %356, label %375

; <label>:356                                     ; preds = %353
  %357 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %358 = icmp eq %struct.VExp* %357, null
  br i1 %358, label %359, label %newVExpSyscall0.exit303

; <label>:359                                     ; preds = %356
  %360 = tail call noalias i8* @malloc(i64 56000) #7
  %361 = bitcast i8* %360 to %struct.VExp*
  br label %362

; <label>:362                                     ; preds = %362, %359
  %indvars.iv.i.i297 = phi i64 [ 0, %359 ], [ %indvars.iv.next.i.i298, %362 ]
  %363 = phi %struct.VExp* [ null, %359 ], [ %364, %362 ]
  %364 = getelementptr inbounds %struct.VExp* %361, i64 %indvars.iv.i.i297
  %365 = getelementptr inbounds %struct.VExp* %361, i64 %indvars.iv.i.i297, i32 3
  %366 = bitcast %union.anon.1* %365 to %struct.VExp**
  store %struct.VExp* %363, %struct.VExp** %366, align 8, !tbaa !1
  %indvars.iv.next.i.i298 = add nuw nsw i64 %indvars.iv.i.i297, 1
  %exitcond.i.i299 = icmp eq i64 %indvars.iv.next.i.i298, 1000
  br i1 %exitcond.i.i299, label %.loopexit.i.i302, label %362

.loopexit.i.i302:                                 ; preds = %362
  %scevgep.i.i300 = getelementptr i8* %360, i64 55944
  %scevgep3.i.i301 = bitcast i8* %scevgep.i.i300 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i301, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit303

newVExpSyscall0.exit303:                          ; preds = %356, %.loopexit.i.i302
  %367 = phi %struct.VExp* [ %scevgep3.i.i301, %.loopexit.i.i302 ], [ %357, %356 ]
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
  br label %436

; <label>:375                                     ; preds = %353
  %376 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([6 x i8]* @.str38, i64 0, i64 0)) #7
  %377 = icmp eq i32 %376, 0
  br i1 %377, label %378, label %397

; <label>:378                                     ; preds = %375
  %379 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %380 = icmp eq %struct.VExp* %379, null
  br i1 %380, label %381, label %newVExpSyscall0.exit310

; <label>:381                                     ; preds = %378
  %382 = tail call noalias i8* @malloc(i64 56000) #7
  %383 = bitcast i8* %382 to %struct.VExp*
  br label %384

; <label>:384                                     ; preds = %384, %381
  %indvars.iv.i.i304 = phi i64 [ 0, %381 ], [ %indvars.iv.next.i.i305, %384 ]
  %385 = phi %struct.VExp* [ null, %381 ], [ %386, %384 ]
  %386 = getelementptr inbounds %struct.VExp* %383, i64 %indvars.iv.i.i304
  %387 = getelementptr inbounds %struct.VExp* %383, i64 %indvars.iv.i.i304, i32 3
  %388 = bitcast %union.anon.1* %387 to %struct.VExp**
  store %struct.VExp* %385, %struct.VExp** %388, align 8, !tbaa !1
  %indvars.iv.next.i.i305 = add nuw nsw i64 %indvars.iv.i.i304, 1
  %exitcond.i.i306 = icmp eq i64 %indvars.iv.next.i.i305, 1000
  br i1 %exitcond.i.i306, label %.loopexit.i.i309, label %384

.loopexit.i.i309:                                 ; preds = %384
  %scevgep.i.i307 = getelementptr i8* %382, i64 55944
  %scevgep3.i.i308 = bitcast i8* %scevgep.i.i307 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i308, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpSyscall0.exit310

newVExpSyscall0.exit310:                          ; preds = %378, %.loopexit.i.i309
  %389 = phi %struct.VExp* [ %scevgep3.i.i308, %.loopexit.i.i309 ], [ %379, %378 ]
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
  br label %436

; <label>:397                                     ; preds = %375
  %398 = tail call i32 @strcmp(i8* %func_name, i8* getelementptr inbounds ([12 x i8]* @.str39, i64 0, i64 0)) #7
  %399 = icmp eq i32 %398, 0
  br i1 %399, label %400, label %436

; <label>:400                                     ; preds = %397
  %401 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %402 = icmp eq %struct.VExp* %401, null
  br i1 %402, label %403, label %newVExpIntList.exit

; <label>:403                                     ; preds = %400
  %404 = tail call noalias i8* @malloc(i64 56000) #7
  %405 = bitcast i8* %404 to %struct.VExp*
  br label %406

; <label>:406                                     ; preds = %406, %403
  %indvars.iv.i.i311 = phi i64 [ 0, %403 ], [ %indvars.iv.next.i.i312, %406 ]
  %407 = phi %struct.VExp* [ null, %403 ], [ %408, %406 ]
  %408 = getelementptr inbounds %struct.VExp* %405, i64 %indvars.iv.i.i311
  %409 = getelementptr inbounds %struct.VExp* %405, i64 %indvars.iv.i.i311, i32 3
  %410 = bitcast %union.anon.1* %409 to %struct.VExp**
  store %struct.VExp* %407, %struct.VExp** %410, align 8, !tbaa !1
  %indvars.iv.next.i.i312 = add nuw nsw i64 %indvars.iv.i.i311, 1
  %exitcond.i.i313 = icmp eq i64 %indvars.iv.next.i.i312, 1000
  br i1 %exitcond.i.i313, label %.loopexit.i.i316, label %406

.loopexit.i.i316:                                 ; preds = %406
  %scevgep.i.i314 = getelementptr i8* %404, i64 55944
  %scevgep3.i.i315 = bitcast i8* %scevgep.i.i314 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i315, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpIntList.exit

newVExpIntList.exit:                              ; preds = %400, %.loopexit.i.i316
  %411 = phi %struct.VExp* [ %scevgep3.i.i315, %.loopexit.i.i316 ], [ %401, %400 ]
  %412 = getelementptr inbounds %struct.VExp* %411, i64 0, i32 4
  store i32 1, i32* %412, align 4, !tbaa !17
  %413 = getelementptr inbounds %struct.VExp* %411, i64 0, i32 3
  %414 = bitcast %union.anon.1* %413 to %struct.VExp**
  %415 = load %struct.VExp** %414, align 8, !tbaa !1
  store %struct.VExp* %415, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %416 = getelementptr inbounds %struct.VExp* %411, i64 0, i32 0
  store i32 4, i32* %416, align 4, !tbaa !15
  %417 = bitcast %union.anon.1* %413 to %struct.IntList**
  store %struct.IntList* null, %struct.IntList** %417, align 8, !tbaa !21
  br label %436

; <label>:418                                     ; preds = %10, %19, %28, %37, %46, %55, %70, %77, %90, %103, %112, %113, %116
  %func_type.0.ph = phi i32 [ 0, %10 ], [ 1, %19 ], [ 2, %28 ], [ 3, %37 ], [ 4, %46 ], [ 6, %55 ], [ 8, %70 ], [ 5, %77 ], [ 7, %90 ], [ 10, %103 ], [ 9, %112 ], [ 13, %113 ], [ 12, %116 ]
  %419 = load %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %420 = icmp eq %struct.VExp* %419, null
  br i1 %420, label %421, label %newVExpNumfunc.exit

; <label>:421                                     ; preds = %418
  %422 = tail call noalias i8* @malloc(i64 56000) #7
  %423 = bitcast i8* %422 to %struct.VExp*
  br label %424

; <label>:424                                     ; preds = %424, %421
  %indvars.iv.i.i317 = phi i64 [ 0, %421 ], [ %indvars.iv.next.i.i318, %424 ]
  %425 = phi %struct.VExp* [ null, %421 ], [ %426, %424 ]
  %426 = getelementptr inbounds %struct.VExp* %423, i64 %indvars.iv.i.i317
  %427 = getelementptr inbounds %struct.VExp* %423, i64 %indvars.iv.i.i317, i32 3
  %428 = bitcast %union.anon.1* %427 to %struct.VExp**
  store %struct.VExp* %425, %struct.VExp** %428, align 8, !tbaa !1
  %indvars.iv.next.i.i318 = add nuw nsw i64 %indvars.iv.i.i317, 1
  %exitcond.i.i319 = icmp eq i64 %indvars.iv.next.i.i318, 1000
  br i1 %exitcond.i.i319, label %.loopexit.i.i322, label %424

.loopexit.i.i322:                                 ; preds = %424
  %scevgep.i.i320 = getelementptr i8* %422, i64 55944
  %scevgep3.i.i321 = bitcast i8* %scevgep.i.i320 to %struct.VExp*
  store %struct.VExp* %scevgep3.i.i321, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  br label %newVExpNumfunc.exit

newVExpNumfunc.exit:                              ; preds = %418, %.loopexit.i.i322
  %429 = phi %struct.VExp* [ %scevgep3.i.i321, %.loopexit.i.i322 ], [ %419, %418 ]
  %430 = getelementptr inbounds %struct.VExp* %429, i64 0, i32 4
  store i32 1, i32* %430, align 4, !tbaa !17
  %431 = getelementptr inbounds %struct.VExp* %429, i64 0, i32 3
  %432 = bitcast %union.anon.1* %431 to %struct.VExp**
  %433 = load %struct.VExp** %432, align 8, !tbaa !1
  store %struct.VExp* %433, %struct.VExp** @allocateVExp.pool, align 8, !tbaa !1
  %434 = getelementptr inbounds %struct.VExp* %429, i64 0, i32 0
  store i32 2, i32* %434, align 4, !tbaa !15
  %435 = getelementptr inbounds %struct.VExp* %429, i64 0, i32 3, i32 0, i32 0
  store i32 %func_type.0.ph, i32* %435, align 4, !tbaa !35
  br label %436

; <label>:436                                     ; preds = %397, %newVExpNumfunc.exit, %newVExpIntList.exit, %newVExpSyscall0.exit310, %newVExpSyscall0.exit303, %newVExpApply.exit296, %newVExpSyscall0.exit274, %newVExpApply.exit267, %newVExpSyscall0.exit245, %newVExpApply.exit, %newVExpSyscall0.exit
  %.0 = phi %struct.VExp* [ %429, %newVExpNumfunc.exit ], [ %133, %newVExpSyscall0.exit ], [ %190, %newVExpApply.exit ], [ %211, %newVExpSyscall0.exit245 ], [ %268, %newVExpApply.exit267 ], [ %289, %newVExpSyscall0.exit274 ], [ %346, %newVExpApply.exit296 ], [ %367, %newVExpSyscall0.exit303 ], [ %389, %newVExpSyscall0.exit310 ], [ %411, %newVExpIntList.exit ], [ null, %397 ]
  ret %struct.VExp* %.0
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) #6

; Function Attrs: nounwind uwtable
define i32 @executeVExp(%struct.VExp* %exp) #1 {
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
  %40 = tail call i32 @executeValue(%struct.Value* %10, i32 0, i8** null)
  ret i32 %40
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
