using AddMember.Data;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.Swagger;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.MapPost("/addmember", (string name, string lastname, string birthyear) =>
{
    var connectionString = builder.Configuration["ServiceBus:ConnectionString"];
    var queueName = builder.Configuration["ServiceBus:QueueName"];
    var serviceBus = new ServiceBus(connectionString, queueName);
    serviceBus.SendMessageAsync(name, lastname, birthyear).GetAwaiter().GetResult();
    return Results.Ok($"Miembro {name} agregado con éxito.");
})
.WithName("AddMember")
.WithOpenApi();

app.Run();