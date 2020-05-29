select distinct ConsecutiveNums
  from (
    select case when lag_num = Num and Num = lead_num then Num
            else null
            end as ConsecutiveNums
      from (
          select lag(Num) over (order by Id) as lag_num
                ,Num
                ,lead(Num) over (order by Id) as lead_num
            from Logs
      )
  )
 where ConsecutiveNums is not null