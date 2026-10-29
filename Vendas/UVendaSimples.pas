unit UVendaSimples;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DBPanel, DB, Buttons;

type
  TFVendaSimples = class(TForm)
    DsVendaSimplesItem: TDataSource;
    DsVendaSimples: TDataSource;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    GbProdutos: TGroupBox;
    DbGProdutos: TDBGrid;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    EBusca: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure DBPanel1DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel2DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure EBuscaChange(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
  private
    function ValidaCampos(Where: TComponent; ds: TDataSource = nil): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVendaSimples: TFVendaSimples;

implementation

uses UNotaSaida_cl, UPrazoVencimentoCons, UCadastroCons, UBiblioteca;

{$R *.dfm}

procedure TFVendaSimples.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  DMNotaSaida.CdVendaSimples.Close;
//  DMNotaSaida.CdVendaSimplesItem.Close;
end;

procedure TFVendaSimples.FormActivate(Sender: TObject);
begin
  DMNotaSaida.CdVendaSimples.Close;
  DMNotaSaida.CdVendaSimples.Open;
  DMNotaSaida.CdVendaSimples.EmptyDataSet;
  DMNotaSaida.CdVendaSimples.Append;
  DMNotaSaida.CdVendaSimplesItem.Close;
  DMNotaSaida.CdVendaSimplesItem.Open;
  DMNotaSaida.CdVendaSimplesItem.Filtered := False;
  DMNotaSaida.CdVendaSimplesItem.Filter := '';
  DMNotaSaida.CdVendaSimplesItem.First;
end;

procedure TFVendaSimples.DBPanel1DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFVendaSimples.DBPanel2DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  FormConsulta := @FPrazoVencimentoCons;
  Classe := TFPrazoVencimentoCons;
end;

procedure TFVendaSimples.EBuscaChange(Sender: TObject);
begin
  if Trim(EBusca.Text) = '' then
    DMNotaSaida.CdVendaSimplesItem.Filtered := False
  else
  begin
    DMNotaSaida.CdVendaSimplesItem.Filter := 'DESC_PRODUTO LIKE ' + QuotedStr('%' + Trim(EBusca.Text) + '%');
    DMNotaSaida.CdVendaSimplesItem.Filtered := True;
  end;
end;

function TFVendaSimples.ValidaCampos(Where: TComponent; ds: TDataSource = nil): Boolean;
  procedure ValidaComp(Comp: TComponent; var isValid: Boolean; var Msg: string);
  var
    str: string;
    i: Integer;
    c, First: TComponent;
  begin
    First := nil;
    for i := 0 to Comp.ComponentCount - 1 do
    begin
      c := Components[i];
      if (c is TDBPanel) and ((c as TDBPanel).DataSource = ds) and (not (c as TDBPanel).ReadOnly) then
      begin
        TDBPanel(c).Validate(isValid, str);
        if str <> '' then
          Msg := Trim(Msg + #13 + #10 + str);
        if (not Assigned(First)) and (not isValid) then
          First := c;
      end
      else
        if (c.ComponentCount > 0) then
          ValidaComp(c, isValid, Msg);
    end;
    if (Assigned(First)) and (First is TDBPanel) then
      with TDBPanel(First) do
        if Enabled and Visible and CanFocus then
          SetFocus;
  end;
var
  MsgValidacao: string;
begin
  Result := True;
  MsgValidacao := '';
  ValidaComp(Where, Result, MsgValidacao);
  if MsgValidacao <> '' then
  begin
    if Result then
      MessageDlg(MsgValidacao, mtWarning, [mbOK], 0)
    else
      MessageDlg(MsgValidacao, mtError, [mbOK], 0)
  end;
end;

procedure TFVendaSimples.BtOkClick(Sender: TObject);
begin
  if (not ValidaCampos(Self, DsVendaSimples)) then
    ModalResult := mrNone;
end;

end.

