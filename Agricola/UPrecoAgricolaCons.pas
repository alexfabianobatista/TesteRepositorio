unit UPrecoAgricolaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFPrecoAgricolaCons = class(TFTConsulta)
    Label2: TLabel;
    MeData: TMaskEdit;
    BtConsProduto: TBitBtn;
    Label3: TLabel;
    MeFilial: TMaskEdit;
    BtConsFilial: TBitBtn;
    procedure BtConsProdutoClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrecoAgricolaCons: TFPrecoAgricolaCons;

implementation

uses UPrecoAgricola_cl, UProdutoCons, UProduto_cl, UFilialCons, UFilial_cl;

{$R *.DFM}

procedure TFPrecoAgricolaCons.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK Then
     MeTexto.Text := DMProduto.QProdutoConsCod_Produto.Text;
end;

procedure TFPrecoAgricolaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPrecoAgricola Do
  Begin
    QPrecoAgricola_Cons.Close;
    If Trim(MeTexto.Text) <> '' Then
       QPrecoAgricola_Cons.SetVariable('Cod_Produto',StrToInt(Trim(MeTexto.Text)))
    else
       QPrecoAgricola_Cons.SetVariable('Cod_Produto',Null);
    If Trim(MeFilial.Text) <> '' Then
       QPrecoAgricola_Cons.SetVariable('Cod_Filial',StrToInt(Trim(MeFilial.Text)))
    else
       QPrecoAgricola_Cons.SetVariable('Cod_Filial',Null);
    QPrecoAgricola_Cons.SetVariable('Cod_Lote_Tipo',Null);
    QPrecoAgricola_Cons.SetVariable('Dt_Preco_Agricola',strToDate(MeData.Text));
    QPrecoAgricola_Cons.Open;
  End;
end;

procedure TFPrecoAgricolaCons.FormActivate(Sender: TObject);
begin
  inherited;
  MeData.Text := DateToStr(Date);
end;

procedure TFPrecoAgricolaCons.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK Then
     MeFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

end.
