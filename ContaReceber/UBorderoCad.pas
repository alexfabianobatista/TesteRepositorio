unit UBorderoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, Grids, DBGrids, DBPanel, DBCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFBorderoCad = class(TFTCadSimples)
    btCRCons: TBitBtn;
    DBGrid1: TDBGrid;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    Label1: TLabel;
    btCRExcluir: TBitBtn;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Opes1: TMenuItem;
    ConfirmarBorder1: TMenuItem;
    VoltarConfirmao1: TMenuItem;
    DBText1: TDBText;
    Label3: TLabel;
    btEstornar: TBitBtn;
    Border1: TMenuItem;
    procedure btCRConsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBPanel2DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure btCRExcluirClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure ConfirmarBorder1Click(Sender: TObject);
    procedure VoltarConfirmao1Click(Sender: TObject);
    procedure btEstornarClick(Sender: TObject);
    procedure Border1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBorderoCad: TFBorderoCad;

implementation

uses UContaRecConsBordero, UBordero_cl, UContaCorrenteCons, UOracle_cl,
  UBorderoCons, UBancoAgencia_cl, UContasReceber_cl, UParamSistema_cl,
  UBorderoRel_cl, UBorderoParam, URBordero;

{$R *.dfm}

procedure TFBorderoCad.btCRConsClick(Sender: TObject);
var
  sql :string;
begin
  inherited;
  if DMBordero.QBorderoCab.State in [DSInsert, DSEdit] then
    DMBordero.QBorderoCab.Post;
  if DMBordero.QBorderoCab.RecordCount = 0 then
    Abort;
  if FContaRecConsBordero = Nil then
    FContaRecConsBordero := TFContaRecConsBordero.Create(Application);
  // Limpa a consulta anterior
  if DMBordero.CDSContaReceberCons.Active = true then
    DMBordero.CDSContaReceberCons.Active := false;
  if FContaRecConsBordero.ShowModal = MrOk then
  begin
    with DMBordero do
    begin
      CDSContaReceberCons.First;
      while not CDSContaReceberCons.Eof do
      begin
        if CDSContaReceberConsCHECADO.Value = 'SIM' then
        begin
          sql := 'UPDATE TB_CONTA_RECEBER_CAB SET COD_BORDERO = ' +
            QBorderoCabCOD_BORDERO.Text +
            ' WHERE COD_CONTA_RECEBER_CAB = ' +
            CDSContaReceberConsCOD_CONTA_RECEBER_CAB.Text;
          with DMOracle do
          begin
            try
              DBCemapa.StartTransaction;
              QExecSQL.SQL.Clear;
              QExecSQL.SQL.Add(sql);
              QExecSQL.ExecSQL;
              DBCemapa.Commit;
            Except
              DBCemapa.Rollback;
              MessageDlg('Erro ao gravar borderô', mtError, [mbOk],0);
            end;
          end;
        end;
        CDSContaReceberCons.Next;
      end;
      if QBorderoCab.RecordCount > 0 then
      begin
        QBorderoItem.Close;
        QBorderoItem.SetVariable('COD_BORDERO', QBorderoCabCOD_BORDERO.Text);
        QBorderoItem.Open;
      end;
    end;
  end;
end;

procedure TFBorderoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DSPrimario.DataSet.Open;
  DMBordero.QBorderoItem.Open;
end;

procedure TFBorderoCad.DBPanel2DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FContaCorrenteCons;
  Classe := TFContaCorrenteCons;
end;

procedure TFBorderoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if (DSPrimario.DataSet.State in [dsBrowse]) and
    (DSPrimario.DataSet.RecordCount > 0) then
  begin
    btCRCons.Enabled := true;
    btCRExcluir.Enabled := true;
  end
  else
    if DSPrimario.DataSet.State <> dsBrowse then
    begin
      btCRCons.Enabled := true;
      btCRExcluir.Enabled := true;
    end
    else
    begin
      btCRCons.Enabled := false;
      btCRExcluir.Enabled := false;
    end;
    MMCadSimples.Items[2].Items[0].Enabled :=
      (DMBordero.QBorderoCabIND_SITUACAO.Value = 'ABERTO');
    MMCadSimples.Items[2].Items[1].Enabled :=
      (DMBordero.QBorderoCabIND_SITUACAO.Value = 'FECHADO');
    btEstornar.Enabled :=
      (DMBordero.QBorderoCabIND_SITUACAO.Value = 'FECHADO');
    btCRCons.Enabled :=
      (DMBordero.QBorderoCabIND_SITUACAO.Value <> 'FECHADO');
    btCRExcluir.Enabled :=
      (DMBordero.QBorderoCabIND_SITUACAO.Value <> 'FECHADO');
