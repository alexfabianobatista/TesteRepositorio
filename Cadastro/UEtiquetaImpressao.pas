unit UEtiquetaImpressao;

interface

Uses Dialogs, SysUtils, UBiblioteca,UFilial_cl,UMensagem_cl, UCadastro_cl, Variants,
     Controls;
var
  wCont :Integer;
Type
  TEtiquetaImpressao = Class
  imp :Timp;
  Private

  Public
    Procedure ImprimeEtiqueta(porta :String; quantidade :Integer);
end;

implementation


Procedure TEtiquetaImpressao.ImprimeEtiqueta(porta :String; quantidade :Integer);
var
  i, wQueryCont, wCadastro, wContRegistro :Integer;
  wNome, wEndereco, wEstado, wCep, wCidade :String;
begin
  wCont := 0;

  if imp = Nil then
    imp := TImp.Create;

  if Trim(porta) = 'LPT1' then
    Imp.AbreImpressora
  else
    if Trim(porta) = 'LPT2' then
      Imp.AbreImpressora_Lpt2;

  imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',72);

  //Aqui começa a impressão das etiquetas
  with DMCadastro do
  begin
    if MessageDlg(IntToStr((QEtiquetaDOS.RecordCount * (quantidade + 1))) + ' etiquetas serão impressas',MtConfirmation, mbOkCancel, 0) = mrOk then
    begin

      wQueryCont := 0;
      wContRegistro := 0;
      wCadastro := 0;
      wNome := '';
      wEndereco := '';
      wEstado := '';
      wCep := '';
      wCidade := '';

      while not QEtiquetaDOS.Eof do
      begin
        Inc(wQueryCont);
        wCadastro := QEtiquetaDOSCOD_CADASTRO.Value;
        wNome := QEtiquetaDOSNOME.Value;
        wEndereco := QEtiquetaDOSDESC_ENDERECO.Value;
        wEstado := QEtiquetaDOSCOD_ESTADO.Value;
        wCep := QEtiquetaDOSDESC_CEP.Value;
        wCidade := QEtiquetaDOSDESC_CIDADE.Value;

        if QEtiquetaDOS.RecordCount > 1 then
        begin
          if wQueryCont < QEtiquetaDOS.RecordCount then
          begin
            QEtiquetaDOS.Next;
            Inc(wQueryCont);
          end
          else
          begin
            QEtiquetaDOSCOD_CADASTRO.Clear;
            QEtiquetaDOSNOME.Clear;
            QEtiquetaDOSDESC_ENDERECO.Clear;
            QEtiquetaDOSCOD_ESTADO.Clear;
            QEtiquetaDOSDESC_CEP.Clear;
            QEtiquetaDOSDESC_CIDADE.Clear;
          end;
          for i:=0 to quantidade do
          begin
            Imp.WriteXY(0.5, wCont,IntToStr(wCadastro));
            Imp.WriteXY(1.5, wCont,wNome);
            Imp.WriteXY(9, wCont,QEtiquetaDOSCOD_CADASTRO.Text);
            Imp.WriteXY(10, wCont,QEtiquetaDOSNOME.Value);
            Inc(wCont);
            Imp.WriteXY(0.5, wCont, wEndereco);
            Imp.WriteXY(9, wCont, QEtiquetaDOSDESC_ENDERECO.Value);
            Inc(wCont);
            Imp.WriteXY(0.5, wCont, wCidade);
            if wEstado <> '' then //colocado para nao imprimir o '-' caso wEstado seja null
              Imp.WriteXY(2.5, wCont, ' - ' + wEstado);
            Imp.WriteXY(9, wCont, QEtiquetaDOSDESC_CIDADE.Value);
            if QEtiquetaDOSCOD_ESTADO.Value <> '' then
              Imp.WriteXY(11, wCont, ' - ' + QEtiquetaDOSCOD_ESTADO.Value);
            Inc(wCont);
            if wCep <> '' then
              Imp.WriteXY(0.5, wCont, 'CEP: ' + wCep);
            if QEtiquetaDOSDESC_CEP.Value <> '' then
              Imp.WriteXY(9, wCont, 'CEP: ' + QEtiquetaDOSDESC_CEP.Value);
            Inc(wCont,3);
          end;
        end // fim if RecordCount > 1
        else
        begin
          if wQueryCont < QEtiquetaDOS.RecordCount then
          begin
            QEtiquetaDOS.Next;
            Inc(wQueryCont);
          end;
          for i:=0 to quantidade do
          begin
            if (quantidade + 1) mod 2 <> 0 then
            begin
              Inc(wContRegistro, 2);
              if ((quantidade + 1) - wContRegistro) = 0 then
                break
              else
                if ((quantidade + 1) - wContRegistro) < 0 then
                begin
                  QEtiquetaDOSCOD_CADASTRO.Clear;
                  QEtiquetaDOSNOME.Clear;
                  QEtiquetaDOSDESC_ENDERECO.Clear;
                  QEtiquetaDOSCOD_ESTADO.Clear;
                  QEtiquetaDOSDESC_CEP.Clear;
                  QEtiquetaDOSDESC_CIDADE.Clear;
                end;
            end
            else
              if (quantidade + 1) mod 2 = 0 then
              begin
                if ((wContRegistro) >= (quantidade + 1)) then
                  break;
                Inc(wContRegistro, 2);
              end;
            Imp.WriteXY(0.5, wCont,IntToStr(wCadastro));
            Imp.WriteXY(1.5, wCont,wNome);
            Imp.WriteXY(9, wCont,QEtiquetaDOSCOD_CADASTRO.Text);
            Imp.WriteXY(10, wCont,QEtiquetaDOSNOME.Value);
            Inc(wCont);
            Imp.WriteXY(0.5, wCont, wEndereco);
            Imp.WriteXY(9, wCont, QEtiquetaDOSDESC_ENDERECO.Value);
            Inc(wCont);
            Imp.WriteXY(0.5, wCont, wCidade);
            if wEstado <> '' then //colocado para nao imprimir o '-' caso wEstado seja null
              Imp.WriteXY(2.5, wCont, ' - ' + wEstado);
            Imp.WriteXY(9, wCont, QEtiquetaDOSDESC_CIDADE.Value);
            if QEtiquetaDOSCOD_ESTADO.Value <> '' then
              Imp.WriteXY(11, wCont, ' - ' + QEtiquetaDOSCOD_ESTADO.Value);
            Inc(wCont);
            if wCep <> '' then
              Imp.WriteXY(0.5, wCont, 'CEP: ' + wCep);
            if QEtiquetaDOSDESC_CEP.Value <> '' then
              Imp.WriteXY(9, wCont, 'CEP: ' + QEtiquetaDOSDESC_CEP.Value);
            Inc(wCont,3);

            if ((quantidade + 1) - wContRegistro) < 0 then
              break;
          end;// fim for
        end; // fim else

        QEtiquetaDOS.Next;
      end; // fim MessageDlg
    end // fim while
  end;

  Imp.FechaImpressora;
end;
end.
