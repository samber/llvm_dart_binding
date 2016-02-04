; ModuleID = 'fac.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-redhat-linux-gnu"

; Function Attrs: nounwind readnone uwtable
define i32 @fac(i32 %a) #0 {
  %1 = icmp sgt i32 %a, 1
  br i1 %1, label %tailrecurse, label %tailrecurse._crit_edge

tailrecurse:                                      ; preds = %0, %tailrecurse
  %a.tr2 = phi i32 [ %2, %tailrecurse ], [ %a, %0 ]
  %accumulator.tr1 = phi i32 [ %3, %tailrecurse ], [ 1, %0 ]
  %2 = add nsw i32 %a.tr2, -1
  %3 = mul nsw i32 %a.tr2, %accumulator.tr1
  %4 = icmp sgt i32 %2, 1
  br i1 %4, label %tailrecurse, label %tailrecurse._crit_edge

tailrecurse._crit_edge:                           ; preds = %tailrecurse, %0
  %accumulator.tr.lcssa = phi i32 [ 1, %0 ], [ %3, %tailrecurse ]
  ret i32 %accumulator.tr.lcssa
}

; Function Attrs: nounwind readnone uwtable
define i32 @main(i32 %ac, i8** nocapture readnone %av) #0 {
  %1 = tail call i32 @fac(i32 3)
  ret i32 %1
}

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
