unit UPragaCulturaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, Variants;

type
  TFPragaCulturaCons = class(TForm)
    Label2: TLabel;
    Label4: TLabel;
    MeCultura: TMaskEdit;
    BitBtn5: TBitBtn;
    MePraga: TMaskEdit;
    BitBtn2: TBitBtn;
    EdPraga: TEdit;
    EdProduto: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    EdCultura: TEdit;
    procedure BitBtn5Click(Sender: TObject);
    procedure MeCulturaExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MePragaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPragaCulturaCons: TFPragaCulturaCons;

implementation

uses UCulturaCons, UCultura_cl, UPragaCons, UPraga_cl, UNotaSaida_cl,
  UPragaCulturaSelect;

{$R *.DFM}

procedure TFPragaCulturaCons.BitBtn5Click(Sender: TObject);
begin
  If FCulturaCons = nil then
     FCulturaCons := TFCulturaCons.Create(Application);
  If FCulturaCons.ShowModal = mrOK then
  begin
     MeCultura.Text := DMCultura.QCulturaConsCod_Cultura.Text;
     MeCulturaExit(Self)
  end;

end;

procedure TFPragaCulturaCons.MeCulturaExit(Sender: TObject);
begin
  If Trim(MECultura.Text) <> '' Then
  With DMCultura do
  Begin
    QCultura.Close;
    QCultura.SetVariable('PK',MECultura.Text);
    QCultura.Open;
    EdCultura.Text := QCulturaDesc_Cultura.Text;

    DMPraga.QPragaProdutoCons.Close;
    DMPraga.QPragaProdutoCons.SetVariable('COD_CULTURA', QCulturaCOD_CULTURA.Value);
    DMPraga.QPragaProdutoCons.Open;

    if DMPraga.QPragaProdutoCons.RecordCount = 1 then
    begin
      MePraga.Text := DMPraga.QPragaProdutoConsCOD_PRAGA.Text;
      MePragaExit(Sender);
    end;

    if DMPraga.QPragaProdutoCons.RecordCount > 1 then
    begin
      if FPragaCulturaSelect = Nil then
        FPragaCulturaSelect := TFPragaCulturaSelect.Create(Application);
      if FPragaCulturaSelect.ShowModal = mrOk then
      begin
        MePraga.Text := DMPraga.QPragaProdutoConsCOD_PRAGA.Text;
        MePragaExit(Sender);
      end;
    end;
       
  End
  Else
    EDCultura.Text := 'Informar Cultura';

end;

procedure TFPragaCulturaCons.BitBtn2Click(Sender: TObject);
begin
  If FPragaCons = nil then
     FPragaCons := TFPragaCons.Create(Application);
  If FPragaCons.ShowModal = mrOK then
  begin
     MePraga.Text := DMPraga.QPragaConsCod_Praga.Text;
     MePragaExit(Self)
  end;

end;

procedure TFPragaCulturaCons.MePragaExit(Sender: TObject);
begin
  If Trim(MEPraga.Text) <> '' Then
  With DMPraga do
  Begin
    QPraga.Close;
    QPraga.SetVariable('PK',MEPraga.Text);
    QPraga.Open;
    EdPraga.Text := QPragaDesc_Praga.Text
  End
  Else
    EDPraga.Text := 'Informar Praga';

end;

end.
