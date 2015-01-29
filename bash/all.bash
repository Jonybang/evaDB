#!/bin/bash
if [[($1 = "organization") || ($1 = "all")]]
        then rails g slim:scaffold organization name requisites contact_data:references link:references contacts:references equips:references subunits:references
fi

if [[($$1 = "link") || ($1 = "all")]]
        then rails g slim:scaffold link url note:text linkable:references
fi

if [[($1 = "socnet_link") || ($1 = "all")]]
        then rails g slim:scaffold socnet_link url note:text linkable:references socnet:references
fi

if [[($1 = "socnet") || ($1 = "all")]]
        then rails g slim:scaffold socnet name url socnet_links:references
fi

if [[($1 = "contact") || ($1 = "all")]]
        then rails g slim:scaffold contact name contact_data:references socnet_links:references organization:references skills:references workpost:references industries:references equips:references intellect_properties:references team_projects:references chief_projects:references expert_projects:references member_events:references project_tasks:references
fi

#if [ $1 = "in_project" ]
#        then rails g slim:scaffold in_project contact:references asChief:references asTeamMember:references asExpert:references
#fi

if [[($1 = "student") || ($1 = "all")]]
        then rails g slim:scaffold student name contact_data:references socnet_links:references organization:references skills:references workpost:references industries:references equips:references enter_year:date university:references faculty:references specialty:references team_projects:references chief_projects:references expert_projects:references member_events:references project_tasks:references
fi

if [[($1 = "scientist") || ($1 = "all")]]
        then rails g slim:scaffold scientist name contact_data:references socnet_links:references organization:references skills:references workpost:references industries:references equips:references degree:references rank:references papers:references thesis:references team_projects:references chief_projects:references expert_projects:references member_events:references project_tasks:references
fi

if [[($1 = "intellect_property") || ($1 = "all")]]
        then rails g slim:scaffold intellect_property name indnumber description:text formula regdate:date enddate:date doclink intellect_type:references authors:references projects:references
fi

if [[($1 = "intellect_type") || ($1 = "all")]]
        then rails g slim:scaffold intellect_type name intellect_properties:references
fi

if [[($1 = "rank") || ($1 = "all")]]
        then rails g slim:scaffold rank name scientists:references
fi

if [[($1 = "degree") || ($1 = "all")]]
        then rails g slim:scaffold degree name scientists:references
fi

if [[($1 = "paper") || ($1 = "all")]]
        then rails g slim:scaffold paper name scientist:references
fi

if [[($1 = "these") || ($1 = "all")]]
        then rails g slim:scaffold these name scientist:references
fi

if [[($1 = "contact_data") || ($1 = "all")]]
        then rails g slim:scaffold contact_data phone email addres cdata_parent:references
fi

if [[($1 = "university") || ($1 = "all")]]
        then rails g slim:scaffold university name contact_data:references link:references faculties:references students:references
fi

if [[($1 = "faculty") || ($1 = "all")]]
        then rails g slim:scaffold faculty name contact_data:references link:references university:references specialties:references students:references
fi

if [[($1 = "specialty") || ($1 = "all")]]
        then rails g slim:scaffold specialty name contact_data:references link:references faculty:references students:references
fi

if [[($1 = "skill") || ($1 = "all")]]
        then rails g slim:scaffold skill name contacts:references
fi

if [[($1 = "workpost") || ($1 = "all")]]
        then rails g slim:scaffold workpost name contacts:references
fi

if [[($1 = "industry") || ($1 = "all")]]
        then rails g slim:scaffold industry name contacts:references
fi

if [[($1 = "equip") || ($1 = "all")]]
        then rails g slim:scaffold equip name model description:text parametres responsible:references organization:references subunit:references room:references equip_status:references project_tasks:references
fi

if [[($1 = "equip_status") || ($1 = "all")]]
        then rails g slim:scaffold equip_status name equips:references
fi

if [[($1 = "subunit") || ($1 = "all")]]
        then rails g slim:scaffold subunit name contact_data:references link:references organization:references rooms:references equips:references
fi

if [[($1 = "room") || ($1 = "all")]]
        then rails g slim:scaffold room name subunit:references equips:references
fi

if [[($1 = "project") || ($1 = "all")]]
        then rails g slim:scaffold project name project_status:references description:text result:text project_direction:references chief:references intellect_properties:references team:references experts:references project_tasks:references finance_sources:references
fi

if [[($1 = "project_task") || ($1 = "all")]]
        then rails g slim:scaffold project_task name number:int begin_date:date end_date:date project_status:references tehnical_task:text project:references responsible:references equips:references
fi

if [[($1 = "project_status") || ($1 = "all")]]
        then rails g slim:scaffold project_status name projects:references project_tasks:references
fi

if [[($1 = "project_direction") || ($1 = "all")]]
        then rails g slim:scaffold project_direction name projects:references finance_sources:references
fi

if [[($1 = "finance_source") || ($1 = "all")]]
        then rails g slim:scaffold finance_source name contact_data:references link:references volume_from:float volume_to:float currency:references projects:references project_directions:references finance_programs:references
fi

if [[($1 = "finance_program") || ($1 = "all")]]
        then rails g slim:scaffold finance_program name terms:text finance_source:references
fi

if [[($1 = "currency") || ($1 = "all")]]
        then rails g slim:scaffold currency name finance_sources:references
fi

if [[($1 = "event") || ($1 = "all")]]
        then rails g slim:scaffold event name date:datetime members:references sponsors:references experts:references documents:references
fi

if [[($1 = "event_document") || ($1 = "all")]]
        then rails g slim:scaffold event_document name comments:text to_do:text url event:references
fi

if [[($1 = "partner") || ($1 = "all")]]
        then rails g slim:scaffold partner name contact_data:references socnet_links:references organization:references skills:references workpost:references industries:references equips:references intellect_properties:references team_projects:references chief_projects:references expert_projects:references member_events:references project_tasks:references terms:text sponsor_events:references expert_events:references
fi
rails server
