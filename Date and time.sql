DECLARE @cur_date as DATE='2019-02-19'
select year(@cur_date) -1 as COMP_Year,
CAST(CONCAT('01/01/',year(dateadd(Year,-1,@cur_date)))as date) as Comp_Start_date,
CAST(CONCAT('12/31/',year(dateadd(Year,-1,@cur_date)))as date) as comp_end_date,
YEAR(@cur_date) -2 as Previous_Year,
CAST(CONCAT('01/01/',year(dateadd(Year,-2,@cur_date)))as date) as Starting_Previous_Year,
CAST(CONCAT('12/31/',year(dateadd(Year,-2,@cur_date)))as date) as Ending_Previous_Year,
------TILL YEAR-----
case when MONTH(@cur_date) between 7 and 12 then 'S1 ' + cast(year(@cur_date) as varchar(4)) else 'S2 ' + cast(YEAR(@cur_date)-1 as varchar(4)) end as current_sem,
case when MONTH(@cur_date) between 7 and 12 then CAST(CONCAT('01/01/',year(@cur_date))as date) else CAST(concat('07/01/',year(dateadd(Year,-1,@cur_date)))as date) end as Current_sem_star_date,
case when MONTH(@cur_date) between 7 and 12 then CAST(CONCAT('06/30/',year(@cur_date))as date) else CAST(concat('12/31/',year(dateadd(Year,-1,@cur_date)))as date) end as Current_sem_end_date,
case when MONTH(@CUR_DATE) between 7 and 12 then 'S2 ' + CAST( (YEAR(@CUR_DATE) -1) AS VARCHAR(4)) ELSE 'S1 ' + CAST( (YEAR(@CUR_DATE)-1) AS VARCHAR(4)) end as Previous_Sem,
case when MONTH(@cur_date) between 7 and 12 then CAST(CONCAT('07/01/',year(@cur_date) -1)as date) else CAST(concat('01/01/',year(dateadd(Year,-1,@cur_date)))as date) end as Prev_sem_star_date,
case when MONTH(@cur_date) between 7 and 12 then CAST(CONCAT('12/31/',year(@cur_date) -1)as date) else CAST(concat('07/31/',year(dateadd(Year,-1,@cur_date)))as date) end as Prev_sem_end_date,

------------------- till current sem----------------------------------------------------------------
CASE when MONTH(@CUR_DATE) between 4 and 12 then
        'Q' + cast((DATEPART(quarter,@CUR_DATE)-1) as varchar(2)) + ' '    + cast(datepart(year,@CUR_DATE) as varchar(4))   
    else
        'Q' + cast((DATEPART(quarter,DATEADD(month,-3, @CUR_DATE))) as varchar(2)) + ' ' + cast(datepart(year,@CUR_DATE)-1 as varchar(4)) END
    Current_Quater,
case when MONTH(@cur_date) between 4 and 6 then CAST(CONCAT('01/01/',year(@cur_date))as date)
when MONTH(@cur_date) between 7 and 9 then CAST(CONCAT('04/01/',year(@cur_date))as date)
when MONTH(@cur_date) between 10 and 12 then CAST(CONCAT('07/01/',year(@cur_date))as date)
else 
CAST(CONCAT('10/01/',year(@cur_date)-1)as date) end as start_q_date,
case when MONTH(@cur_date) between 4 and 6 then CAST(CONCAT('03/31/',year(@cur_date))as date)
when MONTH(@cur_date) between 7 and 9 then CAST(CONCAT('06/30/',year(@cur_date))as date)
when MONTH(@cur_date) between 10 and 12 then CAST(CONCAT('09/30/',year(@cur_date))as date)
else 
CAST(CONCAT('12/31/',year(@cur_date)-1)as date) end as End_q_date,
CASE when MONTH(@CUR_DATE) between 7 and 12 then
        'Q' + cast((DATEPART(quarter,@CUR_DATE)-2) as varchar(2)) + ' '    + cast(datepart(year,@CUR_DATE) as varchar(4))   
    else
        'Q' + cast((DATEPART(quarter,DATEADD(month,-6, @CUR_DATE))) as varchar(2)) + ' ' +  + cast(datepart(year,@CUR_DATE)-1 as varchar(4))
   
        END
    Privious_Quater,

	case when MONTH(@cur_date) between 4 and 6 then CAST(CONCAT('10/01/',year(@cur_date) -1)as date)
when MONTH(@cur_date) between 7 and 9 then CAST(CONCAT('01/30/',year(@cur_date) )as date)
when MONTH(@cur_date) between 10 and 12 then CAST(CONCAT('04/01/',year(@cur_date))as date)
else 
CAST(CONCAT('07/01/',year(@cur_date)-1)as date) end as Pre_start_q_date,
case when MONTH(@cur_date) between 4 and 6 then CAST(CONCAT('12/31/',year(@cur_date) -1)as date)
when MONTH(@cur_date) between 7 and 9 then CAST(CONCAT('03/30/',year(@cur_date))as date)
when MONTH(@cur_date) between 10 and 12 then CAST(CONCAT('06/30/',year(@cur_date))as date)
else 
CAST(CONCAT('09/30/',year(@cur_date)-1)as date) end as Pre_End_q_date;






------TILL quarter-----



