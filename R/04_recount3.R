## ----'start', message=FALSE-----------------------------------
## Load recount3 R package
library("recount3")


## ----'quick_example'------------------------------------------
## Revisemos todos los proyectos en recount3, por default se muestran los proyectos humanos
human_projects <- available_projects()

## Encuentra tu proyecto de interés. Aquí usaremos
## SRP009615 de ejemplo
## se basa en  algo del core que pemrite que no se vuelvan a descargar los datos cada vez que se corre el código, lo que hace que el código sea más reproducible.
proj_info <- subset(
    human_projects,
    project == "SRP009615" & project_type == "data_sources"
)
## Crea un objeto de tipo RangedSummarizedExperiment (RSE)
## con la información a nivel de genes
#create_rse es una función del paquete recount3 que toma la información del proyecto y crea un objeto de tipo RangedSummarizedExperiment (RSE) con la información a nivel de genes. Este objeto contiene las cuentas de expresión génica, así como la información de los genes y las muestras.
#importate: se esta pidiendo los datos a nivel de genes
rse_gene_SRP009615 <- create_rse(proj_info)
## Explora el objeto RSE
rse_gene_SRP009615


## ----"interactive_display", eval = FALSE----------------------
# ## Explora los proyectos disponibles de forma interactiva
# proj_info_interactive <- interactiveDisplayBase::display(human_projects)
# ## Selecciona un solo renglón en la tabla y da click en "send".
#
# ## Aquí verificamos que solo seleccionaste un solo renglón.
# stopifnot(nrow(proj_info_interactive) == 1)
# ## Crea el objeto RSE
# rse_gene_interactive <- create_rse(proj_info_interactive)

## ----"tranform_counts"----------------------------------------
## Convirtamos las cuentas por nucleotido a cuentas por lectura
## usando compute_read_counts().
## Para otras transformaciones como RPKM y TPM, revisa transform_counts().
assay(rse_gene_SRP009615, "counts") <- compute_read_counts(rse_gene_SRP009615)


## ----"expand_attributes"--------------------------------------
## Para este estudio en específico, hagamos más fácil de usar la
## información del experimento
rse_gene_SRP009615 <- expand_sra_attributes(rse_gene_SRP009615)
colData(rse_gene_SRP009615)[,
    grepl("^sra_attribute", colnames(colData(rse_gene_SRP009615)))
]