end;

procedure TFBorderoCad.btCRExcluirClick(Sender: TObject);
var
  sql :String;
begin
  inherited;
  begin
    with DMBordero do
    begin
      if QBorderoItem.RecordCount > 0 then
      begin
        if (TBitBtn(Sender).Name = 'btEstornar') or (MessageDlg('Excluir esse título do borderô?', mtConfirmation,
          [mbYes, mbNo],0) = mrYes) then
        begin
          sql := 'UPDATE TB_CONTA_RECEBER_CAB SET COD_BORDERO = ' +
            'NULL' +
            ' WHERE COD_CONTA_RECEBER_CAB = ' +
            QBorderoItemcod_conta_receber_cab.Text;
          with DMOracle do
          begin
            try
              DBCemapa.StartTransaction;
              QExecSQL.Close;
              QExecSQL.SQL.Clear;
              QExecSQL.SQL.Add(sql);
              QExecSQL.ExecSQL;
              DBCemapa.Commit;
            Except
              DBCemapa.Rollback;
              MessageDlg('Erro ao excluir C.R. do borderô', mtError, [mbOk],0);
            end;
          end;
        end;
      QBorderoItem.Refresh;
      end;
    end;
  end;
end;

procedure TFBorderoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FBorderoCons = Nil then
    FBorderoCons := TFBorderoCons.Create(Application);
  if FBorderoCons.ShowModal = MrOk then
  begin
    MELocaliza.Text :=
      DMBordero.QBorderoConsCOD_BORDERO.Text;
    MELocalizaExit(Sender);
  end;
end;

