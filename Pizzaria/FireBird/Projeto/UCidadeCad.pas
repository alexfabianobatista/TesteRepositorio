unit UCidadeCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, ImgList, IBCustomDataSet, IBUpdateSQL, IBDatabase, DB,
  IBQuery, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin,
  Mask, DBCtrls;

type
  TFCidadeCad = class(TFPadrao)
    TBCODCIDADE: TIntegerField;
    TBDSCCIDADE: TIBStringField;
    TBCODESTADO: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEFoco: TDBEdit;
    Label6: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    SpeedButton2: TSpeedButton;
    DBEdit3: TDBEdit;
    TBdscestado: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TBCalcFields(DataSet: TDataSet);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCidadeCad: TFCidadeCad;

implementation

uses UDmEstado, UDmCidade, UFuncoes, UEstadoCad;

{$R *.dfm}

procedure TFCidadeCad.FormCreate(Sender: TObject);
begin
  inherited;
  CampoRetorno := 'CODCIDADE';
end;

procedure TFCidadeCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if DmCidade.QSelCidade.Active then
  Begin
    DmCidade.QSelCidade.Close;
    DmCidade.QSelCidade.Open;
  End;
end;

procedure TFCidadeCad.TBCalcFields(DataSet: TDataSet);
begin
  inherited;
  TBdscestado.Value := BuscaString('DSCESTADO', 'TB_ESTADO', 'CODESTADO', TBCODESTADO.Value);
end;

procedure TFCidadeCad.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFEstadoCad, FEstadoCad);
  FEstadoCad.Consultando := True;
  FEstadoCad.ShowModal;

  if RetornoConsulta > -1 then
    TBCODESTADO.Value := RetornoConsulta
  else
    TBCODESTADO.Clear;
end;

procedure TFCidadeCad.FormShow(Sender: TObject);
begin
  inherited;
  DmEstado.QSelEstado.Close;
  DmEstado.QSelEstado.Open;
end;

procedure TFCidadeCad.TGravarClick(Sender: TObject);
begin
  if TBDSCCIDADE.Value = '' then
  Begin
    MessageDlg('Informe a Descrição.', mtWarning, [mbOK], 0);
    DBEFoco.SetFocus;
    Exit;
  End;

  if (TBCODESTADO.IsNull) or (TBCODESTADO.Text = '') then
  Begin
    MessageDlg('Informe o Estado.', mtWarning, [mbOK], 0);
    DBEdit3.SetFocus;
    Exit;
  End;

  inherited;

end;

end.
