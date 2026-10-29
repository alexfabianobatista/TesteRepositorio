unit UContasReceberVoltaTitEnviado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, Grids, DBGrids, ExtCtrls, Db, Variants;

type
  TFContasReceberTituloEnviado = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    MECodFilial: TMaskEdit;
    SpeedButton3: TSpeedButton;
    EdDescFilial: TMaskEdit;
    GroupBox7: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    MEInicial: TMaskEdit;
    MEFinal: TMaskEdit;
    Label110: TLabel;
    MECodBanco: TMaskEdit;
    SBContaCorrenteCons: TSpeedButton;
    MEDescBanco: TMaskEdit;
    Panel2: TPanel;
    BtnMostrarTitulosEnviados: TBitBtn;
    BtnVoltarSituacaoTitulosEnviados: TBitBtn;
    DSTituloEnviado: TDataSource;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MeVctoInicial: TMaskEdit;
    MeVctoFinal: TMaskEdit;
    procedure SpeedButton3Click(Sender: TObject);
    procedure MECodFilialChange(Sender: TObject);
    procedure SBContaCorrenteConsClick(Sender: TObject);
    procedure MECodBancoChange(Sender: TObject);
    procedure BtnMostrarTitulosEnviadosClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnVoltarSituacaoTitulosEnviadosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContasReceberTituloEnviado: TFContasReceberTituloEnviado;

implementation

uses UFilialCons, UContasReceber_cl, UFilial_cl, UContaCorrenteCons,
  UOracle_cl, UBancoAgencia_cl, UUsuario_cl, UBancosCons;

{$R *.DFM}

procedure TFContasReceberTituloEnviado.SpeedButton3Click(Sender: TObject);
begin
  if FFilialCons = nil then
     FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
     MECodFilial.Text := DMFilial.QFilialConsCod_filial.Text;
end;

procedure TFContasReceberTituloEnviado.MECodFilialChange(Sender: TObject);
begin
  if Trim(MECodFilial.Text)<>'' then
     EdDescFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial.Text)
  else
     EdDescFilial.Text := '';
end;

procedure TFContasReceberTituloEnviado.SBContaCorrenteConsClick(
  Sender: TObject);
begin
  if FBancosCons = nil then
     FBancosCons := TFBancosCons.Create(Application);
  if FBancosCons.ShowModal = mrOk then
     MECodBanco.Text:= DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.AsString;
end;

procedure TFContasReceberTituloEnviado.MECodBancoChange(
  Sender: TObject);
begin
  if Trim(MECodBanco.Text) <> '' then
     MEDescBanco.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+MECodBanco.Text)
  else
     MEDescBanco.Text:= '';
end;

procedure TFContasReceberTituloEnviado.BtnMostrarTitulosEnviadosClick(
  Sender: TObject);
begin
  DmUsuario.Checar_Filial_Usuario( Trim(MECodFilial.text),'CONTAS A RECEBER');
  if ( Trim(MECodFilial.Text) <> '' ) and ( Trim(MECodBanco.Text) <> '' ) and
     ( Trim(MeVctoInicial.Text) <> '' )   and ( Trim(MeVctoFinal.Text) <> '' ) then
  begin
    with DMContasReceber do
    begin
      QTitulosEnviadosMudaStatus.Close;
      QTitulosEnviadosMudaStatus.SetVariable('COD_FILIAL',MECodFilial.Text);
      QTitulosEnviadosMudaStatus.SetVariable('COD_BANCO',MeCodBanco.Text);
      If Trim(MEInicial.Text) <> '' Then
         QTitulosEnviadosMudaStatus.SetVariable('DT_INICIAL',MEInicial.Text)
      else
         QTitulosEnviadosMudaStatus.SetVariable('DT_INICIAL',Null);
      If Trim(MEFinal.Text) <> '' Then
         QTitulosEnviadosMudaStatus.SetVariable('DT_FINAL',MEFinal.Text)
      else
         QTitulosEnviadosMudaStatus.SetVariable('DT_FINAL',Null);
      QTitulosEnviadosMudaStatus.SetVariable('DT_VCTO_INICIAL',MeVctoInicial.Text);
      QTitulosEnviadosMudaStatus.SetVariable('DT_VCTO_FINAL',MeVctoFinal.Text);
      QTitulosEnviadosMudaStatus.Open;
    end;
  end
  else
     MessageDlg('Todos os parametros devem ser informados!',mtWarning,[mbOk],0);   
end;

procedure TFContasReceberTituloEnviado.DBGrid1DblClick(Sender: TObject);
begin
  with DMContasReceber do
  begin
    if QTitulosEnviadosMudaStatusCOD_CONTA_RECEBER_CAB.Value > 0 then
    begin
      try
        if DMOracle.DBCemapa.InTransaction = False then
           DMOracle.DBCemapa.StartTransaction;
        QEnviadoBancoVolta.Close;
        QEnviadoBancoVolta.SetVariable('COD_CONTA_RECEBER_CAB',QTitulosEnviadosMudaStatusCOD_CONTA_RECEBER_CAB.Value);
        QEnviadoBancoVolta.ExecSQL;
        DMOracle.DBCemapa.Commit;
        QTitulosEnviadosMudaStatus.Close;
        QTitulosEnviadosMudaStatus.Open;
      except
        DMOracle.DBCemapa.Rollback;
        raise exception.Create('Erro ao tentar atualizar registro no Contas a Receber!');
      end;
    end;
  end;
end;

procedure TFContasReceberTituloEnviado.BtnVoltarSituacaoTitulosEnviadosClick(
  Sender: TObject);
begin
  with DMContasReceber do
  begin
    try
      if DMOracle.DBCemapa.InTransaction = False then
         DMOracle.DBCemapa.StartTransaction;

      while not QTitulosEnviadosMudaStatus.Eof do
      begin
        QEnviadoBancoVolta.Close;
        QEnviadoBancoVolta.SetVariable('COD_CONTA_RECEBER_CAB',QTitulosEnviadosMudaStatusCOD_CONTA_RECEBER_CAB.Value);
        QEnviadoBancoVolta.ExecSQL;
        QTitulosEnviadosMudaStatus.Next;
      end;
      DMOracle.DBCemapa.Commit;
      QTitulosEnviadosMudaStatus.Close;
      QTitulosEnviadosMudaStatus.Open;
    except
      DMOracle.DBCemapa.Rollback;
      raise exception.Create('Erro ao tentar atualizar registro no Contas a Receber!');
    end;
  end;
end;

end.
