; ModuleID = 'add.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-redhat-linux-gnu"

; Function Attrs: nounwind readnone uwtable
define i32 @add(i32 %a, i32 %b) #0 {
  %1 = add nsw i32 %b, %a
  ret i32 %1
}

; Function Attrs: nounwind readnone uwtable
define i32 @main(i32 %ac, i8** nocapture readnone %av) #0 {
  ret i32 63
}

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
