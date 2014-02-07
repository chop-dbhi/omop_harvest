# The modules defined here are included in Cilantro. All project-level modules
# must be access via the namespaced path 'project/main'. This is to
# ensure modules of the same name do not conflict Cilantro's modules.

require ['cilantro/main', 'project/csrf']

    #c.router._registered['query'].view.workspace.on 'show', () ->
    #    $("#concept-workspace-main .welcome").html("<h2>Welcome</h2><p>If this is your first time, welcome to your data discovery and query workspace.</p><p>This system will allow you to perform queries by sample type/quantity, histology, associated clinical data, and applicable demographic data per your needs and generate reports of available specimens and their associated molecular data.</p>")