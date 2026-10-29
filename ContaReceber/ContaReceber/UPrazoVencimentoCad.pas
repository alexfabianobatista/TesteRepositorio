unit UPrazoVencimentoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids;

type
  TFPrazoVencimentoCad = class(TFTCadSimples)
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Panel3: TPanel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    DBRadioGroup1: TDBRadioGroup;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    PrazodeVencimento1: TMenuItem;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    DbTipoPagto: TDBRadioGroup;
    Label22: TLabel;
    DBEdit22: TDBEdit;
    DBCBForaMes: TDBCheckBox;
    DBEdit5: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure PrazodeVencimento1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrazoVencimentoCad: TFPrazoVencimentoCad;

implementation

uses UPrazoVencimento_cl, UPrazoVencimentoCons, URPrazoVencimento,
  UParamSistema_cl;

{$R *.DFM}

procedure TFPrazoVencimentoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMPrazoVencimento.QPrazoVencimento.Open;
  DMPrazoVencimento.QPrazoVencimentoDias.Open;
  DMPrazoVencimento.QPrazoVencimentoDias_Cons.Open;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE') Or
     (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL') Then
     DbTipoPagto.Visible := True;
end;

procedure TFPrazoVencimentoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMPrazoVencimento.QPrazoVencimento.Close;
  DMPrazoVencimento.QPrazoVencimentoDias.Close;
  DMPrazoVencimento.QPrazoVencimentoDias_Cons.Close;
end;

procedure TFPrazoVencimentoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FPrazoVencimentoCons = Nil then
    FPrazoVencimentoCons:=TFPrazoVencimentoCons.Create(Application);
  If FPrazoVencimentoCons.ShowModal=mrOK then
  Begin
    With DMPrazoVencimento do
    Begin
       QPrazoVencimento.Close;
       QPrazoVencimento.SetVariable('PK',QPrazoVencimento_ConsCod_Prazo_Vencimento.Value);
       QPrazoVencimento.Open;
    End;
  End;
end;

procedure TFPrazoVencimentoCad.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  With DMPrazoVencimento do
  Begin
    QPrazoVencimentoDias.Close;
    QPrazoVencimentoDias.SetVariable('Cod_Prazo_Vencimento',QPrazoVencimentoDias_ConsCod_Prazo_Vencimento.Value);
    QPrazoVencimentoDias.SetVariable('Num_Dias',QPrazoVencimentoDias_ConsNum_Dias.Value);;
    QPrazoVencimentoDias.Open;
  End;
end;

procedure TFPrazoVencimentoCad.PrazodeVencimento1Click(Sender: TObject);
begin
  inherited;
  if FRPrazoVencimento = nil then
    FRPrazoVencimento := TFRPrazoVencimento.create(application);

  DMPrazoVencimento.QRPrazoVencimento.Close;
  DMPrazoVencimento.QRPrazoVencimento.open;

  FRPrazoVencimento.QRPrimario.Preview;
end;

end.
