# Data Dictionary

## Data Fields

### Screen Time					

#### Sub-field
* TV
* Computer
* Phone

#### Description

* Data recorded is from the previous evening.
* For these three sub-fields the data is being logged in minutes spent with each activity. The start time for each activity will unilaterally begin at 9PM EDT. The reason being that 3/5 week nights have class and it would skew the data to count in-class time as pre-bed screen time. 
* The unit of measurement is in minutes (i.e. 15, 45, 120). Computer time will also include any video games played.			
			
### Reading print					
	
#### Sub-field

* Books	
* Comic books				
* Newspapers	

#### Description

* Data recorded is from the previous evening.
* For these three sub-fields the data is being logged in minutes spent with each particular print medium. I am curious if there is any appreciable difference in sleep quality between a book, newspaper, and a comic book, thus justifying each having their own subfield.
* The unit of measurement is in minutes (i.e. 15, 45, 120).
			
### Sleep Evaluation

#### Sub-fields

* Wakes before alarm				
* Times snooze was hit				
* Woke up on first alarm?		
* Sleep Quality	

#### Description

* Wakes before alarm are the number of times during the previous night in which I woke up prior to my alarm going off. 
* Snooze hit is the number of times the snooze feature on my alarm the morning of the posted date was pressed instead of waking at the first sounding of morning alarm. Only applicable during weekdays (M-F)
* Woke on first alarm is a binary count of whether or not I woke up at the first alarm set during the week on the posted date (M-F). 0 = no, slept past and defaulted to second alarm; 1 = woke for first alarm.
* Sleep quality is recorded as a scalar value
		
### Health					

#### Sub-fields

* Anxiety/Stress	
* Emotional fatigue				
* Healthy/Ill

#### Description
* Data is being recorded for the present date, not the previous day to gauge the effect of the pre-sleep activities from the previous night)
* Two of the three sub fields (Anxiety/Stress, Emotional fatigue) in the Health field will be noted on a scale (for more information see 'Scales' sheet). Otherwise the Healthy/Ill notation will be noted in simple binary where 0 = healthy and 1 = ill.	
					
### Diet

#### Sub-fields					
	
* Caffeine Intake	
* Alcohol
* Meal times

#### Description

* Data is being recorded for the present date, not the previous day to gauge the effect of the pre-sleep activities from the previous night.
* Caffeine intake will be a summation of the total caffeinated beverages consumed in a given day. It is being used as a proxy for perceived physical fatigue under the assumption that higher numbers of caffeinated beverages consumed equate a higher magnitude of percevied physical fatigue. 
This number will be expressed as unit, where 1 unit is equal to:
    - 8 oz cup of coffee
    - 2 oz shot of espresso
    - 8 oz cup of tea
    - 8 oz soda/energy drink/etc
* Alcohol subfield will be tabulated as a simple binary: 0 for no alcohol consumed and 1 for alcohol consumed. It is a proven fact that alcohol has the ability to affect sleep negatively, however in this case the amount is not of interest rather whether it took place or not."			
* Meal times in this instance refers to the time at which dinner (or a later evening meal) was consumed. If there are multiple, then each will be logged separately. The data will be expressed in EDT from the beginning."			

## Scales

### Sleep Quality Scale

* 0 - Barely slept; practically worst sleep of my life										
* 1 - Slept poorly and waking state is exhausted; no rest achieved										
* 2	- Basic function of sleep to recharge satisfied though kept waking/tossing turning;
quality of sleep does not result in recharge but merely enough to keep going
* 3	- Trouble falling asleep; two or more wakes. Could not get comfortable										
* 4 - One wake; slight discomfort but otherwise a perfectly serviceable and restful night				
* 5	- Slept like a rock; no wakes, comfortable, barely moved											

### Anxiety/Stress Scale

* 0 - No anxiety or stress felt. Feelings that would resonate with 0 rating would be: 
carefree, unencumbered, peace, tranquil"			
* 1 - Subtle stresses or anxieties as may be experienced before a doctor's appointment or as a deadline for a project approaches. Acknowledging that everything is perfectly fine but there are so nagging feelings that may not be able to be expressed in words.			
* 2 - Perceptible stresses or anxieties that have a definite root cause. The stimulants are noticeable and may cause brief moments of frustration or force a mild reaction to them. Annoyed would best describe the feeling	
* 3 - Noticeable stressors and/or anxious feelings may come from multiple sources and may compound personal reaction. Without active concentration or exertion it is difficult to avoid falling into a state of inertia. There is a definite change in attitude and demeanor.			
* 4 - Anxiety and stress is no longer peripheral and becoming a focus of attention. Without serious effort it is difficult to overcome feelings of panic or self conciousness. Ability to accomplish basic tasks/responsibilities wears on physical self and is exhausting. Pre-occupation with stressor is near all encompassing.			
* 5 - Unable to complete basic responsibilities due to preoccupation with a stressor. Anxiety prohibits solving a given problem and forces one into a "bottomed out" state where no motivators can jump start action. Intense feelings of panic, self deprecation, and lack of confidence. Associated feelings: distracted, inconsolable, paralyzed			

### Emotional Fatigue

* 0 - Fully recharged. Able and eager to set on a problem or help. Fully motivated and ready for challenges.	
* 1	- Able to self-motivate and exert oneself to meet the day but with a slight reservation. Not "stage ready" but definitely performing at "dress rehearsal" levels.				
* 2 - Fatigue is in place though it is not precluding any activity. There isn't a strong desire to socialize but it wouldn't be out of the question. Would prefer some quiet but if it's not available that's ok.			
* 3 - Mind of matter mentality is fully activated. Knowing that a break is on the horizon feeling confident that you can carry on with a smile. Prefer to keep tighter social circle and relax with comfort of family.	
* 4	- Smile is fading and mood is in noticeable decline. Not feeling up for social outings or extrovertion and prefer to rest at home. Mind focusing on recovering and recharging more than attuned to needs of others.		
* 5 - Complete inability to think beyond the needs of the self and desperate desire to rest alone. Unable to empathize or think with consideration of another. Desire to curl up in a ball in a dark room and desperately seeking solace. 				
