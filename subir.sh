#!/bin/bash
# filepath: deploy/build_and_push_addadult.sh

# Variables (modifica según tu entorno)
ACR_NAME="tuacr" # Nombre de tu Azure Container Registry (sin .azurecr.io)
SERVICE_NAME="addadult"
IMAGE_TAG="v1"
RESOURCE_GROUP="tu-resource-group"
LOCATION="eastus"

# Iniciar sesión en Azure

# Crear el ACR si no existe
az acr show --name $ACR_NAME --resource-group $RESOURCE_GROUP 2>/dev/null || \
az acr create --resource-group $RESOURCE_GROUP --name $ACR_NAME --sku Basic --location $LOCATION

# Iniciar sesión en el ACR
az acr login --name $ACR_NAME

# Construir la imagen Docker
docker build -t $ACR_NAME.azurecr.io/$SERVICE_NAME:$IMAGE_TAG ./AddAdult

# Subir la imagen al ACR
docker push $ACR_NAME.azurecr.io/$SERVICE_NAME:$IMAGE_TAG

echo "Imagen $SERVICE_NAME subida a $ACR_NAME.azurecr.io con la etiqueta $IMAGE_TAG"
