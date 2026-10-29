unit UItemHTML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Spin, Buttons;

type
  TFItemHTML = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    CBItem: TComboBox;
    Label1: TLabel;
    PCOpcoes: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    SEArtigoSubtextos: TSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    CBArtigoAlinhamento: TComboBox;
    Label4: TLabel;
    SETabelaLinhas: TSpinEdit;
    Label5: TLabel;
    SETabelaColunas: TSpinEdit;
    Label6: TLabel;
    CBCartaoLadoImagem: TComboBox;
    SBConclusao: TScrollBox;
    Label7: TLabel;
    SENumVezes: TSpinEdit;
    Label8: TLabel;
    BtnAdicionar: TBitBtn;
    TabSheet4: TTabSheet;
    Label9: TLabel;
    SEExposicaoItens: TSpinEdit;
    CBExposicaoMostrarPreco: TCheckBox;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    CBComRedesSociais: TCheckBox;
    CBFundo: TComboBox;
    Label10: TLabel;
    Label11: TLabel;
    CBCorDaLetra: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure CBItemChange(Sender: TObject);
    procedure BtnAdicionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FItemHTML: TFItemHTML;

implementation

{$R *.dfm}

procedure TFItemHTML.FormCreate(Sender: TObject);
begin
  CBItem.ItemIndex := 0;
  PCOpcoes.Pages[0].TabVisible := False;
  PCOpcoes.Pages[1].TabVisible := False;
  PCOpcoes.Pages[2].TabVisible := False;
  PCOpcoes.Pages[3].TabVisible := False;
  PCOpcoes.Pages[4].TabVisible := False;
  PCOpcoes.Pages[5].TabVisible := False;
  SBConclusao.Visible := False;
end;

procedure TFItemHTML.CBItemChange(Sender: TObject);
begin
  PCOpcoes.ActivePageIndex := CBItem.ItemIndex-1;
  SBConclusao.Visible := True;
end;

procedure TFItemHTML.BtnAdicionarClick(Sender: TObject);
begin
  Self.ModalResult := mrOk;
end;

end.
