unit UThreadNotaAutomatica;

interface

uses
  Classes, Dialogs, Forms, Controls, StdCtrls, OraTeste;

type
  ThreadNotaAutomatica = class(TThread)
  private
    { Private declarations }
    wForm: TForm;
  protected
    procedure Execute; override;
    procedure ConfirmaNota;
    procedure BuscaNota;
    procedure ValidaOperacao;
    procedure AbreQuery(query: TOracleDataSet1);

  public
    property pForm: TForm read wForm write wForm;
  end;

implementation

uses SysUtils, UNotaSaida_cl, UNotaSaidaCad, UNotaSaida_Confirma, UOracle_cl,
  UNotaSaidaAutomatica_cl, UOperacao_cl, UNotaSaidaAutomatica,
  UNfEletronicaLote_cl;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure ThreadNotaAutomatica.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ ThreadNotaAutomatica }

procedure ThreadNotaAutomatica.AbreQuery(query: TOracleDataSet1);
var cont: integer;
begin
  try
    query.open;
  except
    for cont := 0 to pForm.ComponentCount -1 do
    begin
      if pForm.Components[cont].Name = 'PnRodando' then
      begin
        TControl(pForm.Components[cont]).Visible := false;
      end;
      if pForm.Components[cont].Name = 'PnParado' then
      begin
        TControl(pForm.Components[cont]).Visible := true;
      end;
      if pForm.Components[cont].Name = 'lbMensagem' then
      begin
        TLabel(pForm.Components[cont]).Caption := 'Sem conexão com o servidor';
      end;
    end;
    pForm.Refresh;
    //Suspend;
  end;
end;

procedure ThreadNotaAutomatica.BuscaNota;
begin
  with DMNotaSaida, DMOracle, DMNotaSaidaAutomatica do
  begin

    QNotaSaidaEmitir.Close;
    AbreQuery(QNotaSaidaEmitir);

    if not QNotaSaidaEmitir.Eof then
    begin
      DMNotaSaida.QNotaSaida.Close;
      DMNotaSaida.QNotaSaida.SetVariable('PK', QNotaSaidaEmitirCOD_NOTA_CAB.Value);
      AbreQuery(DMNotaSaida.QNotaSaida);
      DMNotaSaida.QItemNF.Close;
      AbreQuery(DMNotaSaida.QItemNF);
      if DMNotaSaida.QNotaSaida.RecordCount > 0 then
      begin

        // Verificação de controle de estoque
        DMOperacao.QOperacao.Close;
        DMOperacao.QOperacao.SetVariable('PK', QNotaSaidaCOD_OPERACAO.Value);
        AbreQuery(DMOperacao.QOperacao);
        if DMOperacao.QOperacaoIND_ESTOQUE.Value <> 'N' then
        begin
          DMOperacao.QOperacao.Edit;
          DMOperacao.QOperacaoIND_ESTOQUE.Value := 'N';
          DMOperacao.QOperacao.Post;
          DMOperacao.QOperacao.RefreshRecord;
        end;

        ConfirmaNota;

      end;
    end;
    
  end;
end;

procedure ThreadNotaAutomatica.ConfirmaNota;
begin
  if not DMNotaSaida.QNotaSaida.Eof then
  begin
    FNotaSaidaCad := TFNotaSaidaCad.Create(Application);
    FNotaSaidaCad.ConfirmarNota1Click(self);
    FNotaSaidaCad.Free;
    FNotaSaidaCad := Nil;
    DMNfEletronicaLote.QNfeLote.Close;
  end;
end;

procedure ThreadNotaAutomatica.Execute;
var cont: integer;
begin
  { Place thread code here }

//  for cont := 0 to pForm.ComponentCount -1 do
//  begin
//    if pForm.Components[cont].Name = 'DBGrid1' then
//    begin
      // código a ser executado até que a thread seja parada
      //while true do
      //begin
        Synchronize(BuscaNota);
        Synchronize(DMNotaSaidaAutomatica.QNotaSaidaEmitida.DisableControls);
        Synchronize(DMNotaSaidaAutomatica.QNotaSaidaEmitida.Close);
        Synchronize(DMNotaSaidaAutomatica.QNotaSaidaEmitida.Open);
        Synchronize(DMNotaSaidaAutomatica.QNotaSaidaEmitida.EnableControls);
        //Sleep(5000);
        Synchronize(ValidaOperacao);
      //end;
//    end;
//  end;
end;

procedure ThreadNotaAutomatica.ValidaOperacao;
var cont: integer;
begin

  // Procedure que verifica se existe retorno de processamento
  // Caso não exista deve ser parada a execução da thread
  // Ex: Servidor NF-e não inicializado. Deve parar a thread.   

  with DMNotaSaidaAutomatica do
  begin

//    if  DMNotaSaidaAutomatica.QNotaSaidaEmitidaCOD_NOTA_CAB.Value = 0 then
//    begin
//
//      // Não existem notas a serem enviadas
//      // O sistema continua ativo e procurando por notas
//
//      for cont := 0 to pForm.ComponentCount -1 do
//      begin
//        if pForm.Components[cont].Name = 'PnParado' then
//          TControl(pForm.Components[cont]).Visible := false;
//        if pForm.Components[cont].Name = 'PnRodando' then
//          TControl(pForm.Components[cont]).Visible := true;
//      end;
//      Exit;
//    end;

    QValidaOperacao.Close;
    QValidaOperacao.SetVariable('COD_NOTA_CAB'
      ,DMNotaSaidaAutomatica.QNotaSaidaEmitidaCOD_NOTA_CAB.Value);
    QValidaOperacao.Open;

    if not QValidaOperacao.Eof then
    begin
      if trim(QValidaOperacaoDESC_RETORNO_PROCESSAMENTO.Value) = '' then
      begin
        for cont := 0 to pForm.ComponentCount -1 do
        begin
          if pForm.Components[cont].Name = 'PnParado' then
            TControl(pForm.Components[cont]).Visible := true;
          if pForm.Components[cont].Name = 'PnRodando' then
            TControl(pForm.Components[cont]).Visible := false; 
        end;
//        self.Suspend;
        TFNotaSaidaAutomatica(pForm).ParaSincronismo;
      end
      else // Houve envio de nota para SEFAZ
      begin
        for cont := 0 to pForm.ComponentCount -1 do
        begin
          if pForm.Components[cont].Name = 'PnParado' then
            TControl(pForm.Components[cont]).Visible := false;
          if pForm.Components[cont].Name = 'PnRodando' then
            TControl(pForm.Components[cont]).Visible := true;
        end;
      end;
    end
    else
    begin
      for cont := 0 to pForm.ComponentCount -1 do
        begin
          if pForm.Components[cont].Name = 'PnParado' then
            TControl(pForm.Components[cont]).Visible := true;
          if pForm.Components[cont].Name = 'PnRodando' then
            TControl(pForm.Components[cont]).Visible := false;
        end;
//      self.Suspend;
      TFNotaSaidaAutomatica(pForm).ParaSincronismo;
    end;

  end;

end;

end.
