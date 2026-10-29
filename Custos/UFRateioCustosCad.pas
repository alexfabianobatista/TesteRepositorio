unit UFRateioCustosCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls;

type
  TFRateioCustosCad = class(TFTCadSimples)
    Panel3: TPanel;
    SB_DepartamentoOrigemCons: TSpeedButton;
    SB_HistoricoCons: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    SB_FilialOrigemCons: TSpeedButton;
    Label1: TLabel;
    SBFilialDestinoCons: TSpeedButton;
    Label5: TLabel;
    SBDepartamentoDestinoCons: TSpeedButton;
    Bevel1: TBevel;
    Label7: TLabel;
    EdDescDepartamentoOrigem: TEdit;
    EdDescHistorico: TEdit;
    DBECodDepartamentoOrigem: TDBEdit;
    DBECodHistorico: TDBEdit;
    DBEPercentual: TDBEdit;
    DBECodFilialOrigem: TDBEdit;
    EdDescFilialOrigem: TEdit;
    DBECodFilialDestino: TDBEdit;
    EdDescFilialDestino: TEdit;
    DBECodDepartamentoDestino: TDBEdit;
    EdDescDepartamentoDestino: TEdit;
    DBEdit1: TDBEdit;
    procedure DBECodFilialOrigemExit(Sender: TObject);
    procedure SB_FilialOrigemConsClick(Sender: TObject);
    procedure DBECodDepartamentoOrigemExit(Sender: TObject);
    procedure SB_DepartamentoOrigemConsClick(Sender: TObject);
    procedure DBECodHistoricoExit(Sender: TObject);
    procedure SB_HistoricoConsClick(Sender: TObject);
    procedure DBECodFilialDestinoExit(Sender: TObject);
    procedure DBECodDepartamentoDestinoExit(Sender: TObject);
    procedure SBDepartamentoDestinoConsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRateioCustosCad: TFRateioCustosCad;

implementation

uses UDMCustos, UOracle_cl, UFilial_cl, UDepartamentoCons, UDepartamento_cl,
  UFilialCons, UHistoricoCons, UHistorico_cl;

{$R *.DFM}

procedure TFRateioCustosCad.DBECodFilialOrigemExit(Sender: TObject);
begin
  inherited;
  if Trim(DBECodFilialOrigem.Text) <> '' then
     EdDescFilialOrigem.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                        'COD_FILIAL = '+DBECodFilialOrigem.Text)
  else
  begin
    MessageDlg('Informe um código valido para filial',mtInformation,[mbOk],0);
    DBECodFilialOrigem.SetFocus;
  end;

end;

procedure TFRateioCustosCad.SB_FilialOrigemConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);

  if FFilialCons.ShowModal = mrOk then
  begin
    EdDescFilialOrigem.Text := DMFilial.QFilialConsDESC_FILIAL.Value;
    DBECodFilialOrigem.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  end;
end;

procedure TFRateioCustosCad.DBECodDepartamentoOrigemExit(Sender: TObject);
begin
  inherited;
  if Trim(DBECodDepartamentoOrigem.Text) <> '' then
  begin
    EdDescDepartamentoOrigem.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO',
                                        'COD_DEPARTAMENTO = '+DBECodDepartamentoOrigem.Text);
    if EdDescDepartamentoOrigem.Text = '' then
       DBECodDepartamentoOrigem.Text := '';
  end;
end;

procedure TFRateioCustosCad.SB_DepartamentoOrigemConsClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
     FDepartamentoCons := TFDepartamentoCons.Create(Application);

  if FDepartamentoCons.ShowModal = mrOk then
  begin
    EdDescDepartamentoOrigem.Text := DMDepartamento.QDepartamentoConsDESC_DEPARTAMENTO.Value;
    DBECodDepartamentoOrigem.Text := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Text;
  end;
end;

procedure TFRateioCustosCad.DBECodHistoricoExit(Sender: TObject);
begin
  inherited;
  if DBECodHistorico.Text <> '' then
     EdDescHistorico.Text := DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO',
                                        'COD_HISTORICO = '+FRateioCustosCad.DBECodHistorico.Text);
  begin
    if Trim(EdDescHistorico.Text) = '' then
       raise exception.Create('Código histórico invalido ou não encontrado!');
  end;
end;

procedure TFRateioCustosCad.SB_HistoricoConsClick(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = nil then
     FHistoricoCons := TFHistoricoCons.Create(Application);

  if FHistoricoCons.ShowModal = mrOk then
  begin
    EdDescHistorico.Text := DMHistorico.QHistoricoConsDESC_HISTORICO.Value;
    DBECodHistorico.Text := DMHistorico.QHistoricoConsCOD_HISTORICO.Text;
  end;
end;

procedure TFRateioCustosCad.DBECodFilialDestinoExit(Sender: TObject);
begin
  inherited;
  if Trim(DBECodFilialDestino.Text) <> '' then
     EdDescFilialDestino.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                        'COD_FILIAL = '+DBECodFilialDestino.Text)
  else
  begin
    MessageDlg('Informe um código valido para filial',mtInformation,[mbOk],0);
    DBECodFilialDestino.SetFocus;
  end;
end;

procedure TFRateioCustosCad.DBECodDepartamentoDestinoExit(Sender: TObject);
begin
  inherited;
  if Trim(DBECodDepartamentoDestino.Text) <> '' then
  begin
    EdDescDepartamentoDestino.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO',
                                        'COD_DEPARTAMENTO = '+DBECodDepartamentoDestino.Text);
    if EdDescDepartamentoDestino.Text = '' then
       DBECodDepartamentoDestino.Text := '';
  end;
end;

procedure TFRateioCustosCad.SBDepartamentoDestinoConsClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
     FDepartamentoCons := TFDepartamentoCons.Create(Application);

  if FDepartamentoCons.ShowModal = mrOk then
  begin
    EdDescDepartamentoDestino.Text := DMDepartamento.QDepartamentoConsDESC_DEPARTAMENTO.Value;
    DBECodDepartamentoDestino.Text := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Text;
  end;
end;

end.
