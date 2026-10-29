unit UDescontoAgricolaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, variants;

type
  TFDescontoAgricolaCons = class(TFTConsulta)
    Label59: TLabel;
    MeFilial: TMaskEdit;
    SpeedButton35: TSpeedButton;
    MeDescFilial: TMaskEdit;
    BitBtn3: TBitBtn;
    EdProduto: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
    procedure MeFilialExit(Sender: TObject);
    procedure SpeedButton35Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure METextoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDescontoAgricolaCons: TFDescontoAgricolaCons;

implementation

uses UDescontoAgricola_cl, UOracle_cl, UFilialCons, UFilial_cl, UUsuario_cl,
  UProdutoCons, UProduto_cl;

{$R *.DFM}

procedure TFDescontoAgricolaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(MeFilial.Text),'AGRICOLA');
  With DmDescontoAgricola do
  Begin
    QDescAgrCons.Close;
    If Trim(MeTexto.Text) <> '' Then
       QdescAgrCons.SetVariable('COD_PRODUTO',Trim(MeTexto.Text))
    else
       QdescAgrCons.SetVariable('COD_PRODUTO',Null);
    If Trim(MeFilial.Text) <> '' Then
       QdescAgrCons.SetVariable('COD_FILIAL',Trim(MeFilial.Text))
    Else
       QdescAgrCons.SetVariable('COD_FILIAL',Null);
    QDescAgrCons.Open;
  end;
end;

procedure TFDescontoAgricolaCons.MeFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(MeFilial.text) <> '' then
    MeDescFilial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MEFilial.text)
  else
    MeDescFilial.text:='Todos';

end;

procedure TFDescontoAgricolaCons.SpeedButton35Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil  then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal  = mrOK then
    begin
      MEFilial.text := DMfilial.QFilialConsCod_filial.text;
      MEFilialExit(Self);
    end;
end;

procedure TFDescontoAgricolaCons.BitBtn3Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
  begin
     METexto.Text := DMProduto.QProdutoConsCod_Produto.Text;
     METextoExit(Self);
  end;

end;

procedure TFDescontoAgricolaCons.METextoExit(Sender: TObject);
begin
  inherited;
  If Trim(METexto.Text) <> '' Then
     EdProduto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Trim(METexto.text))
  Else
     EdProduto.Text := 'Todos';

end;

end.
