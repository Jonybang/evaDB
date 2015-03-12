#!/bin/bash
content=""

if [[($1 = "organization") || ($1 = "all")]]
        then content="organization name requisites contact_data:references link:references contacts:references equips:references subunits:references"
fi

if [[($1 = "link") || ($1 = "all")]]
        then content="link url note:text linkable:references"
fi

if [[($1 = "socnet_link") || ($1 = "all")]]
        then content="socnet_link url note:text linkable:references socnet:references"
fi

if [[($1 = "socnet") || ($1 = "all")]]
        then content="socnet name url socnet_links:references"
fi

contact_main_fields="name contact_data:references socnet_links:references organization:references skills:references workpost:references industries:references equips:references"
contact_sub_fields="intellect_properties:references team_projects:references chief_projects:references expert_projects:references member_events:references project_tasks:references"

if [[($1 = "contact") || ($1 = "all")]]
        then content="contact $contact_main_fields $contact_sub_fields"
fi

if [[($1 = "student") || ($1 = "all")]]
        then content="student $contact_main_fields enter_year:date university:references faculty:references specialty:references $contact_sub_fields"
fi

if [[($1 = "scientist") || ($1 = "all")]]
        then content="scientist $contact_main_fields degree:references rank:references papers:references thesis:references $contact_sub_fields"
fi

if [[($1 = "intellect_property") || ($1 = "all")]]
        then content="intellect_property name indnumber description:text formula regdate:date enddate:date doclink intellect_type:references authors:references projects:references"
fi

if [[($1 = "intellect_type") || ($1 = "all")]]
        then content="intellect_type name intellect_properties:references"
fi

if [[($1 = "rank") || ($1 = "all")]]
        then content="rank name scientists:references"
fi

if [[($1 = "degree") || ($1 = "all")]]
        then content="degree name scientists:references"
fi

if [[($1 = "paper") || ($1 = "all")]]
        then content="paper name scientist:references"
fi

if [[($1 = "these") || ($1 = "all")]]
        then content="these name scientist:references"
fi

if [[($1 = "contact_data") || ($1 = "all")]]
        then content="contact_data phone email addres cdata_parent:references"
fi

if [[($1 = "university") || ($1 = "all")]]
        then content="university name contact_data:references link:references faculties:references students:references"
fi

if [[($1 = "faculty") || ($1 = "all")]]
        then content="faculty name contact_data:references link:references university:references specialties:references students:references"
fi

if [[($1 = "specialty") || ($1 = "all")]]
        then content="specialty name contact_data:references link:references faculty:references students:references"
fi

if [[($1 = "skill") || ($1 = "all")]]
        then content="skill name contacts:references"
fi

if [[($1 = "workpost") || ($1 = "all")]]
        then content="workpost name contacts:references"
fi

if [[($1 = "industry") || ($1 = "all")]]
        then content="industry name contacts:references"
fi

if [[($1 = "equip") || ($1 = "all")]]
        then content="equip name model description:text parametres responsible:references organization:references subunit:references room:references equip_status:references project_tasks:references"
fi

if [[($1 = "equip_status") || ($1 = "all")]]
        then content="equip_status name equips:references"
fi

if [[($1 = "subunit") || ($1 = "all")]]
        then content="subunit name contact_data:references link:references organization:references rooms:references equips:references"
fi

if [[($1 = "room") || ($1 = "all")]]
        then content="room name subunit:references equips:references"
fi

if [[($1 = "project") || ($1 = "all")]]
        then content="project name project_status:references description:text result:text project_direction:references chief:references intellect_properties:references team:references experts:references project_tasks:references finance_sources:references"
fi

if [[($1 = "project_task") || ($1 = "all")]]
        then content="project_task name number:int begin_date:date end_date:date project_status:references tehnical_task:text project:references responsible:references equips:references"
fi

if [[($1 = "project_status") || ($1 = "all")]]
        then content="project_status name projects:references project_tasks:references"
fi

if [[($1 = "project_direction") || ($1 = "all")]]
        then content="project_direction name projects:references finance_sources:references"
fi

if [[($1 = "finance_source") || ($1 = "all")]]
        then content="finance_source name contact_data:references link:references volume_from:float volume_to:float currency:references projects:references project_directions:references finance_programs:references"
fi

if [[($1 = "finance_program") || ($1 = "all")]]
        then content="finance_program name terms:text finance_source:references"
fi

if [[($1 = "currency") || ($1 = "all")]]
        then content="currency name finance_sources:references"
fi

if [[($1 = "event") || ($1 = "all")]]
        then content="event name date:datetime members:references sponsors:references experts:references documents:references"
fi

if [[($1 = "event_document") || ($1 = "all")]]
        then content="event_document name comments:text to_do:text url event:references"
fi

if [[($1 = "partner") || ($1 = "all")]]
        then content="partner $contact_main_fields $contact_sub_fields terms:text sponsor_events:references expert_events:references"
fi
g_slim="rails g slim:scaffold"
$g_slim $content
rails server
