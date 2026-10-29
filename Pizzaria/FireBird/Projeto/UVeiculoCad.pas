unit UVeiculoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, ImgList, IBCustomDataSet, IBUpdateSQL, IBDatabase, DB,
  IBQuery, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin,
  Mask, DBCtrls;

type
  TFVeiculoCad = class(TFPadrao)
    TBdscmarca: TStringField;
    TBdsccor: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEFoco: TDBEdit;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit6: TDBEdit;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    TBCODVEICULO: TIntegerField;
    TBDSCVEICULO: TIBStringField;
    TBCODMARCA: TIntegerField;
    TBANOFAB: TIntegerField;
    TBANOMODELO: TIntegerField;
    TBPLACA: TIBStringField;
    TBCODCOR: TIntegerField;
    TBVALORCOMPRA: TFloatField;
    TBVALORVENDA: TFloatField;
    MePlaca: TMaskEdit;
    TBCHASSI: TIBStringField;
    procedure TBCalcFields(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure TIncluirClick(Sender: TObject);
    procedure TEditarClick(Sender: TObject);
    procedure TGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVeiculoCad: TFVeiculoCad;

implementation

uses UFuncoes, UMarcaCad, UCorCad, UDmVeiculo, UDmMarca, UDmCor;

{$R *.dfm}

procedure TFVeiculoCad.TBCalcFields(DataSet: TDataSet);
begin
  inherited;
  TBdscmarca.Value := BuscaString('DSCMARCA', 'TB_MARCA', 'CODMARCA', TBCODMARCA.Value);
  TBdsccor.Value := BuscaString('DSCCOR', 'TB_COR', 'CODCOR', TBCODCOR.Value);
end;

procedure TFVeiculoCad.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFMarcaCad, FMarcaCad);
  FMarcaCad.Consultando := True;
  FMarcaCad.ShowModal;

  if RetornoConsulta > -1 then
    TBCODMARCA.Value := RetornoConsulta
  else
    TBCODMARCA.Clear;
end;

procedure TFVeiculoCad.FormCreate(Sender: TObject);
begin
  inherited;
  CampoRetorno := 'CODVEICULO';
end;

procedure TFVeiculoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if DmVeiculo.QSelVeiculo.Active then
  Begin
    DmVeiculo.QSelVeiculo.Close;
    DmVeiculo.QSelVeiculo.Open;
  End;
end;

procedure TFVeiculoCad.FormShow(Sender: TObject);
begin
  inherited;
  DmMarca.QSelMarca.Close;
  DmMarca.QSelMarca.Open;
  DmCor.QSelCor.Close;
  DmCor.QSelCor.Open;
end;

procedure TFVeiculoCad.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFCorCad, FCorCad);
  FCorCad.Consultando := True;
  FCorCad.ShowModal;

  if RetornoConsulta > -1 then
    TBCODCOR.Value := RetornoConsulta
  else
    TBCODCOR.Clear;
end;

procedure TFVeiculoCad.TIncluirClick(Sender: TObject);
begin
  inherited;
  MePlaca.Clear;
end;

procedure TFVeiculoCad.TEditarClick(Sender: TObject);
begin
  inherited;
  MePlaca.Text := TBPLACA.Text;
end;

procedure TFVeiculoCad.TGravarClick(Sender: TObject);
begin
  if TBDSCVEICULO.Value = '' then
  Begin
    MessageDlg('Informe a Descrição.', mtWarning, [mbOK], 0);
    DBEFoco.SetFocus;
    Exit;
  End;

  if (TBCODMARCA.IsNull) or (TBCODMARCA.Text = '') then
  Begin
    MessageDlg('Informe a Marca.', mtWarning, [mbOK], 0);
    DBEdit6.SetFocus;
    Exit;
  End;

  if (TBCODCOR.IsNull) or (TBCODCOR.Text = '') then
  Begin
    MessageDlg('Informe a Cor.', mtWarning, [mbOK], 0);
    DBEdit2.SetFocus;
    Exit;
  End;

  if TBANOFAB.IsNull then
  Begin
    MessageDlg('Informe o Ano de Fabricação.', mtWarning, [mbOK], 0);
    DBEdit3.SetFocus;
    Exit;
  End;

  if TBANOMODELO.IsNull then
  Begin
    MessageDlg('Informe o Ano do Modelo.', mtWarning, [mbOK], 0);
    DBEdit4.SetFocus;
    Exit;
  End;

  if TBCHASSI.Value = '' then
  Begin
    MessageDlg('Informe o Chassi.', mtWarning, [mbOK], 0);
    DBEdit5.SetFocus;
    Exit;
  End;

  if Trim(MePlaca.Text) = '-' then
  Begin
    MessageDlg('Informe a Placa.', mtWarning, [mbOK], 0);
    MePlaca.SetFocus;
    Exit;
  End;
  TBPLACA.Text := MePlaca.Text;

  if TB.State = dsInsert then
  Begin
    TBVALORCOMPRA.Value := 0;
    TBVALORVENDA.Value := 0;
  End;

  inherited;

end;

end.
