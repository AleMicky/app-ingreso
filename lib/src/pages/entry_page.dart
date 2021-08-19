import 'package:flutter/material.dart';
import 'package:ingreso/src/models/tipoIngreso.dart';
import 'package:ingreso/src/providers/entry_form_provider.dart';
import 'package:ingreso/src/services/tipo_ingreso_service.dart';
import 'package:ingreso/src/ui/input_decorations.dart';
import 'package:provider/provider.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'REGISTRO INGRESO',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ChangeNotifierProvider(
                  create: (_) => EntryFormProvider(),
                  child: _FormRntry(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FormRntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<TipoIngresoService>(context).headlines;
    final entryForm = Provider.of<EntryFormProvider>(context);

    return Container(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: entryForm.formKey,
        child: Column(
          children: [
            SizedBox(
              height: 5.0,
            ),
            DropdownButtonFormField<TipoIngreso>(
              items: headlines
                  .map(
                    (value) => DropdownMenuItem(
                      child: Text(value.descripcion),
                      value: value,
                    ),
                  )
                  .toList(),
              // value: _opcionSeleccionada,
              onSaved: (value) => entryForm.idTipoIngreso = value!.id,
              decoration: InputDecorations.authInputDecoration(
                labelText: 'Tipo Ingreso',
              ),
              onChanged: (opt) => entryForm.iniciarEvento(opt as TipoIngreso),
            ),
            entryForm.placaBool
                ? _espacio(
                    TextFormField(
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecorations.authInputDecoration(
                        labelText: 'Placa',
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) => (value == null || value.isEmpty)
                          ? 'Por favor ingrese un texto'
                          : null,
                      onSaved: (value) => entryForm.placa = value!.trim(),
                    ),
                  )
                : Container(),
            entryForm.empresaBool
                ? _espacio(
                    TextFormField(
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecorations.authInputDecoration(
                        labelText: 'Empresa',
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) => (value == null || value.isEmpty)
                          ? 'Por favor ingrese un texto'
                          : null,
                      onSaved: (value) => entryForm.empresa = value!.trim(),
                    ),
                  )
                : Container(),
            SizedBox(
              height: 5.0,
            ),
            Divider(),
            TextFormField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecorations.authInputDecoration(
                labelText: 'Observación',
              ),
              keyboardType: TextInputType.text,
              validator: (value) => (value == null || value.isEmpty)
                  ? 'Por favor ingrese un texto'
                  : null,
              onSaved: (value) => print(value!.trim()),
            ),
          ],
        ),
      ),
    );
  }

  Column _espacio(Widget child) {
    return Column(
      children: [
        SizedBox(
          height: 5.0,
        ),
        Divider(),
        child
      ],
    );
  }
}