procedure TFBorderoCad.ConfirmarBorder1Click(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_HISTORICO_BORDERO_TIT.Value = 0 then
  begin
    MessageDlg('Histórico de titulos borderô não cadastrado nos parâmetros do sistema', mtError,
      [mbOk],0);
    Abort;
  end;
  if DMParamSistema.QParamSistemaCOD_HISTORICO_BORDERO_JUROS.Value = 0 then
  begin
    MessageDlg('Histórico de juros borderô não cadastrado nos parâmetros do sistema', mtError,
      [mbOk],0);
    Abort;
  end;
  with DMBancoAgencia do
  begin
    with DMBordero do
    begin
      with DMContasReceber do
      begin
        if QBorderoItem.RecordCount > 0 then
        begin
          // Títulos borderô
          QBorderoItem.First;
          while not QBorderoItem.Eof do
          begin
            QContasReceber_Cab.Close;
            QContasReceber_Cab.SetVariable('PK', QBorderoItemCOD_CONTA_RECEBER_CAB.Text);
            QContasReceber_Cab.Open;

            IncluiBanco(DMParamSistema.QParamSistemaCOD_HISTORICO_BORDERO_TIT.Value,
              QBorderoCabCOD_CONTA_CORRENTE.Value,
              0,
              QContasReceber_CabCOD_CADASTRO.Value,
              QContasReceber_CabCOD_DEPARTAMENTO.Value,
              QBorderoCabDT_BORDERO.Value,
              QContasReceber_CabVAL_TITULO.Value,
              QContasReceber_CabDESC_OBSERVACAO.Value,
              '',
              '',
              QContasReceber_CabCOD_CONTA_RECEBER_CAB.Text,
              '',
              '',
              QBorderoCabCOD_BORDERO.Value);
              QBorderoItem.Next;
          end;
        end;
        // Juros borderô
        if QBorderoCabVAL_JUROS.Value > 0 then
        begin
          IncluiBanco(DMParamSistema.QParamSistemaCOD_HISTORICO_BORDERO_JUROS.Value,
            QBorderoCabCOD_CONTA_CORRENTE.Value,
            0,
            0,
            1,
            QBorderoCabDT_BORDERO.Value,
            QBorderoCabVAL_JUROS.Value,
            '',
            '',
            '',
            '',
            '',
            '',
            QBorderoCabCOD_BORDERO.Value);
        end;
        QBorderoCab.Edit;
        QBorderoCabIND_SITUACAO.Value := 'FECHADO';
        QBorderoCab.Post;
        MessageDlg('Operação Concluída', mtInformation,
          [mbOk],0);
        QContasReceber_Cab.Close;
      end;
    end;
  end;
end;

procedure TFBorderoCad.VoltarConfirmao1Click(Sender: TObject);
var
  sql :String;
begin
  inherited;
  sql := '';
  with DMBordero do
  begin
    with DMOracle do
    begin
      sql := 'DELETE FROM TB_BCO_MOVIMENTO WHERE' +
        ' COD_BORDERO = ' + QBorderoCabCOD_BORDERO.Text;
      try
        DBCemapa.StartTransaction;
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        QExecSQL.SQL.Add(sql);
        QExecSQL.ExecSQL;
        DBCemapa.Commit;
        QExecSQL.Close;
        QBorderoCab.BeforeEdit := nil;
        QBorderoCab.Edit;
        QBorderoCabIND_SITUACAO.Value := 'ABERTO';
        QBorderoCab.Post;
        QBorderoCab.BeforeEdit := QBorderoCabBeforeEdit;
        MessageDlg('Operação Concluída', mtInformation,
          [mbOk],0);
      Except
        DBCemapa.Rollback;
      end;
    end;
  end;
end;

procedure TFBorderoCad.btEstornarClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Debitar?', mtConfirmation, [mbYes, mbNo],0) = MrYes then
  begin
    if DMParamSistema.QParamSistemaCOD_HISTORICO_BORDERO_DEBITO.Value = 0 then
    begin
      MessageDlg('Histórico de débito borderô não cadastrado nos parâmetros do sistema', mtError,
        [mbOk],0);
      Abort;
    end;
    with DMBancoAgencia do
    begin
      with DMBordero do
      begin
        with DMContasReceber do
        begin
          if QBorderoItem.RecordCount > 0 then
          begin
            QContasReceber_Cab.Open;
            // Debito borderô
            QContasReceber_Cab.Close;
            QContasReceber_Cab.SetVariable('PK', QBorderoItemCOD_CONTA_RECEBER_CAB.Text);
            QContasReceber_Cab.Open;

            IncluiBanco(DMParamSistema.QParamSistemaCOD_HISTORICO_BORDERO_DEBITO.Value,
              QBorderoCabCOD_CONTA_CORRENTE.Value,
              0,
              QContasReceber_CabCOD_CADASTRO.Value,
              QContasReceber_CabCOD_DEPARTAMENTO.Value,
              QBorderoCabDT_BORDERO.Value,
              QContasReceber_CabVAL_TITULO.Value,
              QContasReceber_CabDESC_OBSERVACAO.Value,
              '',
              '',
              QContasReceber_CabCOD_CONTA_RECEBER_CAB.Text,
              '',
              '',
              QBorderoCabCOD_BORDERO.Value);

            btCRExcluirClick(TObject(Sender));
            QContasReceber_Cab.Edit;
            QContasReceber_Cab.CommitOnPost := true;
            QContasReceber_CabDESC_OBSERVACAO.Value :=
              QContasReceber_CabDESC_OBSERVACAO.Value +
              'DEB. borderô ' + QBorderoCabCOD_BORDERO.Text;
            QContasReceber_Cab.AfterPost := Nil;
            QContasReceber_Cab.Post;
            QContasReceber_Cab.AfterPost := QContasReceber_CabAfterPost;
            QContasReceber_Cab.CommitOnPost := false;
            QContasReceber_Cab.Close;
            MessageDlg('Operação Concluída', mtInformation,
              [mbOk],0);
          end
        end;
      end;
    end;
  end;
end;

procedure TFBorderoCad.Border1Click(Sender: TObject);
begin
  inherited;
  if FBorderoParam = nil then
    FBorderoParam := TFBorderoParam.Create(Application);
  FBorderoParam.PGRelatorio.Pages[0].TabVisible := True;
  if FBorderoParam.ShowModal = MrOk then
  begin
    with DMBorderoRel do
    begin
      QRBordero.Close;
      QRBordero.SetVariable('IND_SITUACAO', FBorderoParam.cbSituacao.Text);
      FBorderoParam.FmDatas1.ChecaDatasInformadas;
      QRBordero.SetVariable('DT_INICIAL', Trim(FBorderoParam.FmDatas1.MeDtInicial.Text));
      QRBordero.SetVariable('DT_FINAL', Trim(FBorderoParam.FmDatas1.MeDtFinal.Text));
      QRBordero.Open;
      if FRBordero = Nil then
        FRBordero := TFRBordero.Create(Application);
      if FBorderoParam.RGPreview.ItemIndex = 0 then
        FRBordero.QRPrimario.Preview
      else
        FRBordero.QRPrimario.Print;
    end;
  end;
end;

end.
